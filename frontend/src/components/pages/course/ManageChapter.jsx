import React, { useState } from 'react'
import { set, useForm } from 'react-hook-form'
import { apiUrl, token } from '../../common/Config'
import toast from 'react-hot-toast'
import Accordion from 'react-bootstrap/Accordion';
import UpdateChapter from './UpdateChapter';
import { Link } from 'react-router-dom';
import { FaPlus, FaTrashAlt } from 'react-icons/fa';
import CreateLesson from './CreateLesson';
import { BsPencilSquare } from 'react-icons/bs'
import SortLesson from './SortLesson';
import SortChapter from './SortChapter';
import {AiOutlineDrag} from 'react-icons/ai'



const ManageChapter = ({ course, pram }) => {

    const { register, handleSubmit, setError, formState: { errors }, reset } = useForm()
    const [loading, setLoading] = React.useState()

    const chapterReducer = (state, action) => {
        switch (action.type) {
            case "SET_CHAPTER":
                return action.payload;
            case "ADD_CHAPTER":
                return [...state, action.payload];
            case "UPDATE_CHAPTER":
                return state.map(chapter => chapter.id == action.payload.id ? action.payload : chapter)
            case "DELETE_CHAPTER":
                return state.filter(chapter => chapter.id != action.payload)

            default:
                return state
        }
    }
    const [chapters, setChapters] = React.useReducer(chapterReducer, [])

    //add chapter
    const onSubmit = async (data) => {
        setLoading(true)
        const formData = { ...data, course_id: pram.id }
        await fetch(`${apiUrl}/chapters`, {
            method: 'POSt',
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'Authorization': `Bearer ${token}`
            },
            body: JSON.stringify(formData)
        })
            .then(res => res.json())
            .then(result => {
                if (result.status == 200) {
                    setLoading(false)
                    toast.success(result.message)
                    setChapters({ type: "ADD_CHAPTER", payload: result.data })
                    reset()
                } else {
                    console.log('something went wrong')
                    const errors = result.errors
                    Object.keys(errors).forEach(field => {
                        setError(field, { message: errors[field][0] })
                    })
                    setLoading(false)
                }
            })

    }

    //chapter modal
    const [showChapter, setShowChapter] = useState(false);
    const handleClose = () => setShowChapter(false);
    const [chapterData, setChapterData] = useState()
    const [lessons, setLessons] = useState([])

    const handleShow = (chapter) => {
        setChapterData(chapter)
        setShowChapter(true)
    };


    //creat lesson modal
    const [showLessonModal, setShowLessonModal] = useState(false);
    const handleCloseModal = () => setShowLessonModal(false);
    const handleShowModal = () => {
        setShowLessonModal(true)
    };


    //sort lesson modal
    const [showSortLessonModal, setShowSortLessonModal] = useState(false);
    const handleCloseSortLessonModal = () => setShowSortLessonModal(false);

    const handleShowSortLessonModal = (lesson) => {
        setShowSortLessonModal(true)
        setLessons(lesson)
    };


    //sort chapter modal
    const [showSortChapterModal, setShowSortChapterModal] = useState(false);
    const handleCloseSortChapterModal = () => setShowSortChapterModal(false);

    const handleShowSortChapterModal = (chapter) => {
        setShowSortChapterModal(true)
    };




    //console.log(course)

    //delete chapter
    const deleteChapter = async (id) => {

        if (confirm("Are you sure you want to delete this chapter?")) {
            setLoading(true)
            await fetch(`${apiUrl}/chapters/${id}`, {
                method: 'DELETE',
                headers: {
                    'Content-Type': 'application/json',
                    'Accept': 'application/json',
                    'Authorization': `Bearer ${token}`
                }
            }).then(res => res.json())
                .then(result => {
                    if (result.status == 200) {
                        toast.success(result.message)
                        setLoading(false)
                        setChapters({ type: "DELETE_CHAPTER", payload: id })
                    }
                })
        }
    }

    //delete lesson
    const deleteLesson = async (id) => {
        if (confirm('Are you sure you want to delete this lesson?')) {
            await fetch(`${apiUrl}/lessons/${id}`, {
                method: 'DELETE',
                headers: {
                    'Content-Type': 'application/json',
                    'Accept': 'application/json',
                    'Authorization': `Bearer ${token}`
                }
            }).then(res => res.json())
                .then(result => {
                    if (result.status == 200) {
                        toast.success(result.message)
                        setChapters({ type: "UPDATE_CHAPTER", payload: result.data })
                    }
                })
        }
    }

    //console.log(course)
    React.useEffect(() => {

        if (course.chapters) {
            setChapters({ type: "SET_CHAPTER", payload: course.chapters })
        }

    }, [course])


    return (
        <>
            <div className="card shadow-lg border-0 mt-4">
                <div className="card-body p-4">
                    <div className="d-flex">
                        <div className="d-flex justify-content-between w-100">
                            <h4 className="h5 mb-3"> Chpater</h4>
                            <div>
                                <Link onClick={() => handleShowModal()}><FaPlus size={12} /> <strong>Add Lesson</strong></Link>
                                <Link className='ms-2' onClick={() => handleShowSortChapterModal()}><AiOutlineDrag /> <strong>Reorder Chapter</strong></Link>
                            </div>

                        </div>
                    </div>
                    <form className='mb-4' onSubmit={handleSubmit(onSubmit)}>
                        <div className="mb-3">
                            <input
                                {
                                ...register('chapter', {
                                    required: 'the chapter field is required'
                                })
                                }
                                type="text"
                                className={`form-control ${errors.chapter && 'is-invalid'}`}
                                placeholder='Chapter' />
                            {
                                errors.chapter && <p className='invalid-feedback'>{errors.chapter.message}</p>
                            }
                        </div>
                        <button disabled={loading} className='btn btn-primary'>{loading ? 'Please wait...' : 'Save'}</button>
                    </form>


                    <Accordion>
                        {
                            chapters && chapters.map((chapter, index) => {
                                return (
                                    <Accordion.Item eventKey={index} key={index}>
                                        <Accordion.Header>{chapter.title}</Accordion.Header>
                                        <Accordion.Body>

                                            <div className="row">
                                                <div className="col-md-12">

                                                    <div className="d-flex justify-content-between mb-2 mt-4">
                                                        <h4 className="h5">Lessons</h4>
                                                        <Link onClick={() => handleShowSortLessonModal(chapter.lessons)} className="h6">
                                                            <strong>Reorder Lessons</strong>
                                                        </Link>
                                                    </div>
                                                </div>
                                                <div className="col-md-12">
                                                    {
                                                        chapter.lessons && chapter.lessons.map((lesson, index) => {
                                                            return (
                                                                <div key={index} className='card shadow px-3 py-2 mb-2 rounded'>
                                                                    <div className="row">
                                                                        <div className="col-md-7">
                                                                            {lesson.title}
                                                                        </div>
                                                                        <div className="col-md-5 text-end">
                                                                            {
                                                                                lesson.duration > 0 && <small className="fw-bold text-muted me-2">20 Mins</small>
                                                                            }
                                                                            {
                                                                                lesson.is_free_premium == 'yes' && <span className="badge bg-success">Preview </span>
                                                                            }

                                                                            <Link to={`/account/courses/lesson-edit/${lesson.id}/${course.id}`} className='ms-2'>
                                                                                <BsPencilSquare />
                                                                            </Link>

                                                                            <Link onClick={() => deleteLesson(lesson.id)} className='ms-2 text-danger'>
                                                                                <FaTrashAlt />
                                                                            </Link>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            )
                                                        })
                                                    }
                                                </div>
                                                <div className="col-md-12 mt-2">
                                                    <div className="d-flex">
                                                        <button onClick={() => deleteChapter(chapter.id)} disabled={loading} className="btn btn-danger btn-sm me-2">Delete Chapter</button>
                                                        <button onClick={() => handleShow(chapter)} className="btn btn-primary">Update Chapter</button>
                                                    </div>
                                                </div>

                                            </div>
                                        </Accordion.Body>
                                    </Accordion.Item>
                                )
                            })
                        }
                    </Accordion>
                </div>
            </div>
            <UpdateChapter
                showChapter={showChapter}
                handleClose={handleClose}
                chapterData={chapterData}
                setChapters={setChapters}
            />

            <CreateLesson
                showLessonModal={showLessonModal}
                handleCloseModal={handleCloseModal}
                setChapters={setChapters}
                course={course}
                chapters={chapters}
            />

            <SortLesson
                showSortLessonModal={showSortLessonModal}
                handleCloseSortLessonModal={handleCloseSortLessonModal}
                lessonData={lessons}
                setChapters={setChapters}
            />

            <SortChapter
                showSortChapterModal={showSortChapterModal}
                handleCloseSortChapterModal={handleCloseSortChapterModal}
                setChapters={setChapters}
                course={course}
                chapters={chapters}
            />
        </>
    )
}

export default ManageChapter
