import React from 'react'
import {apiUrl} from '../common/Config'
import { Link } from 'react-router-dom'

const FeaturedCategories = () => {

    const [categories, setCategories] = React.useState([])

    React.useEffect(()=>{
        fetch(`${apiUrl}/fetch-categories`,{
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
    },[])
    return (
        <section className='section-2'>
            <div className="container">
                <div className='section-title py-3  mt-4'>
                    <h2 className='h3'>Explore Categories</h2>
                    <p>Discover learning paths designed to elevate your professional journey and personal potential.</p>
                </div>
                <div className='row gy-3'>
                    {
                        categories && categories.map(category=>{
                            return (
                                <div key={category.id} className='col-6 col-md-6 col-lg-3' >
                                    <div className='card shadow border-0'>
                                        <div className='card-body'><Link to={`/courses?category=${category.id}`}>{category.name}</Link></div>
                                    </div>
                                </div>
                            )
                        })
                    }
                </div>
            </div>
        </section>
    )
}

export default FeaturedCategories