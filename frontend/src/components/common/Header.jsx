import React from 'react'
import Button from 'react-bootstrap/Button';
import Container from 'react-bootstrap/Container';
import Form from 'react-bootstrap/Form';
import Nav from 'react-bootstrap/Nav';
import Navbar from 'react-bootstrap/Navbar';


const Header = () => {
  return (
    <>
      <Navbar expand="md" className="shadow-lg header py-3">
        <Container >
          <Navbar.Brand href="/"><strong>AlgoCampus</strong></Navbar.Brand>
          <Navbar.Toggle aria-controls="navbarScroll" />
          <Navbar.Collapse id="navbarScroll">
            <Nav
              className="me-auto my-2 my-lg-0"
              navbarScroll
            >
              <Nav.Link href="/courses" className=''>All Courses</Nav.Link>
            
            </Nav>
            <a href='/account/dashboard' className="btn btn-primary">My Account</a>
          </Navbar.Collapse>
        </Container>
      </Navbar>
    </>
  )
}

export default Header