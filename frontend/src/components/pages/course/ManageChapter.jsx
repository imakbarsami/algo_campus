import React, { useState } from 'react'
import { set, useForm } from 'react-hook-form'
import { apiUrl, token } from '../../common/Config'
import toast from 'react-hot-toast'
import Accordion from 'react-bootstrap/Accordion';
import UpdateChapter from './UpdateChapter';



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

        const [showChapter, setShowChapter] = useState(false);
        const handleClose = () => setShowChapter(false);
        const [chapterData, setChapterData] = useState()

        const handleShow = (chapter) => {
            setChapterData(chapter)
            setShowChapter(true)
        };
    //console.log(course)

    const deleteChapter=async(id)=>{

        if(confirm("Are you sure you want to delete this chapter?")){
            setLoading(true)
            await fetch(`${apiUrl}/chapters/${id}`,{
                method:'DELETE',
                headers:{
                    'Content-Type':'application/json',
                    'Accept':'application/json',
                    'Authorization':`Bearer ${token}`
                }
            }).then(res=>res.json())
            .then(result=>{
                if(result.status==200){
                    toast.success(result.message)
                    setLoading(false)
                    setChapters({type:"DELETE_CHAPTER",payload:id})
                }
            })
        }
    }

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
                        <h4 className="h5 mb-3">
                            Chpater
                        </h4>
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
                                            <div className="d-flex">
                                                <button onClick={()=>deleteChapter(chapter.id)} disabled={loading} className="btn btn-danger btn-sm me-2">Delete Chapter</button>
                                                <button onClick={()=>handleShow(chapter)} className="btn btn-primary">Update Chapter</button>
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
        </>
    )
}

export default ManageChapter
