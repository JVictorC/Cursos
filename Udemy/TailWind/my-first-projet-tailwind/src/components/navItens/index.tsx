import React from 'react'

const navItens = ['Plans', 'Find Domain', 'Why Hosterr'];


 const NavItens: React.FC = () => {
  return (
    <nav className="hidden lg:flex w-1/4">
    <ul className="flex justify-between w-full">
      {navItens.map((iten) => (
        <li key={iten}>{iten}</li>
      ))}
    </ul>
  </nav>
  )
}

export default NavItens