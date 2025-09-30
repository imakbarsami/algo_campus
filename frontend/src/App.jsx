import { useState } from 'react'
import 'bootstrap/dist/css/bootstrap.min.css';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import Home from './components/pages/Home.jsx'
import Courses from './components/pages/Courses.jsx';
import Details from './components/pages/Details.jsx';
import Login from './components/pages/Login.jsx';
import Register from './components/pages/Register.jsx';
import MyCourses from './components/pages/account/MyCourses.jsx';
import MyLearning from './components/pages/account/MyLearning.jsx';
import WatchCourse from './components/pages/account/WatchCourse.jsx';
import ChangePassword from './components/pages/account/ChangePassword.jsx';
import { Toaster } from 'react-hot-toast';
import Dashboard from './components/pages/account/Dashboard.jsx';
import { RequiredAuth } from './components/common/RequiredAuth.jsx';
import CreateCourse from './components/pages/course/CreateCourse.jsx';
import EditCourse from './components/pages/course/EditCourse.jsx';
import EditLesson from './components/pages/course/EditLesson.jsx';


function App() {
  const [count, setCount] = useState(0)

  return (
    <>
      <BrowserRouter>
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path='/courses' element={<Courses />} />
          <Route path='/detail/:id' element={<Details />} />
          <Route path='/account/login' element={<Login />} />
          <Route path='/account/register' element={<Register />} />
          <Route path='/account/my-courses' element={<MyCourses />} />
          <Route path='/account/watch-courses' element={<WatchCourse />} />
          <Route path='/account/change-password' element={<ChangePassword />} />

          <Route path='/account/dashboard' element={
            <RequiredAuth>
              <Dashboard />
            </RequiredAuth>
          } />

          <Route path='/account/my-learning' element={
            <RequiredAuth>
              <MyLearning />
            </RequiredAuth>
          }/>

          <Route path='/account/courses/create' element={
            <RequiredAuth>
              <CreateCourse />
            </RequiredAuth>
          } />

          <Route path='/account/courses/edit/:id' element={
            <RequiredAuth>
              <EditCourse />
            </RequiredAuth>
          } />

          <Route path='/account/courses/lesson-edit/:id/:courseId' element={
            <RequiredAuth>
              <EditLesson/>
            </RequiredAuth>
          }/>
          
        </Routes>
      </BrowserRouter>

      <Toaster
        position="top-center"
        reverseOrder={false}
      />
    </>
  )
}

export default App
