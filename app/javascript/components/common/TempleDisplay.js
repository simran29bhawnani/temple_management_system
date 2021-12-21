import React from "react"
import AdminLogin from './AdminLogin'
import TempleDetails from './TempleDetails'
import { BrowserRouter } from 'react-router-dom'

const TempleDisplay = () => {
  return (
    <BrowserRouter>
      <AdminLogin/>
    </BrowserRouter>
  )
}

export default TempleDisplay