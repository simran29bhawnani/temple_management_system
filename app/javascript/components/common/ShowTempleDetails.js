import React, {useState, useEffect} from 'react'
import {Form, Row, Col, Button} from 'react-bootstrap'
import axios from 'axios'
import moment from 'moment';

const ShowTempleDetails = () => {

  const [templeData, setTempleData] = useState([])
  const [items, setItems] = useState()
  const [errorText, setErrorText] = useState()
  const [formContent, setFormContent] = useState({
        temple_name: templeData.temple_name || '',
        description: templeData.description || '',
        phone_no: templeData.phone_no || '',
        city: templeData.city || '',
        state: templeData.state || '',
        country: templeData.country || '',
        zipcode: templeData.zipcode || '',
        temple_address: templeData.temple_address || '',
        temple_email: templeData.temple_email || '',
        start_time: templeData.start_time || '',
        end_time: templeData.end_time || ''
    })

  const getTempleDetails = async () => {
       const url = '/temples'
        const CSRF_Token = document
            .querySelector('meta[name="csrf-token"]')
            .getAttribute('content')

        try {
            const response = await axios.get(`${url}`, {
                headers: {
                    'content-type': 'application/json',
                    'X-CSRF-Token': CSRF_Token,
                },
            })
            setTempleData(response.data.temples[0])
            console.log(response.data.temples[0])
            
        } catch (e) {
            console.error(e.message)
        }
    }

    const deleteTempleData = (id) => {
      let url = `/temples/${id}`
      axios.delete(url).then(res => {
        const del = templeData.filter(item => id !== item.id)
        setItems(del)
      })
  }

  useEffect(() => {
      getTempleDetails()
  }, [])

    const submitEditForm = async (id) => {
        event.preventDefault()
        const url = `/temples/${id}`
        const payload = {
          temple_name: formContent.temple_name !== '' ? formContent.temple_name : templeData.temple_name,
          description: formContent.description !== '' ? formContent.description : templeData.description,
          phone_no: formContent.phone_no !== '' ? formContent.phone_no : templeData.phone_no,
          city: formContent.city !== '' ? formContent.city : templeData.city,
          state: formContent.state !== '' ? formContent.state : templeData.state,
          country: formContent.country !== '' ? formContent.country : templeData.country,
          zipcode: formContent.zipcode !== '' ? formContent.zipcode : templeData.zipcode,
          temple_address: formContent.temple_address !== '' ? formContent.temple_address : templeData.temple_address,
          temple_email: formContent.temple_email !== '' ? formContent.temple_email : templeData.temple_email,
          start_time: formContent.start_time !== '' ? formContent.start_time : templeData.start_time,
          end_time: formContent.end_time !== '' ? formContent.end_time : templeData.end_time
        }
        var form_data = new FormData()
        for (var key in payload) {
            form_data.append(`temple[${key}]`, payload[key])
        }

        const CSRF_Token = document
            .querySelector('meta[name="csrf-token"]')
            .getAttribute('content')

        try {
            const response = await axios.put(url, form_data, {
                headers: {
                    'content-type': 'multipart/form-data',
                    'X-CSRF-Token': CSRF_Token,
                },
            })

            if (!Object.keys(response.data).includes('error')) {
                console.log('error')
            } else {
                setErrorText(response.data.error)
            }
        } catch (e) {
            console.log(e.message, 'error')
            setErrorText('An error occurred: ', e.message)
        }
    }

    const startTime = moment(templeData?.start_time).format("HH:mm")
    const endTime = moment(templeData?.end_time).format("HH:mm")

    const handleInputField = (event, columnHeader) => {
        const value = event.target.value

        setFormContent((prevState) => ({
            ...prevState, [columnHeader]: value,
        }))
    }

  return(
    <div>
      <Form>
        <Form.Group as={Row} className="mb-3">
          <Form.Label column sm="2">Temple Name</Form.Label>
          <Col sm="10">
            <Form.Control type="text" style={{width: '30%'}} 
              defaultValue={templeData?.temple_name}
              onChange={e => {handleInputField(e, 'temple_name')}}
            />
          </Col>
        </Form.Group>
        <Form.Group as={Row} className="mb-3">
          <Form.Label column sm="2">Temple Address</Form.Label>
          <Col sm="10">
            <Form.Control type="text" style={{width: '30%'}} 
              defaultValue={templeData?.temple_address}
              onChange={e => {handleInputField(e, 'temple_address')}}
            />
          </Col>
        </Form.Group>
        <Form.Group as={Row} className="mb-3" controlId="exampleForm.ControlInput1">
          <Form.Label column sm="2">Email</Form.Label>
          <Col sm="10">
            <Form.Control type="email" placeholder="name@example.com" style={{width: '30%'}} 
              defaultValue={templeData?.temple_email}
              onChange={e => {handleInputField(e, 'temple_email')}}
            />
          </Col>
        </Form.Group>
        <Form.Group as={Row} className="mb-3">
          <Form.Label column sm="2">City</Form.Label>
          <Col sm="10">
            <Form.Control type="text" style={{width: '30%'}} 
              defaultValue={templeData?.city}
              onChange={e => {handleInputField(e, 'city')}}
            />
          </Col>
        </Form.Group>
        <Form.Group as={Row} className="mb-3">
          <Form.Label column sm="2">State</Form.Label>
          <Col sm="10">
            <Form.Control type="text" style={{width: '30%'}} 
              defaultValue={templeData?.state}
              onChange={e => {handleInputField(e, 'state')}}
            />
          </Col>
        </Form.Group>
        <Form.Group as={Row} className="mb-3">
          <Form.Label column sm="2">Country</Form.Label>
          <Col sm="10">
            <Form.Control type="text" style={{width: '30%'}} 
              defaultValue={templeData?.country}
              onChange={e => {handleInputField(e, 'country')}}
            />
          </Col>
        </Form.Group>
        <Form.Group as={Row} className="mb-3">
          <Form.Label column sm="2">Phone Number</Form.Label>
          <Col sm="10">
            <Form.Control type="text"style={{width: '30%'}} 
              defaultValue={templeData?.phone_no}
              onChange={e => {handleInputField(e, 'phone_no')}}
            />
          </Col>
        </Form.Group>
        <Form.Group as={Row} className="mb-3">
          <Form.Label column sm="2">Zipcode</Form.Label>
          <Col sm="10">
            <Form.Control type="number"style={{width: '30%'}} 
              defaultValue={templeData?.zipcode}
              onChange={e => {handleInputField(e, 'zipcode')}}
            />
          </Col>
        </Form.Group>
        <Form.Group as={Row} className="mb-3">
          <Form.Label column sm="2" >Description</Form.Label>
          <Col sm="10">
            <Form.Control as="textarea" rows={3} style={{width: '30%'}} 
              defaultValue={templeData?.description}
              onChange={e => {handleInputField(e, 'description')}}
            />
          </Col>
        </Form.Group>
        <Form.Group as={Row} className="mb-3">
          <Form.Label column sm="2">Start Time</Form.Label>
          <Col sm="10">
            <Form.Control type="text"style={{width: '30%'}} 
              defaultValue={startTime}
              onChange={e => {handleInputField(e, 'start_time')}}
            />
          </Col>
        </Form.Group>
        <Form.Group as={Row} className="mb-3">
          <Form.Label column sm="2">End Time</Form.Label>
          <Col sm="10">
            <Form.Control type="text"style={{width: '30%'}} 
              defaultValue={endTime}
              onChange={e => {handleInputField(e, 'end_time')}}
            />
          </Col>
        </Form.Group>
        <Button variant="primary" onClick={() => submitEditForm(templeData?.id)}>
          Edit
        </Button>
        <Button variant="primary" onClick={() => deleteTempleData(templeData?.id)} style={{marginLeft: '10px'}}>
          Delete
        </Button>
      </Form>
    </div>
  )
}

export default ShowTempleDetails