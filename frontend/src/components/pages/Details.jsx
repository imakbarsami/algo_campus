import React, { use, useState } from 'react'
import Layout from '../common/Layout'
import { Rating } from 'react-simple-star-rating'
import ReactPlayer from 'react-player'
import { Accordion, Badge, ListGroup, Card } from "react-bootstrap";
import { apiUrl, convertMinutesToHours, token } from '../common/Config'
import { Link, useNavigate, useParams } from 'react-router-dom';
import { LuMonitorPlay } from "react-icons/lu";
import Loader from '../common/Loader';
import FreePreview from '../common/FreePreview';
import { toast } from 'react-hot-toast';
import { set } from 'react-hook-form';


const Details = () => {

  const [rating, setRating] = useState(4.0)
  const [course, setCourse] = useState(null)
  const [loading, setLoading] = useState(true)
  const [reviews, setReviews] = useState([])
  const [reviewCount, setReviewCount] = useState(0)
  const navigate = useNavigate()
  const params = useParams()


  //free preview modal
  const [lessonData, setLessonData] = useState(null)
  const [show, setShow] = useState(false);
  const handleClose = () => setShow(false);
  const handleShow = (lesson) => {
    setShow(true)
    setLessonData(lesson)
  };


  const courseDetails = () => {
    setLoading(true)
    fetch(`${apiUrl}/course/${params.id}`, {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }
    }).then(res => res.json())
      .then(result => {
        setLoading(false)
        if (result.status == 200) {
          setCourse(result.data)
          setReviews(result.data.reviews)
          setReviewCount(result.data.reviews_count)
        }
      })
  }


  //enroll course
  const handleEnroll = async () => {

    var data = {
      course_id: course.id
    }

    await fetch(`${apiUrl}/enroll-course`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': `Bearer ${token}`
      },
      body: JSON.stringify(data)
    }).then(async res => {
      const result = await res.json()
      return {
        status: res.status,
        data: result
      }
    })
      .then(({ status, data }) => {
        if (status == 200) {
          toast.success(data.message)
        } else if (status == 401) {
          toast.error("Unauthorized! Please login first")
          navigate('/account/login')
        } else {
          toast.error(data.message)
        }
      })
  }


  React.useEffect(() => {
    courseDetails()
  }, [])


  //console.log(reviews);
  //console.log(course.level.name);

  return (
    <Layout>
      {
        lessonData && <FreePreview
          show={show}
          handleClose={handleClose}
          lessonData={lessonData}
        />
      }
      {
        loading && <div className="mt-5"><Loader /></div>
      }
      {
        !loading && course &&
        <div className='container pb-5 pt-3'>
          <nav aria-label="breadcrumb">
            <ol className="breadcrumb">
              <li className="breadcrumb-item"><a href="/">Home</a></li>
              <li className="breadcrumb-item"><a href="/courses">Courses</a></li>
              <li className="breadcrumb-item active" aria-current="page">{course.title}</li>
            </ol>
          </nav>
          <div className='row my-5'>
            <div className='col-lg-8'>
              <h2>{course.title}</h2>
              <div className='d-flex'>
                <div className='mt-1'>
                  <span className="badge bg-green">{course.category.name}</span>
                </div>
                <div className='d-flex ps-3'>
                  <div className="text pe-2 pt-1">{course.avg_rating ? course.avg_rating : 0}</div>
                  <Rating initialValue={course.avg_rating ? course.avg_rating : 0} allowFraction size={20} readonly />
                </div>
              </div>
              <div className="row mt-4">
                {/* <div className="col">
                            <span className="text-muted d-block">Last Updates</span>
                            <span className="fw-bold">Aug 2021</span>
                        </div> */}
                <div className="col">
                  <span className="text-muted d-block">Level</span>
                  <span className="fw-bold">{course.level.name}</span>
                </div>
                <div className="col">
                  <span className="text-muted d-block">Students</span>
                  <span className="fw-bold">{course.enrollments_count ? course.enrollments_count : 0}</span>
                </div>
                <div className="col">
                  <span className="text-muted d-block">Language</span>
                  <span className="fw-bold">{course.language.name}</span>
                </div>
              </div>
              <div className='row'>
                <div className='col-md-12 mt-4'>
                  <div className='border bg-white rounded-3 p-4'>
                    <h3 className='mb-3  h4'>Overview</h3>
                    <p>{course.description}</p>
                  </div>
                </div>
                <div className='col-md-12 mt-4'>
                  <div className='border bg-white rounded-3 p-4'>
                    <h3 className='mb-3 h4'>What you will learn</h3>
                    <ul className="list-unstyled mt-3">
                      {
                        course.outcomes && course.outcomes.map((outcome, index) => {
                          return (
                            <li key={index} className="d-flex align-items-center mb-2">
                              <span className="text-success me-2">&#10003;</span>
                              <span>{outcome.text}</span>
                            </li>
                          )
                        })
                      }
                    </ul>
                  </div>
                </div>

                <div className='col-md-12 mt-4'>
                  <div className='border bg-white rounded-3 p-4'>
                    <h3 className='mb-3 h4'>Requirements</h3>
                    <ul className="list-unstyled mt-3">
                      {
                        course.requirements && course.requirements.map((requirement, index) => {
                          return (
                            <li key={index} className="d-flex align-items-center mb-2">
                              <span className="text-success me-2">&#10003;</span>
                              <span>{requirement.text}</span>
                            </li>
                          )
                        })
                      }
                    </ul>
                  </div>
                </div>

                <div className='col-md-12 mt-4'>
                  <div className='border bg-white rounded-3 p-4'>
                    <h3 className="h4 mb-3">Course Structure</h3>
                    <p>
                      {course.chapters_count} Chapters • {course.total_lessons} Lectures • {convertMinutesToHours(course.total_duration)}
                    </p>
                    <Accordion defaultActiveKey="0" id="courseAccordion">
                      {
                        course.chapters && course.chapters.map((chapter, index) => {
                          return (
                            <Accordion.Item eventKey={index} key={index}>
                              <Accordion.Header>
                                {chapter.title} <span className="ms-3 text-muted">({chapter.lessons_count} lectures - {convertMinutesToHours(chapter.lessons_sum_duration)})</span>
                              </Accordion.Header>
                              <Accordion.Body>
                                <ListGroup>
                                  {
                                    chapter.lessons && chapter.lessons.map((lesson, index) => {
                                      return (
                                        <ListGroup.Item key={index}>
                                          <div className='row'>

                                            <div className="col-md-9">
                                              <LuMonitorPlay className='me-2' />
                                              {lesson.title}

                                            </div>

                                            <div className='col-md-3'>
                                              <div className="d-flex justify-content-end">
                                                {lesson.is_free_premium == 'yes' && (
                                                  <Badge bg="primary">
                                                    <Link onClick={() => handleShow(lesson)} className="text-white text-decoration-none">Preview</Link>
                                                  </Badge>
                                                )}

                                                <span className="text-muted ms-2">{convertMinutesToHours(lesson.duration)}</span>
                                              </div>

                                            </div>
                                          </div>
                                        </ListGroup.Item>
                                      )
                                    })
                                  }

                                </ListGroup>
                              </Accordion.Body>
                            </Accordion.Item>
                          )
                        })
                      }

                    </Accordion>
                  </div>
                </div>

                { 
                  reviewCount>0 && (
                    <div className='col-md-12 mt-4'>
                      <div className='border bg-white rounded-3 p-4'>
                        <h3 className='mb-3 h4'>Reviews</h3>
                        <p>Our student says about this course</p>

                        <div className='mt-4'>

                          {
                            reviews && reviews.map(review => {
                              return (
                                <div className="d-flex align-items-start mb-4 border-bottom pb-3" key={review.id}>
                                  <div>
                                    <h6 className="mb-0">{review.user.name} <span className="text-muted fs-6 ms-2">{review.created_at}</span></h6>
                                    <div className="text-warning mb-2">
                                      <Rating initialValue={review.rating} size={20} readonly />
                                    </div>
                                    <p className="mb-0">{review.comment}</p>
                                  </div>
                                </div>
                              )
                            })
                          }

                        </div>
                      </div>
                    </div>
                  )
                }

              </div>
            </div>
            <div className='col-lg-4'>
              <div className='border rounded-3 bg-white p-4 shadow-sm'>
                <Card.Img src={course.course_small_image} className='rounded' />
                <Card.Body className='mt-3'>
                  <h3 className="fw-bold">${course.price}</h3>
                  {
                    course.cross_price && (
                      <div className="text-muted text-decoration-line-through">${course.cross_price}</div>
                    )
                  }

                  {/* Buttons */}
                  <div className="mt-4">
                    <button onClick={() => handleEnroll()} className="btn btn-primary w-100">
                      <i className="bi bi-ticket"></i> Enroll
                    </button>
                  </div>
                </Card.Body>
                <Card.Footer className='mt-4'>
                  <h6 className="fw-bold">This course includes</h6>
                  <ListGroup variant="flush">

                    <ListGroup.Item className='ps-0'>
                      <i className="bi bi-infinity text-primary me-2"></i>
                      Full lifetime access
                    </ListGroup.Item>
                    <ListGroup.Item className='ps-0'>
                      <i className="bi bi-tv text-primary me-2"></i>
                      Access on mobile and TV
                    </ListGroup.Item>
                  </ListGroup>
                </Card.Footer>
              </div>
            </div>
          </div>
        </div>
      }
    </Layout>
  )
}

export default Details