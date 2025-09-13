import React, { useEffect, useState } from 'react'
import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';
import { useForm } from 'react-hook-form';
import { toast } from 'react-hot-toast';
import { apiUrl, token } from '../../common/Config';


const UpdateOutcomes = ({ outcomeData, showOutcome, handleClose, outcomes, setOutcomes, setShowOutcome }) => {

    const {
        register,
        handleSubmit,
        formState: { errors },
        setError,
        reset

    } = useForm()

    const [loading, setLoading] = useState(false)
    //console.log(outcomeData)

    const onSubmit = async (data) => {
        setLoading(true)
        await fetch(`${apiUrl}/outcomes/${outcomeData.id}`, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'Authorization': `Bearer ${token}`
            },
            body: JSON.stringify(data)
        })
            .then(res => res.json())
            .then(result => {
                setLoading(false)
                if (result.status == 200) {
                    const newOutcomes =outcomes.map(outcome=>
                        outcome.id==result.data.id?{...outcome,text:result.data.text}:outcome
                    )
                    setOutcomes(newOutcomes)
                    toast.success(result.message)
                    setShowOutcome(false)
                } else {
                    const errors = result.errors
                    Object.keys(errors).forEach(field => {
                        setError(field, { message: errors[field][0] })
                    })
                }
            })
    }

    useEffect(() => {
        if (outcomeData) {
            reset({
                outcome: outcomeData.text
            })
        }
    }, [outcomeData])


    return (
        <>
            <Modal size='lg' show={showOutcome} onHide={handleClose}>
                <form onSubmit={handleSubmit(onSubmit)}>
                    <Modal.Header closeButton>
                        <Modal.Title>Update Outcome</Modal.Title>
                    </Modal.Header>
                    <Modal.Body>
                        <div className='mb-3'>
                            <label htmlFor="title" className='form-label'>Title</label>
                            <input
                                {
                                ...register('outcome', {
                                    required: 'the outcome field is required'
                                })
                                }
                                type="text"
                                placeholder='Outcome'
                                className={`form-control ${errors.outcome && 'is-invalid'}`}
                            />
                            {
                                errors.outcome && <p className='invalid-feedback'>{errors.outcome.message}</p>
                            }
                        </div>
                    </Modal.Body>
                    <Modal.Footer>
                        <Button disabled={loading} type='submit' className='btn btn-primary' variant="primary">
                            {loading ? 'Updating...' : 'Update'}
                        </Button>
                    </Modal.Footer>
                </form>
            </Modal>
        </>
    )
}

export default UpdateOutcomes