import React from 'react'
import Layout from '../../common/Layout'
import Accordion from 'react-bootstrap/Accordion';
import { MdSlowMotionVideo } from "react-icons/md";
import { IoMdCheckmarkCircleOutline } from "react-icons/io";
import ProgressBar from 'react-bootstrap/ProgressBar';
import { apiUrl, token } from '../../common/Config';
import { Link, useParams } from 'react-router-dom';
import { toast } from 'react-hot-toast'
import ReactPlayer from 'react-player';

const WatchCourse = () => {

  const [course, setCourse] = React.useState();
  const prams = useParams();
  const [activeLesson, setActiveLesson] = React.useState(null);
  const [completedLessons,setCompletedLessons]=React.useState([]);
  const [progress, setProgress] = React.useState(0);

  const fetchCourse = async () => {

    await fetch(`${apiUrl}/watch-course/${prams.id}`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": `Bearer ${token}`
      }
    }).then((res) => res.json())
      .then((result) => {
        if (result.status === 200) {
          setCourse(result.data);
          setActiveLesson(result.activeLesson);
          setCompletedLessons(result.completedLessons);
          setProgress(result.progress);
        } else {
          toast.error(result.message);
        }
      })
  }

  //show lesson
  const showLesson=async(lesson)=>{
    setActiveLesson(lesson);

    const data={
      course_id:prams.id,
      lesson_id:lesson.id,
      chapter_id:lesson.chapter_id
    }

    await fetch(`${apiUrl}/save-activity`,{
      method:"POST",
      headers:{
        "Content-Type":"application/json",
        "Accept":"application/json",
        "Authorization":`Bearer ${token}`
      },
      body:JSON.stringify(data)
    }).then(res=>res.json())
    .then(result=>{
      if(result.status===200){
        //console.log(result.message);
      }
    })

  }

  const markAsCompleted=async(activeLesson)=>{

    const data={
      course_id:prams.id,
      lesson_id:activeLesson.id,
      chapter_id:activeLesson.chapter_id
    }
    await fetch(`${apiUrl}/mark-as-complete`,{
      method:"POST",
      headers:{
        "Content-Type":"application/json",
        "Accept":"application/json",
        "Authorization":`Bearer ${token}`
      },
      body:JSON.stringify(data)
    }).then(res=>res.json())
    .then(result=>{
      if(result.status===200){
        toast.success(result.message)
        setCompletedLessons(result.completedLessons)
        setProgress(result.progress)
      }
    })
  }

  React.useEffect(() => {
    fetchCourse();
  }, [])

  //console.log(course);
  return (
    <Layout>
      {
        course &&
        <section className='section-5 my-5'>
          <div className='container'>
            <div className='row'>
              <div className='col-md-8'>
                {
                  activeLesson &&
                  <>
                    <div className='video'>
                      {
                        <ReactPlayer
                         className='rounded shadow-lg'
                          width='100%'
                          height='100%'
                          controls
                          src={activeLesson.video_url}
                        />
                      }
                    </div>
                    <div className='meta-content'>
                      <div className='d-flex justify-content-between align-items-center border-bottom pb-2 mb-3 pt-1'>
                        <h3 className='pt-2'>{activeLesson.title}</h3>
                        <div>
                          <Link onClick={()=>markAsCompleted(activeLesson)} className={`${completedLessons && completedLessons.includes(activeLesson.id)?'disabled':''} btn btn-primary px-3`}>
                            Mark as complete <IoMdCheckmarkCircleOutline size={20} /> </Link>
                        </div>
                      </div>
                      <div dangerouslySetInnerHTML={{ __html: activeLesson.description }}>

                      </div>
                    </div>
                  </>
                }

              </div>
              <div className='col-md-4'>
                <div className='card rounded-0'>
                  <div className='card-body'>
                    <div className='h6'>
                      <strong>{course.title}</strong>
                    </div>
                    <div className='py-2'>
                      <ProgressBar now={progress} />
                      <div className='pt-2'>
                        {progress}% complete
                      </div>
                    </div>
                    <Accordion flush>
                      {
                        course.chapters && course.chapters.map((chapter,index) => {
                          return (
                            <Accordion.Item eventKey={index} key={chapter.id}>
                              <Accordion.Header>{chapter.title}</Accordion.Header>
                              <Accordion.Body className='pt-2 pb-0 ps-0'>
                                <ul className='lessons mb-0'>
                                  {
                                    chapter.lessons && chapter.lessons.map(lesson => {
                                      return (
                                        <li key={lesson.id} className='pb-2'>
                                          <Link className={`${completedLessons && completedLessons.includes(lesson.id)?'text-success':''}`} onClick={()=>showLesson(lesson)}>
                                            <MdSlowMotionVideo size={20} /> {lesson.title}
                                          </Link>
                                        </li>
                                      )
                                    })
                                  }

                                </ul>
                              </Accordion.Body>
                            </Accordion.Item>
                          )
                        })
                      }


                    </Accordion>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
      }

    </Layout>
  )
}

export default WatchCourse