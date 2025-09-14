import React, { useEffect, useState } from 'react'
import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';
import { useForm } from 'react-hook-form';
import { apiUrl, token } from '../../common/Config';
import toast from 'react-hot-toast';

const UpdateRequirement = ({ requirementData, requirements, setRequirements, showRequirement, handleClose, setShowRequirement }) => {

    const {
        register,
        handleSubmit,
        formState: { errors },
        setError,
        reset
    } = useForm()

    const [loading, setLoading] = useState(false)

    useEffect(() => {
        if (requirementData) {
            reset({
                requirement: requirementData.text
            })
        }
    }, [requirementData])

    const onSubmit = async(data) => {

        setLoading(true)
        await fetch(`${apiUrl}/requirements/${requirementData.id}`,{
            method:'PUT',
            headers:{
                'Content-Type':'application/json',
                'Accept':'application/json',
                'Authorization':`Bearer ${token}`
            },
            body:JSON.stringify(data)
        })
        .then(res=>res.json()) 
        .then(result=>{
            if(result.status==200){
                const newRequirements=requirements.map(requirement=>
                    requirement.id==result.data.id?{...requirement,text:result.data.text}:requirement
                )
                setRequirements(newRequirements)
                setLoading(false)
                setShowRequirement(false)
                toast.success(result.message)
            }
        })
    }

    return (
        <Modal show={showRequirement} onHide={handleClose}>
            <form onSubmit={handleSubmit(onSubmit)}>
                <Modal.Header closeButton>
                    <Modal.Title>Update Requirement</Modal.Title>
                </Modal.Header>
                <Modal.Body>

                    <label htmlFor="requirement" className='form-label'>Ttile</label>
                    <input
                        {
                        ...register('requirement', {
                            required: 'the requirement filed is required'
                        })
                        }
                        type="text"
                        className={`form-control ${errors.requirement && 'is-invalid'}`}
                        placeholder='Requirement'
                    />
                    {
                        errors.requirement && <p className='invalid-feedback'>{errors.requirement.message}</p>
                    }

                </Modal.Body>
                <Modal.Footer>
                    <Button disabled={loading} variant="primary" type='submit'>
                        {loading ? 'Updating...' : 'Update'}
                    </Button>
                </Modal.Footer>
            </form>
        </Modal>
    )
}

export default UpdateRequirement