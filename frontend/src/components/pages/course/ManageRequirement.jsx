import React, { useEffect, useState } from 'react'
import { set, useForm } from 'react-hook-form'
import { apiUrl, token } from '../../common/Config';
import toast from 'react-hot-toast';
import { Link, useParams } from 'react-router-dom';
import { MdDragIndicator } from 'react-icons/md';
import { BsPencilSquare } from 'react-icons/bs';
import { FaTrashAlt } from 'react-icons/fa';
import UpdateRequirement from './UpdateRequirement';

const ManageRequirement = () => {

    const {
        register,
        handleSubmit,
        formState: { errors },
        setError,
        reset
    } = useForm();

    const [requirements, setRequirements] = useState([])
    const prams = useParams()
    const [loading, setLoading] = useState(false)
    const [showRequirement, setShowRequirement] = useState(false);
    const handleClose = () => setShowRequirement(false);
    const [requirementData, setRequirementData] = useState()

    const handleShow = (requirement) => {
        setRequirementData(requirement)
        setShowRequirement(true)
    };

    const onSubmit = async (data) => {

        const formData = { ...data, course_id: prams.id }
        setLoading(true)

        await fetch(`${apiUrl}/requirements`, {
            method: 'POST',
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
                    const newRequirement = [...requirements, result.data]
                    setRequirements(newRequirement)
                    setLoading(false)
                    toast.success(result.message)
                    reset()
                } else {
                    const errors = result.errors
                    Object.keys(errors).forEach((field) => {
                        setError(field,
                            { message: errors[field][0] },
                        )
                    })
                }
            })
    }


    const fetchRequirements = async () => {

        await fetch(`${apiUrl}/requirements?course_id=${prams.id}`, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'Authorization': `Bearer ${token}`
            }
        })
            .then(res => res.json())
            .then(result => {
                if (result.status == 200) {
                    setRequirements(result.data)
                }
            })
    }

    const deleteRequirement=async(id)=>{
        if(confirm('Are you sure you want to delete this requirement?')){
            await fetch(`${apiUrl}/requirements/${id}`,{
                method:'DELETE',
                headers:{
                    'Content-Type':'application/json',
                    'Accept':'application/json',
                    'Authorization':`Bearer ${token}`
                }
            })
            .then(res=>res.json())
            .then(result=>{
                if(result.status==200){
                    const newRequirements=requirements.filter(requirement=>requirement.id!=id)
                    setRequirements(newRequirements)
                    toast.success(result.message)
                }else{
                    toast.error(result.message)
                }
            })
        }
    }

    useEffect(() => {
        fetchRequirements()
    }, [])

    //console.log(requirements)


    return (
        <>
            <div className='card shadow-lg mt-4 border-0'>
                <div className="card-body p-4">
                    <form className='mb-4' onSubmit={handleSubmit(onSubmit)}>
                        <div className="d-flex">
                            <h4 className="h5 mb-3">
                                Requirements
                            </h4>
                        </div>
                        <input
                            {
                            ...register('requirement', {
                                required: 'the requirement field is required'
                            })
                            }
                            type="text"
                            className={`form-control ${errors.requirement && 'is-invalid'}`}
                            placeholder='Requirement'
                        />
                        {
                            errors.requirement && <p className='invalid-feedback'>{errors.requirement.message}</p>
                        }
                        <button disabled={loading} className='btn btn-primary mt-3'>{loading ? 'Saving...' : 'Save'}</button>
                    </form>
                    {
                        requirements && requirements.map(requirement => {
                            return (
                                <div key={`requirement-${requirement.id}`} className='card shadow mb-2'>
                                    <div className="card-body p-2 d-flex">
                                        <div>
                                            <MdDragIndicator />
                                        </div>
                                        <div className="d-flex justify-content-between w-100">
                                            <div className="ps-2">
                                                {requirement.text}
                                            </div>
                                            <div className="d-flex">
                                                <Link onClick={()=>handleShow(requirement)} className='text-primary me-1'>
                                                    <BsPencilSquare />
                                                </Link>
                                                <Link onClick={()=>deleteRequirement(requirement.id)} className='text-danger'>
                                                    <FaTrashAlt />
                                                </Link>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            )
                        })
                    }
                </div>
            </div>

            <UpdateRequirement
                requirementData={requirementData}
                requirements={requirements}
                setRequirements={setRequirements}
                showRequirement={showRequirement}
                handleClose={handleClose}
                setShowRequirement={setShowRequirement}
            />
        </>
    )
}

export default ManageRequirement