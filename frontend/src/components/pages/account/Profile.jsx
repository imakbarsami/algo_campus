import React from 'react'
import Layout from '../../common/Layout'
import UserSidebar from '../../common/UserSidebar'
import { useForm } from 'react-hook-form'
import { Link } from 'react-router-dom'
import { apiUrl, token } from '../../common/Config'
import { toast } from 'react-hot-toast'
import Loader from '../../common/Loader'

const Profile = () => {

    const [loading, setLoading] = React.useState(false)

    const { register, handleSubmit, formState: { errors }, reset, setError } = useForm(
        {
            defaultValues: async () => {
                await fetch(`${apiUrl}/fetch-user`, {
                    method: "GET",
                    headers: {
                        'Content-Type': 'application/json',
                        'Accept': 'application/json',
                        'Authorization': `Bearer ${token}`
                    }
                }).then(res => res.json())
                    .then(result => {
                        if (result.status == 200) {
                            reset({
                                name: result.user.name,
                                email: result.user.email
                            })

                        }
                    })
            }
        }
    )

    const onSubmit = async (data) => {

        setLoading(true)
        await fetch(`${apiUrl}/update-user`, {
            method: "PUT",
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'Authorization': `Bearer ${token}`
            },
            body: JSON.stringify(data)
        }).then(res => res.json())
            .then(result => {
                if (result.status == 200) {
                    setLoading(false)
                    toast.success(result.message)
                    reset({
                        name: result.user.name,
                        email: result.user.email
                    })
                } else {
                    setError('email', { message: result.errors.email[0] })
                    setLoading(false)
                }
            })
    }
    return (
        <Layout>
            <section className='section-4'>
                <div className='container pb-5 pt-3'>
                    <nav aria-label="breadcrumb">
                        <ol className="breadcrumb">
                            <li className="breadcrumb-item"><Link to="/account/dashboard">Account</Link></li>
                            <li className="breadcrumb-item active" aria-current="page">Profile</li>
                        </ol>
                    </nav>
                    <div className='row'>
                        <div className='col-md-12 mt-5 mb-3'>
                            <div className='d-flex justify-content-between'>
                                <h2 className='h4 mb-0 pb-0'>Profile</h2>
                            </div>
                        </div>
                        <div className='col-lg-3 account-sidebar'>
                            <UserSidebar />
                        </div>
                        <div className='col-lg-9'>
                            <div className='row'>
                                {
                                    loading && <Loader />
                                }
                                {
                                    !loading &&
                                    <div className='col-md-12'>
                                        <div className='card p-3 border-0 shadow-lg'>
                                            <div className="card-body">
                                                <form onSubmit={handleSubmit(onSubmit)}>
                                                    <div className="mb-3">
                                                        <label className='form-label'>Name</label>
                                                        <input
                                                            {
                                                            ...register('name', {
                                                                required: 'the name field is required'
                                                            })
                                                            }
                                                            className={`form-control ${errors.name && 'is-invalid'}`}
                                                            placeholder='Name'
                                                        />
                                                        {
                                                            errors.name && <p className='invalid-feedback'>{errors.name.message}</p>
                                                        }
                                                    </div>
                                                    <div className="mb-3">
                                                        <label className='form-label'>Email</label>
                                                        <input
                                                            {
                                                            ...register('email', {
                                                                required: 'the name field is required'
                                                            })
                                                            }
                                                            className={`form-control ${errors.email && 'is-invalid'}`}
                                                            placeholder='Email'
                                                        />
                                                        {
                                                            errors.email && <p className='invalid-feedback'>{errors.email.message}</p>
                                                        }
                                                    </div>

                                                    <button disabled={loading} className='btn btn-primary'>{loading ? 'Updating...' : 'Update'}</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                }

                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </Layout>
    )
}

export default Profile