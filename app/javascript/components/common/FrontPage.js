import React from "react"
import {Carousel, Row, Col, Table} from "react-bootstrap"
import Image1 from '../../../assets/images/icons/mahakal_image1.jpg'
import Image2 from '../../../assets/images/icons/mahakal_image2.jpg'
import Image3 from '../../../assets/images/icons/mahakal_image3.jpeg'
import SideBar from './SideBar'
import TopNavbar from'./TopNavbar'
import {Navbar, Container, Nav} from 'react-bootstrap';

const FrontPage = () => {
  return (
    <>
      <Row>
        <div  style={{zIndex: '9999'}}>
        <TopNavbar />
        </div>
        <Col xs={2} style={{marginRight: '-60px'}}>
          <SideBar />
        </Col>
        <Col xs={10} style={{width: '86.33%'}}>
          <div>
            <Carousel>
              <Carousel.Item interval={1000}  style={{height: "430px"}}>
                <img
                  className="d-block w-100"
                  src={Image1}
                  alt="First slide"
                />
                <Carousel.Caption>
                  <h3>First slide label</h3>
                  <p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
                </Carousel.Caption>
              </Carousel.Item>
              <Carousel.Item interval={500}  style={{height: "430px"}}>
                <img
                  className="d-block w-100"
                  src={Image2}
                  alt="Second slide"
                />
                <Carousel.Caption>
                  <h3>Second slide label</h3>
                  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                </Carousel.Caption>
              </Carousel.Item>
              <Carousel.Item interval={1000} style={{height: "430px"}}>
                <img
                  className="d-block w-100"
                  src={Image3}
                  alt="Third slide"
                />
                <Carousel.Caption>
                  <h3>Third slide label</h3>
                  <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur.</p>
                </Carousel.Caption>
              </Carousel.Item>
            </Carousel>
          </div>
          <div>
          <Row style={{marginTop: '30px', textAlign: 'center', backgroundColor: '#645e58'}}>
            <Col xs={6}>
              <h3>Temple History</h3>
              <p style={{padding: '40px'}}>The idol of Mahakaleshwar is known to be dakshinamukhi, which means that it is facing the south. This is a unique feature, upheld by the tantric shivnetra tradition to be found only in Mahakaleshwar among the 12 Jyotirlingas. The idol of Omkareshwar Mahadev is consecrated in the sanctum above the Mahakal shrine. The images of Ganesh, Parvati and Karttikeya are installed in the west, north, and east of the sanctum sanctorum. To the south is the image of Nandi, the vehicle of Shiva. The idol of Nagchandreshwar on the third storey is open for darshan only on the day of Nag Panchami. The temple has five levels, one of which is underground. The temple itself is located in a spacious courtyard surrounded by massive walls near a lake. The shikhar or the spire is adorned with sculptural finery. Brass lamps light the way to the underground sanctum. It is believed that prasada (holy offering) offered here to the deity can be re-offered unlike all other shrines.[8]

              The presiding deity of time, Shiva, in all his splendor, reigns eternally in the city of Ujjain. The temple of Mahakaleshwar, its shikhar soaring into the sky, an imposing façade against the skyline, evokes primordial awe and reverence with its majesty. The Mahakal dominates the life of the city and its people, even in the midst of the busy routine of modern preoccupations, and provides an unbreakable link with ancient Hindu traditions.</p>
            </Col>
            <Col xs={6}>
              <h3>Aarti Slot's</h3>
              <Table striped bordered hover variant="dark">
                <thead>
                  <tr>
                    <th>S.No</th>
                    <th>Aarti Name</th>
                    <th>Starting Time</th>
                    <th>Ending Time</th>
                    <th>Day(s)</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>1</td>
                    <td>Maha Aarti</td>
                    <td>4:00AM</td>
                    <td>7:00AM</td>
                    <td>Mon, Tues, Wed</td>
                  </tr>
                  <tr>
                    <td>2</td>
                    <td>Short Aarti</td>
                    <td>10:00AM</td>
                    <td>11:00AM</td>
                    <td>Sat, Sun</td>
                  </tr>
                  <tr>
                    <td>3</td>
                    <td>Long Aarti</td>
                    <td>6:00PM</td>
                    <td>6:00PM</td>
                    <td>Sat, Sun</td>
                  </tr>
                  <tr>
                    <td>4</td>
                    <td>Maha Aarti</td>
                    <td>4:00AM</td>
                    <td>7:00AM</td>
                    <td>Mon, Tues, Wed</td>
                  </tr>
                  <tr>
                    <td>5</td>
                    <td>Short Aarti</td>
                    <td>10:00AM</td>
                    <td>11:00AM</td>
                    <td>Sat, Sun</td>
                  </tr>
                  <tr>
                    <td>6</td>
                    <td>Long Aarti</td>
                    <td>6:00PM</td>
                    <td>6:00PM</td>
                    <td>Sat, Sun</td>
                  </tr>
                </tbody>
              </Table>
            </Col>
          </Row>
          <Row style={{backgroundColor: '#ffd91e', height: '60px'}}>
            <h3>Locate on Map</h3>
          </Row>
          </div>
        </Col>
          <Navbar collapseOnSelect expand="lg" bg="dark" variant="dark" style={{height: '150px', zIndex: '9999'}}>
          <Navbar.Brand href="#home">@copyright by Mahakaleshwar</Navbar.Brand>
          <Container>
          <Navbar.Toggle aria-controls="responsive-navbar-nav" />
          <Navbar.Collapse id="responsive-navbar-nav">
            <Nav className="me-auto">
              <Nav.Link href="#features">Facebook</Nav.Link>
              <Nav.Link href="#pricing">Twitter</Nav.Link>
              <Nav.Link href="#pricing">LinkedIn</Nav.Link>
              <Nav.Link href="#pricing">Instagram</Nav.Link>
            </Nav>
          </Navbar.Collapse>
          </Container>
        </Navbar>
      </Row>
    </>
  )
}

export default FrontPage