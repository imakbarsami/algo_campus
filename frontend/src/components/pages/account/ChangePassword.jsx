import React from 'react'
import Layout from '../../common/Layout'
import UserSidebar from '../../common/UserSidebar'
import { Link } from 'react-router-dom'
import { useForm } from 'react-hook-form'
import { apiUrl, token } from '../../common/Config'
import { toast } from 'react-hot-toast'
import Loader from '../../common/Loader'

const ChangePassword = () => {

  const { register, handleSubmit, formState: { errors }, setError,reset,watch } = useForm()
  const [loading, setLoading] = React.useState(false)

  const newPassword=watch('password')

  const onSubmit = async (data) => {
    setLoading(true)
    //console.log(data)
    const res=await fetch(`${apiUrl}/change-password`,{
          method:'POST',
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': `Bearer ${token}`
          },
          body:JSON.stringify(data)
    })

    const result=await res.json()
    if(result.status==200){
      toast.success(result.message)
      setLoading(false)
      reset()
    }else{
      const errors=result.errors
      Object.keys(errors).forEach(field=>{
        setError(field,
          {message:errors[field][0]},)
      })
      setLoading(false)
    }

    
  }
  return (
    <Layout>
      <section className='section-4'>
        <div className='container pb-5 pt-3'>
          <nav aria-label="breadcrumb">
            <ol className="breadcrumb">
              <li className="breadcrumb-item"><Link to="/account/dashboard">Account</Link></li>
              <li className="breadcrumb-item active" aria-current="page">Password</li>
            </ol>
          </nav>
          <div className='row'>
            <div className='col-md-12 mt-5 mb-3'>
              <div className='d-flex justify-content-between'>
                <h2 className='h4 mb-0 pb-0'>Change Password</h2>
              </div>
            </div>
            <div className='col-lg-3 account-sidebar'>
              <UserSidebar />
            </div>
            <div className='col-lg-9'>
              <div className='row'>
                  <div className='col-md-12'>
                    <div className='card p-3 border-0 shadow-lg'>
                      <div className="card-body">
                        <form onSubmit={handleSubmit(onSubmit)}>
                          <div className="mb-3">
                            <label className='form-label'>Old Password</label>
                            <input
                              {
                              ...register('old_password', {
                                required: 'the old password field is required'
                              })
                              }
                              className={`form-control ${errors.old_password && 'is-invalid'}`}
                              type='password'
                            />
                            {
                              errors.old_password && <p className='invalid-feedback'>{errors.old_password.message}</p>
                            }
                          </div>

                          <div className="mb-3">
                            <label className='form-label'>New Password</label>
                            <input
                              {
                              ...register('password', {
                                required: 'the new password field is required'
                              })
                              }
                              className={`form-control ${errors.password && 'is-invalid'}`}
                              type='password'
                            />
                            {
                              errors.password && <p className='invalid-feedback'>{errors.password.message}</p>
                            }
                          </div>
                          <div className="mb-3">
                            <label className='form-label'>Confirm Password</label>
                            <input
                              {
                              ...register('confirm_password', {
                                required: 'the confirm password field is required',
                                validate:(value)=>{
                                  return value===newPassword || 'password and confirm password must be same'
                                }
                              })
                              }
                              className={`form-control ${errors.confirm_password && 'is-invalid'}`}
                              type='password'
                            />
                            {
                              errors.confirm_password && <p className='invalid-feedback'>{errors.confirm_password.message}</p>
                            }
                          </div>

                          <button disabled={loading} className='btn btn-primary'>{loading ? 'Please wait...' : 'Change Password'}</button>
                        </form>
                      </div>
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

export default ChangePassword