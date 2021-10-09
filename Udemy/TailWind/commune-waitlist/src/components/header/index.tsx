import React from 'react'
import Logo from '../../Images/Logo.svg'
import Menu from '../../Images/Hamburger Menu.svg'


const optionsNavBar = ['Features', 'Affiliates', 'Pricing', 'Communities']

export default function Header() {
  return (
    <header className="flex justify-around items-center py-10">
      <section className="">
        <img src={Logo} alt="logo do nosso webSite" className="w-52" />
      </section>
      <nav className="flex justify-end  ml-auto">
        <ul className="hidden lg:flex">
          {
            optionsNavBar.map((option) => (
              <li key={option} className="ml-10">
                {option}
              </li>
            ))
          }
        </ul>
        <img src={Menu} alt="icon menu" className="lg:hidden" />
      </nav>
        <button type="button" className="hidden lg:block mx-5 btn btn-primary">Join Waitlist</button>
    </header>
  )
}
