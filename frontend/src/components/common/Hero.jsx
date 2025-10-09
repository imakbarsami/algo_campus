import React from 'react'
import HeroImg from  '../../assets/images/hero-algo.png'

const Hero = () => {
    return (
        <section className='section-1'>
            <div className='container '>
                <div className="row align-items-center">
                    <div className="col-md-6">
                        <h1 className="display-3 fw-bold">Education Made Flexible</h1>
                        <p className="lead">High-quality courses in every discipline. Learn online, at your own pace, with expert instructors and real-world projects.</p>
                        <a href="/courses" className="btn btn-white">Explore Courses</a>
                    </div>
                    <div className="col-md-6 text-center">
                        <img src={HeroImg} alt="Student Learning" className="img-fluid mb-2 " />
                    </div>
                </div>
            </div>
        </section>
    )
}

export default Hero