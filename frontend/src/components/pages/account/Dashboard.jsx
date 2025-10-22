import React from 'react'
import Layout from '../../common/Layout'
import UserSidebar from '../../common/UserSidebar'
import { Link } from 'react-router-dom'
import { apiUrl, token } from '../../common/Config'

const Dashboard = () => {

    const [enrolled, setEnrolled] = React.useState(0);
    const [activeCourses, setActiveCourses] = React.useState(0);
    const [sales, setSales] = React.useState(0);

    const fetchDashboardInfo=async()=>{
        await fetch(`${apiUrl}/dashboard-info`,{
            method:'GET',
            headers:{
                'Content-Type':'application/json',
                'Accept':'application/json',
                'Authorization':`Bearer ${token}`
            }
        }).then(res=>res.json())
        .then(result=>{
            if(result.status==200){
                setEnrolled(result.enrolled)
                setActiveCourses(result.activeCourses)
                setSales(result.sales)
            }
        })
    }


    React.useEffect(()=>{
        fetchDashboardInfo()
    },[])
    return (
        <Layout>
            <section className='section-4'>
                <div className='container pb-5 pt-3'>
                    <nav aria-label="breadcrumb">
                        <ol className="breadcrumb">
                            <li className="breadcrumb-item"><Link to="/account/dashboard">Account</Link></li>
                            <li className="breadcrumb-item active" aria-current="page">Dashboard</li>
                        </ol>
                    </nav>
                    <div className='row'>
                        <div className='col-md-12 mt-5 mb-3'>
                            <div className='d-flex justify-content-between'>
                                <h2 className='h4 mb-0 pb-0'>Dashboard</h2>
                            </div>
                        </div>
                        <div className='col-lg-3 account-sidebar'>
                            <UserSidebar />
                        </div>
                        <div className='col-lg-9'>
                            <div className='row'>
                                <div className='col-md-4'>
                                    <div className='card shadow '>
                                        <div className='card-body p-3'>
                                            <h2>{sales}</h2>
                                            <span>Sales</span>
                                        </div>
                                        <div className='card-footer'>
                                            &nbsp;
                                            {/* <Link to="">View Users</Link> */}
                                        </div>
                                    </div>
                                </div>
                                <div className='col-md-4'>
                                    <div className='card shadow '>
                                        <div className='card-body p-3'>
                                            <h2>{enrolled}</h2>
                                            <span>Enrolled Users</span>
                                        </div>
                                        <div className='card-footer'>
                                            &nbsp;
                                        </div>
                                    </div>
                                </div>
                                <div className='col-md-4'>
                                    <div className='card shadow '>
                                        <div className='card-body p-3'>
                                            <h2>{activeCourses}</h2>
                                            <span>Active Courses</span>
                                        </div>
                                        <div className='card-footer'>
                                            <Link to="/">View Courses</Link>
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

export default Dashboard