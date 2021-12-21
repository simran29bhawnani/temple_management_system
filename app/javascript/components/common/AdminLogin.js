import React, { useState } from 'react';
import { withFormik, Form, Field } from 'formik';
import * as Yup from 'yup';
import { useHistory } from 'react-router-dom';

const AdminLogin = (props) => {
  const history = useHistory();
  const [userId, setUserId] = useState()
  const loginPageStyle = {
    margin: "225px auto 37px",
    maxWidth: "530px",
    background: "#fff",
    padding: "60px",
    borderRadius: "10px",
    boxShadow: "0px 0px 10px 10px rgba(0,0,0,0.15)",
    backgroundColor: "#dae2ff",
    textAlign: 'center'
  }
  const { touched, errors } = props;
  return(
    <React.Fragment>
      <div className="container">
        <div className="login-wrapper" style={loginPageStyle}>
          <h2 style={{marginBottom: '40px'}}>Login Page</h2>
          <Form className="form-container">
            <div className="form-group" style={{margin: '15px 0px'}}>
              <label htmlFor="email">Email</label>
              <Field type="text" name="email" className={"form-control"} placeholder="Email" style={{marginLeft: '15px'}}/>
              { touched.email && errors.email && <span className="help-block text-danger">{errors.email}</span> }
            </div>
            <div className="form-group" style={{margin: '15px 0px'}}>
              <label htmlFor="password">Password</label>
              <Field type="password" name="password" className={"form-control"} placeholder="Password" style={{marginLeft: '15px'}}/>
              { touched.password && errors.password && <span className="help-block text-danger">{errors.password}</span> }
            </div>
             <button type="submit" className="btn btn-primary" style={{backgroundColor: '#c5c5ff', padding: '8px 13px', borderRadius: '20px', marginTop: '15px'}}>Login</button>
          </Form>
        </div>
      </div>
    </React.Fragment>
  );
}
const LoginFormik = withFormik({
  mapPropsToValues: (props) => {
    return {
      email: props.email || '',
      password: props.password || ''
    }
  },
  validationSchema: Yup.object().shape({
    email: Yup.string().email('Email not valid').required('Email is required'),
    password: Yup.string()
      .required('Password is required')
      .min(8, "Password is too short - should be 8 chars minimum.")
      .matches(/(?=.*[0-9])/, "Password must contain a number.")
  }),
  handleSubmit: (values) => {
    const REST_API_URL = "/users/sign_in";
    fetch(REST_API_URL, {
      method: 'POST',
      body: JSON.stringify(values),
      headers: {
        'Content-Type': 'application/json'
      }
    }).then(response=> {
      // debugger
      if (response.ok) {
          response.json()
          // setUserId(response.json())
        // return(
          console.log('response ===== ', response)
          window.location.href = `/temples`
          // history.push("/ShowTempleDetails")
        // )
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
})(AdminLogin);

export default LoginFormik
