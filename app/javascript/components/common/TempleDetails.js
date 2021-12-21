import React, {useState} from 'react';
import {Row, Col, Button} from 'react-bootstrap'
import { withFormik, Form, Field } from 'formik';
import * as Yup from 'yup';
import SideBar from './SideBar'
import TopNavbar from './TopNavbar'
import {Navbar, Container, Nav} from 'react-bootstrap';

const TempleDetails = (props) => {
  const [items, setItems] = useState()
  console.log("props ==========", props)
  // debugger
  const [result, setResult] = useState()
  // const { id } = useParams()
  const loginPageStyle = {
    margin: "100px 0px 0px 255px",
    maxWidth: "80%",
    background: "#fff",
    padding: "60px",
    borderRadius: "10px",
    boxShadow: "0px 0px 10px 10px rgba(0,0,0,0.15)",
    background: "linear-gradient(to right bottom, #ff6b6b, #f8c016)",
    textAlign: "center"
  }

  const { touched, errors } = props;
  return(
    <>
    <SideBar />
    <TopNavbar />
    <React.Fragment>
      <div className="container">
        <div className="login-wrapper" style={loginPageStyle}>
          <h2 >Enter Temple Details</h2>
          <Form className="form-container">
          <Row xs={12}>
            <Col xs={6}>
              <div className="form-group" >
                <label htmlFor="text">Temple Name</label>
                <Field type="text" name="temple_name" className={"form-control"} placeholder="Please Enter Temple's Name"/>
                { touched.temple_name && errors.temple_name && <span className="help-block text-danger">{errors.name}</span> }
              </div>
            </Col>
            <Col xs={6}>
              <div className="form-group">
                <label htmlFor="email">Email</label>
                <Field type="text" name="temple_email" className={"form-control"} placeholder="Please Enter Email"/>
                { touched.temple_email && errors.temple_email && <span className="help-block text-danger">{errors.email}</span> }
              </div>
            </Col>
            </Row>
            <Row xs={12}>
              <div className="form-group">
                <label htmlFor="text">Description</label>
                <Field type="text" name="description" className={"form-control"} placeholder="Please Enter Description"/>
                { touched.description && errors.description && <span className="help-block text-danger">{errors.description}</span> }
                </div>
            </Row>
            <Row xs={12}>
              <Col xs={6}>
                <div className="form-group">
                  <label htmlFor="number">Contact Number</label>
                  <Field type="number" name="phone_no" className={"form-control"} placeholder="Please Enter Contact Number"/>
                  { touched.phone_no && errors.phone_no && <span className="help-block text-danger">{errors.contactnumber}</span> }
                </div>
              </Col>
              <Col xs={6}>
                <div className="form-group">
                  <label htmlFor="text">Address</label>
                  <Field type="text" name="temple_address" className={"form-control"} placeholder="Please Enter Address"/>
                  { touched.temple_address && errors.temple_address && <span className="help-block text-danger">{errors.address}</span> }
                </div>
              </Col>
            </Row>
            <Row xs={12}>
              <Col xs={6}>
                <div className="form-group">
                  <label htmlFor="text">City</label>
                  <Field type="text" name="city" className={"form-control"} placeholder="Please Enter City"/>
                  { touched.city && errors.city && <span className="help-block text-danger">{errors.email}</span> }
                </div>
              </Col>
              <Col xs={6}>
                 <div className="form-group">
                  <label htmlFor="text">State</label>
                  <Field type="text" name="state" className={"form-control"} placeholder="Please Enter State"/>
                  { touched.state && errors.state && <span className="help-block text-danger">{errors.state}</span> }
                </div>
              </Col>
            </Row>
            <Row xs={12}>
              <Col xs={6}>
                <div className="form-group">
                  <label htmlFor="text">Country</label>
                  <Field type="text" name="country" className={"form-control"} placeholder="Please Enter Country"/>
                  { touched.country && errors.country && <span className="help-block text-danger">{errors.country}</span> }
                </div>
              </Col>
              <Col xs={6}>
                <div className="form-group">
                  <label htmlFor="number">Zipcode</label>
                  <Field type="number" name="zipcode" className={"form-control"} placeholder="Please Enter Zipcode"/>
                  { touched.zipcode && errors.zipcode && <span className="help-block text-danger">{errors.zipcode}</span> }
                </div>
              </Col>
            </Row>
            <Row xs={12}>
              <Col xs={6}>
                 <div className="form-group">
                  <label htmlFor="text">Opening Time</label>
                  <Field type="text" name="start_time" className={"form-control"} placeholder="(HH/MM)"/>
                  { touched.start_time && errors.start_time && <span className="help-block text-danger">{errors.opening}</span> }
                </div>
              </Col>
              <Col xs={6}>
                 <div className="form-group">
                    <label htmlFor="number">Closing Time</label>
                    <Field type="text" name="end_time" className={"form-control"} placeholder="(HH/MM)"/>  
                    { touched.end_time && errors.end_time && <span className="help-block text-danger">{errors.closing}</span> }
                  </div>
              </Col>
            </Row>
            <Row xs={12}>
              <Col xs={6}>
                <div className="form-group">
                  <label htmlFor="text">Close Day(s) (optional)</label>
                  <Field type="text" name="closedays" className={"form-control"} placeholder="Plese Enter Close days, if any"/>
                </div>
              </Col>
            </Row>
             <button type="submit" className="btn btn-primary" style={{backgroundColor: 'red', padding: '8px 13px', borderRadius: '20px', marginTop: '15px', color: 'black'}}>Submit</button>
          </Form>
        </div>
      </div>
    </React.Fragment>
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
    </>
  );
}

const LoginFormik = withFormik({
  mapPropsToValues: (props) => {
    return {
      temple_email: props.temple_email || '',
      temple_name: props.temple_name || '',
      description: props.description || '',
      phone_no: props.phone_no || '',
      temple_address: props.temple_address || '',
      city: props.city || '',
      state: props.state || '',
      country: props.country || '',
      zipcode: props.zipcode || '',
      start_time: props.start_time || '',
      end_time: props.end_time || '',
      closedays: props.closedays || '',
    }
  },
  validationSchema: Yup.object().shape({
    temple_name: Yup.string().required('Name is required'),
    description: Yup.string().required('Description is required'),
    phone_no: Yup.string().required('Contact Number is required'),
    temple_email: Yup.string().email('Email not valid').required('Email is required'),
    temple_address: Yup.string().required('Address is required'),
    city: Yup.string().required('City is required'),
    state: Yup.string().required('State is required'),
    country: Yup.string().required('Country is required'),
    zipcode: Yup.string().required('Zipcode is required'),
    start_time: Yup.string().required('Opening Time is required'),
    end_time: Yup.string().required('Closing Time is required'),
  }),
  handleSubmit: (values) => {
      const REST_API_URL = "/temples";
      fetch(REST_API_URL, {
        method: 'POST',
        body: JSON.stringify(values),
        headers: {
          'Content-Type': 'application/json'
        }
      }).then(response=> {
        if (response.ok) {
          return response.json();
        } else {
          // HANDLE ERROR
          throw new Error('Something went wrong');
        }
      }).then(data => {
        // HANDLE RESPONSE DATA
        console.log(data);
      }).catch((error) => {
        // HANDLE ERROR
        console.log(error);
      });
    }
  })(TempleDetails);

export default LoginFormik
