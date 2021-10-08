import React from 'react'
import Logo from '../../Images/Logo.svg';


const sloganMain = 'text-white p-1 px-3 rounded-full text-center ml-5 gredient-logo'

function LogoComponent() {
  return (
    <article className="flex lg:w-1/4">
    <img src={Logo} alt="Hoster Logo" />
    <p className={sloganMain}>Hoster is hiring</p>
    </article>
  )
}

export default  LogoComponent