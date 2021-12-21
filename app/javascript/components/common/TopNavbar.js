import React from 'react';
import {Navbar, Container, Nav} from 'react-bootstrap';
import mahakal_logo from '../../../assets/images/icons/mahakal_logo.jpg'

const TopNavbar = () => {
  return(
    <div>
      <Navbar collapseOnSelect expand="lg" bg="dark" variant="dark" style={{zIndex: '9999999'}}>
        <img src={mahakal_logo} style={{height: '50px'}}/>
        <Navbar.Brand href="#home">Mahakaleshwar</Navbar.Brand>
        <Container>
        <Navbar.Toggle aria-controls="responsive-navbar-nav" />
        <Navbar.Collapse id="responsive-navbar-nav">
          <Nav className="me-auto">
            <Nav.Link href="#features">Aarti Slots</Nav.Link>
            <Nav.Link href="#pricing">Temple History</Nav.Link>
            <Nav.Link href="#pricing">User Details</Nav.Link>
          </Nav>
        </Navbar.Collapse>
        </Container>
      </Navbar>
    </div>
  )
}

export default TopNavbar;