import React, { useEffect } from 'react'
import Layout from '../../common/Layout'
import { Link } from 'react-router-dom'
import UserSidebar from '../../common/UserSidebar'
import EditCourse from '../../common/EditCourse'
import { apiUrl,token } from '../../common/Config'

const MyCourses = () => {

  const [courses,setCourses]=React.useState([])

  const fetchCourses=async()=>{
    await fetch(`${apiUrl}/my-courses`,{
      method:'POST',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': `Bearer ${token}`
      }
    }).then(res=>res.json())
    .then(result=>{
      if(result.status==200){
        setCourses(result.courses)
      }
    })
  }


  useEffect(()=>{
    fetchCourses()
  },[])

  return (
    <Layout>
      <section className='section-4'>
        <div className='container'>
          <div className='row'>
            <div className='col-md-12 mt-5 mb-3'>
              <div className='d-flex justify-content-between'>
                <h2 className='h4 mb-0 pb-0'>My Courses</h2>
                <Link to="/account/courses/create" className='btn btn-primary'>Create</Link>
              </div>
            </div>
            <div className='col-lg-3 account-sidebar'>
              <UserSidebar />
            </div>
            <div className='col-lg-9'>
              <div className='row gy-4'>
                {
                  courses.map((course,index)=>{
                    return(
                      <EditCourse key={index} course={course} />
                    )
                  })
                }
                
              </div>
            </div>
          </div>
        </div>
      </section>
    </Layout>
  )
}

export default MyCourses