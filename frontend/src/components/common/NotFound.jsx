import React from 'react'

const NotFound = ({text}) => {
  return (
    <div className='col-12'>
        <div className="card shadow border-0 py-5 text-center">
            <h4>{text ? text : "No Data Found"}</h4>
            <p>
                we couldn't find any matching records,please adjust search or filter and try again.
            </p>
        </div>
    </div>
  )
}

export default NotFound