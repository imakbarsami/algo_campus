import React, { useEffect, useRef, useMemo, useState } from 'react'
import UserSidebar from '../../common/UserSidebar'
import Layout from '../../common/Layout'
import { Link, useParams } from 'react-router-dom'
import { set, useForm } from 'react-hook-form'
import { apiUrl, token } from '../../common/Config'
import JoditEditor from 'jodit-react';
import { toast } from 'react-hot-toast'
import LessonVideo from './LessonVideo'

const EditLesson = ({ placeholder }) => {

    const [chapters, setChapters] = React.useState([])
    const prams = useParams()
    const [checked, setChecked] = React.useState(false)
    const [loading, setLoading] = React.useState(false)
    const [description,setDescription]=React.useState('')
    const [lesson,setLesson]=React.useState({})

    
    const { register, handleSubmit, formState: { errors }, reset, setError } = useForm(
        {
            defaultValues:async()=>{
                await fetch(`${apiUrl}/lesson/edit/${prams.id}`,{
                    method:'GET',
                    headers: {
                        'Content-Type': 'application/json',
                        'Accept': 'application/json',
                        'Authorization': `Bearer ${token}`
                    }
                }).then(res=>res.json())
                .then(result=>{
                    if(result.status==200){
                        reset({
                            title:result.data.title,
                            chapter:result.data.chapter_id,
                            duration:result.data.duration,
                            status:result.data.status,
                            placeholder:result.data.description,
                        })
                        setChecked(result.data.is_free_premium=='yes'?true:false)
                        setContent(result.data.description)
                        setLesson(result.data)
                    }
                })
            }
        }
    )

    //update lesson
    const onSubmit = async (data) => {
        //console.log(data)
        setLoading(true)
        const formData={...data,description:description}
        console.log(formData)
        await fetch(`${apiUrl}/lessons/${prams.id}`,{
            method:'PUT',
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'Authorization': `Bearer ${token}`
            },
            body:JSON.stringify(formData)
        }).then(res=>res.json())
        .then(result=>{
            if(result.status==200){
                setLoading(false)
                toast.success(result.message)
                reset({
                    title:result.data.title,
                    chapter:result.data.chapter_id,
                    duration:result.data.duration,
                    status:result.data.status,
                    free_preview:result.data.is_free_premium
                })

            }else{
                const errors=result.errors
                Object.keys(errors).forEach(field=>{
                    setError(field,{message:errors[field][0]})
                })
            }
        })

    }


    //fetch chapter from database
    const fetchChapter = async () => {
        await fetch(`${apiUrl}/chapters?course_id=${prams.courseId}`, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'Authorization': `Bearer ${token}`
            }
        }).then(res => res.json())
            .then(result => {
                if (result.status == 200) {
                    setChapters(result.data)
                }
            })
    }
    
    //console.log(chapters)


    //jodi react
    const editor = useRef(null);
    const [content, setContent] = useState('');

    const config = useMemo(() => ({
        readonly: false, // all options from https://xdsoft.net/jodit/docs/,
        placeholder: placeholder || ''
    }),
        [placeholder]
    );

    useEffect(() => {
        fetchChapter()
    }, [])


    return (
        <Layout>
            <section className='section-4'>
                <div className='container pb-5 pt-3'>
                    <nav aria-label="breadcrumb">
                        <ol className="breadcrumb">
                            <li className="breadcrumb-item"><Link to="/account">Account</Link></li>
                            <li className="breadcrumb-item active" aria-current="page">Edit Lesson</li>
                        </ol>
                    </nav>
                    <div className='row'>
                        <div className='col-md-12 mt-5 mb-3'>
                            <div className='d-flex justify-content-between'>
                                <h2 className='h4 mb-0 pb-0'>Edit Lesson</h2>
                            </div>
                        </div>
                        <div className='col-lg-3 account-sidebar'>
                            <UserSidebar />
                        </div>
                        <div className='col-lg-9'>
                            <div className='row'>

                                <div className='col-md-7'>
                                    <form onSubmit={handleSubmit(onSubmit)}>
                                        <div className='card border-0 shadow-lg'>
                                            <div className='card-body p-4'>
                                                <h4 className='h5 border-bottom pb-3 mb-3'>Lesson Details</h4>
                                                <div className='mb-3'>
                                                    <label className='form-label' htmlFor="title">Title</label>
                                                    <input
                                                        {
                                                        ...register('title', {
                                                            required: 'the title field is required'
                                                        })
                                                        }
                                                        type="text"
                                                        placeholder='Title'
                                                        className={`form-control ${errors.title && 'is-invalid'}`}
                                                    />
                                                    {
                                                        errors.title && <p className='invalid-feedback'>{errors.title.message}</p>
                                                    }
                                                </div>
                                                <div className="mb-3">
                                                    <label className='form-label' htmlFor="category">Chapter</label>
                                                    <select
                                                        {
                                                        ...register('chapter', {
                                                            required: 'the chapter field is required'
                                                        })
                                                        }
                                                        className={`form-select ${errors.chapter && 'is-invalid'}`}
                                                        id='chapter'
                                                    >
                                                        <option value="">Select a Chapter</option>
                                                        {
                                                            chapters && chapters.map((chapter, key) => {
                                                                return (
                                                                    <option key={key} value={chapter.id}>{chapter.title}</option>
                                                                )
                                                            })
                                                        }

                                                    </select>
                                                    {
                                                        errors.chapter && <p className='invalid-feedback'>{errors.chapter.message}</p>
                                                    }
                                                </div>

                                                <div className='mb-3'>
                                                    <label className='form-label' htmlFor="duration">Duration (Mins)</label>
                                                    <input
                                                        {
                                                        ...register('duration', {
                                                            required: 'the duration field is required'
                                                        })
                                                        }
                                                        type="text"
                                                        placeholder='Duration'
                                                        className={`form-control ${errors.duration && 'is-invalid'}`}
                                                    />
                                                    {
                                                        errors.duration && <p className='invalid-feedback'>{errors.duration.message}</p>
                                                    }
                                                </div>
                                                <div className='mb-3'>
                                                    <label className='form-label' htmlFor="duration">Description</label>
                                                    <JoditEditor
                                                    
                                                        ref={editor}
                                                        value={content}
                                                        config={config}
                                                        tabIndex={1} // tabIndex of textarea
                                                        onBlur={newContent => setContent(newContent)} // preferred to use only this option to update the content for performance reasons
                                                        onChange={newContent => {
                                                            setDescription(newContent)
                                                         }}
                                                    />
                                                </div>

                                                <div className="mb-3">
                                                    <label className='form-label' htmlFor="category">Status</label>
                                                    <select
                                                        {
                                                        ...register('status', {
                                                            required: 'the status field is required'
                                                        })
                                                        }
                                                        className={`form-select ${errors.status && 'is-invalid'}`}
                                                        id='chapter'
                                                    >
                                
                                                       <option value="1">Active</option> 
                                                       <option value="0">Block</option>

                                                    </select>
                                                    {
                                                        errors.status && <p className='invalid-feedback'>{errors.status.message}</p>
                                                    }
                                                </div>
                                                <div className="d-flex">
                                                    <input {
                                                        ...register('free_preview')
                                                    }
                                                    checked={checked}
                                                    onChange={(e)=>setChecked(e.target.checked)}
                                                    type="checkbox"  className='form-check-input' id='freeLesson' />
                                                    <label className='form-check-label ms-2' htmlFor="freeLesson">Free Lesson</label>
                                                </div>
                                               
                                                <button disabled={loading} className='btn btn-primary mt-4'>{loading == false ? 'Update' : 'Please wait...'}</button>
                                            </div>
                                        </div>
                                    </form>

                                </div>

                                <div className='col-md-5'>
                                    <LessonVideo lesson={lesson}/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </Layout>
    )
}

export default EditLesson