import React, { useEffect, useState } from 'react'
import Layout from '../../common/Layout'
import { Link, useParams } from 'react-router-dom'
import UserSidebar from '../../common/UserSidebar'
import { Rating } from 'react-simple-star-rating'
import { useForm } from 'react-hook-form'
import { apiUrl, token } from '../../common/Config'
import toast from 'react-hot-toast'


const LeaveRating = () => {
    const [ratingValue, setRatingValue] = React.useState(0)
    const [course, setCourse] = useState([])
    const prams=useParams()

    const {
        register,
        handleSubmit,
        formState:{errors},
        reset
    }=useForm()

    const handleRating = (rate) => {
    setRatingValue(rate)
    }

    const onSubmit=async(data)=>{

        data.course_id=prams.id
        data.rating=ratingValue

        await fetch(`${apiUrl}/save-rating`,{
            method:'POST',
            headers:{
                'Content-Type':'application/json',
                'Accept':'application/json',
                'Authorization':`Bearer ${token}`
            },
            body:JSON.stringify(data)
        }).then(res=>res.json())
        .then(result=>{
            if(result.status==200){
                toast.success(result.message)
                reset()
                setRatingValue(0)
            }else{
                toast.error(result.message)
            }
        })
    }


    //fetch course
    const fetchCourse=async()=>{

        await fetch(`${apiUrl}/course/${prams.id}`,{
            method:'GET',
            headers:{
                'Content-Type':'application/json',
                'Accept':'application/json',
            }
        }).then(res=>res.json())
        .then(result=>{
            if(result.status==200){
                setCourse(result.data)
            }else{
                //.error(result.message)
            }
        })
    }

    useEffect(()=>{
        fetchCourse()
    },[])

    return (

        <Layout>
            <section className='section-4'>
                <div className='container pb-5 pt-3'>
                    <nav aria-label="breadcrumb">
                        <ol className="breadcrumb">
                            <li className="breadcrumb-item"><Link to="/account">Account</Link></li>
                            <li className="breadcrumb-item active" aria-current="page">Leave Rating / {course.title}</li>
                        </ol>
                    </nav>
                    <div className='row'>
                        <div className='col-md-12 mt-5 mb-3'>
                            <div className='d-flex justify-content-between'>
                                <h2 className='h4 mb-0 pb-0'>Leave Rating</h2>
                            </div>
                        </div>
                        <div className='col-lg-3 account-sidebar'>
                            <UserSidebar />
                        </div>
                        <div className='col-lg-9'>
                            <div className='row'>
                               <div className='card p-3 border-0 shadow-lg'>
                                    <div className="card-body">
                                        <form onSubmit={handleSubmit(onSubmit)}>
                                            <div className="mb-3">
                                                <label className='form-label'>Comment</label>
                                                <textarea 
                                                   {
                                                       ...register('comment',{
                                                           required:'please enter your feedback'
                                                       })
                                                   }
                                                   className={`form-control ${errors.comment && 'is-invalid'}`}
                                                   placeholder='what is you personal feedback?'
                                                   ></textarea>
                                                   {
                                                    errors.comment && <p className='invalid-feedback'>{errors.comment.message}</p>
                                                   }
                                            </div>
                                            <div className="mb-3">
                                                <Rating onClick={handleRating} initialValue={ratingValue} />
                                            </div>
                                            <button className='btn btn-primary'>Submit</button>
                                        </form>
                                    </div>
                               </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </Layout>
    )
}

export default LeaveRating