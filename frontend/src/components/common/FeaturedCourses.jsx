import React, { useEffect } from 'react'
import Course from './Course'
import { apiUrl } from './Config'

const FeaturedCourses = () => {

    const [courses, setCourses] = React.useState([])

    useEffect(()=>{

        fetch(`${apiUrl}/fetch-courses`,{
            method:'GET',
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            }
        }).then(res=>res.json())
        .then(result=>{
            if(result.status==200){
                setCourses(result.data)
                //console.log(result)
            }else{
                console.log('something went wrong')
            }
        })

    },[])


    return (
        <section className='section-3 my-5'>
            <div className="container">
                <div className='section-title py-3  mt-4'>
                    <h2 className='h3'>Featured Courses</h2>
                    <p>Find your path. Grow your skills. Shape your future.</p>
                </div>
                <div className="row gy-4">
                    {
                        courses && courses.map(course=>{
                            return(
                                <Course
                                    key={course.id}
                                    course={course}
                                    customClasses="col-lg-3 col-md-6"
                                />
                            )
                        })
                    }
                </div>
            </div>
        </section>
    )
}

export default FeaturedCourses