import React from 'react'
import Course from '../common/Course'
import Layout from '../common/Layout'
import { apiUrl } from '../common/Config'
import { Link, useSearchParams } from 'react-router-dom'
import Loader from '../common/Loader'
import NotFound from '../common/NotFound'

const Courses = () => {

  const [searchPrams,setSearchPrams]=useSearchParams()
  const [categories, setCategories] = React.useState([])
  const [levels, setLevels] = React.useState([])
  const [languages, setLanguages] = React.useState([])
  const [courses, setCourses] = React.useState([])
  const [loading,setLoading]=React.useState()
  const [keyword,setKeyword]=React.useState('')
  const [sort, setSort]=React.useState('desc')

  //checked category states
  const [categoryChecked, setCategoryChecked] = React.useState(()=>{
    const category=searchPrams.get('category')
    return category ? category.split(',') : []
  })
  const [levelChecked, setLevelChecked] = React.useState(()=>{
    const level=searchPrams.get('level')
    return level ? level.split(',') : []
  })


  const [languageChecked, setLanguageChecked] = React.useState(()=>{
    const language=searchPrams.get('language')
    return language ? language.split(',') : []
  })


  //fetch categories
  const fetchCategories = async () => {
    await fetch(`${apiUrl}/fetch-categories`, {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      }
    }).then(res => res.json())
      .then(result => {
        if (result.status == 200) {
          setCategories(result.data)
          //console.log(result)
        } else {
          console.log('something went wrong')
        }
      })
  }


  //fetch levels
  const fetchLevels=async()=>{
    await fetch(`${apiUrl}/fetch-levels`,{
        method:'GET',
        headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
        }
    }).then(res=>res.json())
    .then(result=>{
        if(result.status==200){
            setLevels(result.data)
            //console.log(result)
        }else{
            console.log('something went wrong')
        }
    })
  }
  

  //fetch languages
  const fetchLanguages=async()=>{
    await fetch(`${apiUrl}/fetch-languages`,{
        method:'GET',
        headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
        }
    }).then(res=>res.json())
    .then(result=>{
        if(result.status==200){
            setLanguages(result.data)
            //console.log(result)
        }else{
            console.log('something went wrong')
        }
    })
  }

  //fetch courses
  const fetchCourses=async()=>{

    setLoading(true)
    let search=[]
    let prams=''

    if(categoryChecked.length>0){
      search.push(['category',categoryChecked])
    }

    if(levelChecked.length>0){
      search.push(['level',levelChecked])
    }

    if(languageChecked.length>0){
      search.push(['language',languageChecked])
    }

    if(keyword.length>0){
      search.push(['keyword',keyword])
    }else{
      setKeyword('')
    }

    search.push(['sort',sort])
   
    
    if(search.length>0){
      prams=new URLSearchParams(search)
      setSearchPrams(prams)
    }

    await fetch(`${apiUrl}/get-courses?${prams}`,{
        method:'GET',
        headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
        }
    }).then(res=>res.json())
    .then(result=>{
        setLoading(false)
        if(result.status==200){
            setCourses(result.data)
            //console.log(result)
        }else{
            console.log('something went wrong')
        }
    })
  }

  const clearFilter=()=>{
    setCategoryChecked([])
    setLevelChecked([])
    setLanguageChecked([])
    setKeyword('')
    setSort('desc')
    setSearchPrams('')

    document.querySelectorAll('.form-check-input').forEach(element=>element.checked=false)
  }

  const hadnleCategory=(e)=>{

    const {checked, value}=e.target
    if(checked){
      setCategoryChecked(prev=>[...prev,value])
    }else{
      setCategoryChecked(categoryChecked.filter(id=>id!=value))
    }
  }

  const handleLevel=(e)=>{

    const {checked, value}=e.target
    if(checked){
      setLevelChecked(prev=>[...prev,value])
    }else{
      setLevelChecked(levelChecked.filter(id=>id!=value))
    }
  }

  const handleLanguage=(e)=>{
    const {checked, value}=e.target
    if(checked){
      setLanguageChecked(prev=>[...prev,value])
    }else{
      setLanguageChecked(languageChecked.filter(id=>id!=value))
    }
  }

  React.useEffect(()=>{
    fetchCategories()
    fetchLevels()
    fetchLanguages()
    fetchCourses()
  },[categoryChecked,levelChecked,languageChecked,keyword,sort])


  return (
    <Layout>
      <div className='container pb-5 pt-3'>
        <nav aria-label="breadcrumb">
          <ol className="breadcrumb">
            <li className="breadcrumb-item"><a href="#">Home</a></li>
            <li className="breadcrumb-item active" aria-current="page">Courses</li>
          </ol>
        </nav>
        <div className='row'>
          <div className='col-lg-3'>
            <div className='sidebar mb-5 card border-0'>
              <div className='card-body shadow'>
                <div className="mb-3 input-group">
                  <input 
                    value={keyword}
                    onChange={(e)=>setKeyword(e.target.value)}
                    type="text" 
                    placeholder='Seach by Keyword' 
                    className="form-control" 
                  />
                  <button className='btn btn-primary btn-sm'>Search</button>
                </div>
                <div className='pt-3'>
                  <h3 className='h5 mb-2'>Category</h3>
                  <ul>
                    {
                      categories && categories.map(category=>{
                        return (
                           <li key={category.id}>
                            <div className="form-check">
                              <input 
                                defaultChecked={searchPrams.get('category')?searchPrams.get('category').includes(category.id):false}
                                onClick={(e)=>hadnleCategory(e)}
                                className="form-check-input" 
                                type="checkbox" 
                                value={category.id} 
                                id={`category-${category.id}`} 
                                />
                              <label className="form-check-label" htmlFor={`category-${category.id}`}>
                                {category.name}
                              </label>
                            </div>
                          </li>
                        )
                      })
                    }
                  </ul>
                </div>
                <div className='mb-3'>
                  <h3 className='h5  mb-2'>Level</h3>
                  <ul>
                    {
                      levels && levels.map(level=>{
                        return (
                           <li key={level.id}>
                            <div className="form-check">
                              <input 
                                defaultChecked={searchPrams.get('level')?searchPrams.get('level').includes(level.id):false}
                                onClick={e=>handleLevel(e)}
                                className="form-check-input" 
                                type="checkbox" 
                                value={level.id} 
                                id={`level-${level.id}`} 
                              />
                              <label className="form-check-label" htmlFor={`level-${level.id}`}>
                                {level.name}
                              </label>
                            </div>
                          </li>
                        )
                      })
                    }
                  </ul>
                </div>
                <div className='mb-3'>
                  <h3 className='h5 mb-2'>Language</h3>
                  <ul>
                    {
                      languages && languages.map(language=>{
                        return (
                           <li key={language.id}>
                            <div className="form-check">
                              <input 
                                defaultChecked={searchPrams.get('language')?searchPrams.get('language').includes(language.id):false}
                                onClick={e=>handleLanguage(e)}
                                className="form-check-input" 
                                type="checkbox" 
                                value={language.id} 
                                id={`language-${language.id}`} 
                              />
                              <label className="form-check-label" htmlFor={`language-${language.id}`}>
                                {language.name}
                              </label>
                            </div>
                          </li>
                        )
                      })
                    }
                  </ul>
                </div>
                <Link onClick={()=>clearFilter()} className='clear-filter'>Clear All Filters</Link>
              </div>
            </div>
          </div>
          <div className='col-lg-9'>
            <section className='section-3'>
              <div className='d-flex justify-content-between mb-3 align-items-center'>
                <div className='h5 mb-0'>
                  {/* 10 courses found */}
                </div>
                <div>
                  <select 
                    onChange={(e)=>setSort(e.target.value)}
                    value={sort}
                    className='form-select'>
                    <option value="desc">Newset First</option>
                    <option value="asc">Oldest First</option>
                  </select>
                </div>
              </div>
              <div className="row gy-4">
                {
                  loading==false && courses.length==0 && <NotFound/>
                }
                {
                  loading==true && <Loader/>
                }
                {
                  loading==false && courses && courses.map(course=>(
                       <Course
                        key={course.id}
                        course={course}
                        customClasses="col-lg-4 col-md-6"
                        />
                  ))
                }

               
               
              </div>
            </section>
          </div>
        </div>
      </div>
    </Layout>
  )
}

export default Courses