import React from 'react'
import {apiUrl } from '../common/Config'
import { Link } from 'react-router-dom'
import { AuthContext } from '../context/Auth'

const Footer = () => {

  const { user } = React.useContext(AuthContext)

  const [categories,setCategories]=React.useState([])

  const fetchCategories=async()=>{
      await fetch(`${apiUrl}/fetch-categories`,{
         method:'GET',
         headers: {
             'Content-Type': 'application/json',
             'Accept': 'application/json',
         }
      }).then(res=>res.json())
      .then(result=>{
          if(result.status==200){
              setCategories(result.data)
              //console.log(result)
          }else{
              console.log('something went wrong')
          }
      })
  }

  React.useEffect(()=>{
    fetchCategories()
  },[])
  return (
    <footer >
      <div className='pt-5 container mt-5'>
        <div className='row pb-3 gy-4 justify-content-center'>

          <div className='col-lg-3 col-12'>
            <div className='col-lg-12 col-md-6 col-12 pe-lg-5'>
              <h2>AlgoCampus</h2>
              <p>Learn what you love. Grow where you are.Join our community and discover courses that fit your goals, your schedule, and your curiosity.</p>
            </div>
          </div>

          <div className='col-lg-3 col-md-6 col-12'>
            <h2>Popular Categories</h2>
            <ul>
                {
                  categories && categories.map((category,index)=>{
                    return <li key={index}><Link to={`/courses?category=${category.id}`}>{category.name}</Link></li>
                  })
                }

            </ul>
          </div>

          <div className='col-lg-3 col-md-6 col-12'>
            <h2>Quick Links</h2>
            <ul>
              {
                !user && (
                  <>
                    <li><Link to="/account/login">Login</Link></li>
                    <li><Link to="/account/register">Register</Link></li>
                  </>
                )
              }
              <li><Link to="/account/dashboard">My Account</Link></li>
              <li><Link to="/courses">Courses</Link></li>
            </ul>
          </div>

        </div>
        <div className='row copyright'>
          <div className='col-md-12 text-center py-4'>
            &copy; {new Date().getFullYear()} All Rights Reserverd
          </div>
        </div>
      </div>
    </footer>
  )
}

export default Footer