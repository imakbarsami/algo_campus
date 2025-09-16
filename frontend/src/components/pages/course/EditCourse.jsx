import React, { useEffect, useState } from 'react'
import Layout from '../../common/Layout'
import { Link, useNavigate, useParams } from 'react-router-dom'
import UserSidebar from '../../common/UserSidebar'
import { set, useForm } from 'react-hook-form'
import { apiUrl, token } from '../../common/Config'
import toast from 'react-hot-toast'
import ManageOutcome from '../course/ManageOutcome'
import ManageRequirement from './ManageRequirement'
import EditCover from './EditCover'


const EditCourse = () => {

    const [course, setCourse] = useState([])

    const { register, handleSubmit, formState: { errors }, setError, reset } = useForm({
        defaultValues: async () => {
            await fetch(`${apiUrl}/courses/edit/${props.id}`, {
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

                        reset(
                            {
                                title: result.data.title,
                                category: result.data.category_id,
                                level: result.data.level_id,
                                language: result.data.language_id,
                                description: result.data.description,
                                sell_price: result.data.price,
                                cross_price: result.data.cross_price

                            }
                        )
                        setCourse(result.data)
                        //console.log(result)

                    } else {
                        toast.error(result.message)
                        navigate('/account/my-courses')
                    }
                })
        }
    })

    
    const [categories, setCategories] = useState([])
    const [levels, setLevels] = useState([])
    const [languages, setLanguages] = useState([])
    const props = useParams();
    const navigate = useNavigate();
    const [loading, setLoading] = useState(false) 

    const onSubmit = async (data) => {

        setLoading(true)
        await fetch(`${apiUrl}/courses/${props.id}`, {
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
                    toast.success(result.message)
                    setCourse(result.data)
                    //navigate('/account/my-courses')
                } else {
                    const errors = result.errors
                    if (errors) {
                        Object.keys(errors).forEach((field) => {
                            setError(field,
                                { message: errors[field][0] },
                            )
                        })
                    } else {
                        toast.error(result.message)
                    }
                }
            })

    }
    const coursesMetaData = async () => {

        await fetch(`${apiUrl}/courses/meta-data`, {
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
                    setCategories(result.categories)
                    setLevels(result.levels)
                    setLanguages(result.languages)

                } else {
                    console.log('something went wrong')
                }
            })


    }
    
    useEffect(() => {
        coursesMetaData()
    }, [])


    return (
        <Layout>
            <section className='section-4'>
                <div className='container pb-5 pt-3'>
                    <nav aria-label="breadcrumb">
                        <ol className="breadcrumb">
                            <li className="breadcrumb-item"><Link to="/account">Account</Link></li>
                            <li className="breadcrumb-item active" aria-current="page">Edit Course</li>
                        </ol>
                    </nav>
                    <div className='row'>
                        <div className='col-md-12 mt-5 mb-3'>
                            <div className='d-flex justify-content-between'>
                                <h2 className='h4 mb-0 pb-0'>Edit Course</h2>
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
                                                <h4 className='h5 border-bottom pb-3 mb-3'>Course Details</h4>
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
                                                    <label className='form-label' htmlFor="category">Category</label>
                                                    <select
                                                        {
                                                        ...register('category', {
                                                            required: 'the category field is required'
                                                        })
                                                        }
                                                        className={`form-select ${errors.category && 'is-invalid'}`}
                                                        id='category'
                                                    >
                                                        <option value="">Select a Category</option>
                                                        {
                                                            categories && categories.map((category, key) => {
                                                                return (
                                                                    <option key={key} value={category.id}>{category.name}</option>
                                                                )
                                                            })
                                                        }

                                                    </select>
                                                    {
                                                        errors.category && <p className='invalid-feedback'>{errors.category.message}</p>
                                                    }
                                                </div>

                                                <div className="mb-3">
                                                    <label className='form-label' htmlFor="level">Level</label>
                                                    <select
                                                        {
                                                        ...register('level', {
                                                            required: 'the level field is required'
                                                        })
                                                        }
                                                        className={`form-select ${errors.level && 'is-invalid'}`}
                                                        id='level'>
                                                        <option value="">Select a Level</option>
                                                        {
                                                            levels && levels.map((level, key) => {
                                                                return (
                                                                    <option key={key} value={level.id}>{level.name}</option>
                                                                )
                                                            })
                                                        }

                                                    </select>
                                                    {
                                                        errors.level && <p className='invalid-feedback'>{errors.level.message}</p>
                                                    }
                                                </div>

                                                <div className="mb-3">
                                                    <label className='form-label' htmlFor="language">Language</label>
                                                    <select
                                                        {
                                                        ...register('language', {
                                                            required: 'the language field is required'
                                                        })
                                                        }
                                                        className={`form-select ${errors.language && 'is-invalid'}`}
                                                        id='language'>
                                                        <option value="">Select a Language</option>
                                                        {
                                                            languages && languages.map((language, key) => {
                                                                return (
                                                                    <option key={key} value={language.id}>{language.name}</option>
                                                                )
                                                            })
                                                        }

                                                    </select>
                                                    {
                                                        errors.language && <p className='invalid-feedback'>{errors.language.message}</p>
                                                    }
                                                </div>
                                                <div className="mb-3">
                                                    <label className='form-label' htmlFor="description">Description</label>
                                                    <textarea
                                                        {
                                                        ...register('description')
                                                        }
                                                        className='form-control' placeholder="Description" id="description" rows={5}></textarea>
                                                </div>

                                                <label className='form-label'>Pricing</label>
                                                <div className='mb-3'>
                                                    <label className='form-label' htmlFor="sell-price">Sell Price</label>
                                                    <input
                                                        {
                                                        ...register('sell_price', {
                                                            required: 'the sell price field is required'
                                                        })
                                                        }
                                                        type="text"
                                                        placeholder='Sell Price'
                                                        id='sell-price'
                                                        className={`form-control ${errors.sell_price && 'is-invalid'}`}
                                                    />
                                                    {
                                                        errors.sell_price && <p className='invalid-feedback'>{errors.sell_price.message}</p>
                                                    }
                                                </div>

                                                <div className='mb-3'>
                                                    <label className='form-label' htmlFor="cross-price">Cross Price</label>
                                                    <input
                                                        {
                                                        ...register('cross_price')
                                                        }
                                                        type="text"
                                                        placeholder='Cross Price'
                                                        id='cross-price'
                                                        className={`form-control`}
                                                    />

                                                </div>
                                                <button disabled={loading} className='btn btn-primary'>{loading==false?'Update':'Please wait...'}</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>

                                <div className='col-md-5'>
                                   <ManageOutcome/>
                                   <ManageRequirement/>
                                    <EditCover
                                     course={course}
                                     setCourse={setCourse}
                                    />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </Layout>
    )
}

export default EditCourse