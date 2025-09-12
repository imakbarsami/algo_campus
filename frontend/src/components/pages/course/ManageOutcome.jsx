import React, { useState } from 'react'
import { useForm } from 'react-hook-form'
import { apiUrl, token } from '../../common/Config'
import { toast } from 'react-hot-toast'
import { useParams } from 'react-router-dom'

const ManageOutcom = () => {

    const {
        register,
        handleSubmit,
        formState: { errors },
        reset,
        setError
    }=useForm()

    const [loading,setLoading]=useState(false)
    const prams=useParams()

    const onSubmit=async(data)=>{

        setLoading(true)
        const formData={...data,course_id:prams.id}
        await fetch(`${apiUrl}/outcomes`,{
            method:'POST',
            headers:{
                'Content-Type':'application/json',
                'Accept':'application/json',
                'Authorization':`Bearer ${token}`
            },
            body:JSON.stringify(formData)
        }).then(res=>res.json())
        .then(result=>{
            if(result.status==200){
                setLoading(false)
                toast.success(result.message)
                reset()
            }else{
                
            }
        })

    }


  return (
    <div className="card shadow-lg border-0">
        <div className="card-body p-4">
            <div className="d-flex">
                <h4 className="h5 mb-3">
                    Outcome
                </h4>
            </div>
            <form onSubmit={handleSubmit(onSubmit)}>
                <div className="mb-3">
                    <input 
                    {
                        ...register('outcome',{
                            required:'the outcome field is required'
                        })
                    }
                    type="text" 
                    className={`form-control ${errors.outcome && 'is-invalid'}`}
                    placeholder='Outcome' />
                    {
                        errors.outcome && <p className='invalid-feedback'>{errors.outcome.message}</p>
                    }
                </div>
                <button disabled={loading} className='btn btn-primary'>{loading? 'Please wait...' : 'Save' }</button>
            </form>
        </div>

    </div>
  )
}

export default ManageOutcom