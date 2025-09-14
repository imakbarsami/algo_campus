import React, { useEffect, useState } from 'react'
import { useForm } from 'react-hook-form'
import { apiUrl, token } from '../../common/Config'
import { toast } from 'react-hot-toast'
import { Link, useParams } from 'react-router-dom'
import { MdDragIndicator } from 'react-icons/md'
import { BsPencilSquare } from 'react-icons/bs'
import { FaTrashAlt } from 'react-icons/fa'
import UpdateOutcomes from './UpdateOutcomes'

const ManageOutcom = () => {

    const {
        register,
        handleSubmit,
        formState: { errors },
        reset,
        setError
    } = useForm()

    const [showOutcome, setShowOutcome] = useState(false);
    const handleClose = () => setShowOutcome(false);
    const [outcomeData, setOutcomeData] = useState()
    const handleShow = (outcome) => {
        setOutcomeData(outcome)
        setShowOutcome(true)
    };

    const [loading, setLoading] = useState(false)
    const prams = useParams()

    const onSubmit = async (data) => {

        setLoading(true)
        const formData = { ...data, course_id: prams.id }
        await fetch(`${apiUrl}/outcomes`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'Authorization': `Bearer ${token}`
            },
            body: JSON.stringify(formData)
        }).then(res => res.json())
            .then(result => {
                const newOutcome = [...outcomes, result.data]
                if (result.status == 200) {
                    setLoading(false)
                    setOutcomes(newOutcome)
                    toast.success(result.message)
                    reset()
                } else {

                }
            })

    }

    const [outcomes, setOutcomes] = useState([])

    const fetchOptions = async () => {

        await fetch(`${apiUrl}/outcomes?course_id=${prams.id}`, {
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
                    //console.log(result)
                    setOutcomes(result.data)
                }
            })
    }

    const deleteOutcome = async (id) => {

        if (confirm('Are you sure you want to delete this outcome?')) {
            await fetch(`${apiUrl}/outcomes/${id}`, {
                method: 'DELETE',
                headers: {
                    'Content-Type': 'application/json',
                    'Accept': 'application/json',
                    'Authorization': `Bearer ${token}`
                }
            })
                .then(res => res.json())
                .then(result => {
                    if (result.status == 200) {
                        const newOutcomes = outcomes.filter(outcome => outcome.id != id)
                        setOutcomes(newOutcomes)
                        toast.success(result.message)
                    }
                })
        }

    }

    useEffect(() => {
        fetchOptions()
    }, [])


    return (
        <>
            <div className="card shadow-lg border-0">
                <div className="card-body p-4">
                    <div className="d-flex">
                        <h4 className="h5 mb-3">
                            Outcome
                        </h4>
                    </div>
                    <form className='mb-4' onSubmit={handleSubmit(onSubmit)}>
                        <div className="mb-3">
                            <input
                                {
                                ...register('outcome', {
                                    required: 'the outcome field is required'
                                })
                                }
                                type="text"
                                className={`form-control ${errors.outcome && 'is-invalid'}`}
                                placeholder='Outcome' />
                            {
                                errors.outcome && <p className='invalid-feedback'>{errors.outcome.message}</p>
                            }
                        </div>
                        <button disabled={loading} className='btn btn-primary'>{loading ? 'Please wait...' : 'Save'}</button>
                    </form>

                    {
                        outcomes && outcomes.map((outcome) => {
                            return (
                                <div className="card shadow mb-2" key={`outcome-${outcome.id}`}>
                                    <div className="card-body p-2 d-flex">
                                        <div>
                                            <MdDragIndicator />
                                        </div>
                                        <div className="d-flex justify-content-between w-100">
                                            <div className="ps-2">
                                                {outcome.text}
                                            </div>
                                            <div className="d-flex">
                                                <Link onClick={() => handleShow(outcome)} className='text-primary me-1'>
                                                    <BsPencilSquare />
                                                </Link>
                                                <Link onClick={() => deleteOutcome(outcome.id)} className='text-danger'>
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

            <UpdateOutcomes
                outcomeData={outcomeData}
                showOutcome={showOutcome}
                handleClose={handleClose}
                outcomes={outcomes}
                setOutcomes={setOutcomes}
                setShowOutcome={setShowOutcome}
            />
        </>
    )
}

export default ManageOutcom