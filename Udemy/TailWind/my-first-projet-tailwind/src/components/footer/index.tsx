import React from 'react';
import HelpAvatar from '../../Images/Help Avatar.svg';

const redesSocias = ['Facebook', 'Instagram', 'Twitter'];

export default function Footer() {
  return (
    <footer className="items-center m-auto flex w-full lg:w-4/5 lg:justify-around lg:items-center lg:flex-row flex-col ">

      <nav className="lg:w-1/2 mr-auto w-full items-cente mb-10">
        <ul className="flex lg:justify-between justify-center pt-20">
          {redesSocias.map((rede) => (
            <li key={rede} className="mx-3 lg:mx-0 text-lg">{rede}</li>
          ))}
        </ul>
      </nav>

      <article className="flex flex-row-reverse">
        <span className="ml-5 font-">
        <p className="text-lg">Have any questions ?</p>
        <p className="font-extrabold text-2xl">Talk to a specialist</p>
        </span>
        <img src={HelpAvatar} alt="help Avatar" />
      </article>

    </footer>
  );
}
