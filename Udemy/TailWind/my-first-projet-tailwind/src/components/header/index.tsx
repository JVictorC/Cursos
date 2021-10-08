import React from 'react';
import { GiHamburgerMenu } from 'react-icons/all';
import NavItens from '../navItens';
import ButtonsHeader from '../buttonsHeader';
import LogoComponent from '../logo';



const headerMain = `
flex justify-between items-center p-3 lg:justify-around
`

const Header: React.FC = () => {
  return (
    <header className={headerMain}>
      <LogoComponent />
      <NavItens />
      <ButtonsHeader />
      <GiHamburgerMenu className="text-3xl lg:hidden text-black" />
    </header>
  );
};

export default Header;
