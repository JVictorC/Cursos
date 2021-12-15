import React from 'react';
import { IconeSol, IconeLua } from '../Icons';

type Tema = 'dark' | '';

interface BotaoAlternarTemaProps {
  tema: Tema;
  alternarTema: () => void;
}

export default function BotaoAlternarTema(props: BotaoAlternarTemaProps) {
  
  function renderLighButton() {
    return (
      <div
        onClick={props.alternarTema}
        className={`
        hidden
        bg-gradient-to-r from-yellow-300 to-yellow-600
        w-14 lg:w-24 h-8
        sm:flex items-center
        cursor-pointer p-1
        rounded-full
    `}
      >
        <div
          className={`
        flex items-center justify-center
        bg-white text-yellow-600 w-6 h-6 rounded-full
      `}
        >
          {IconeSol(4)}
        </div>
        <span
          className={`
          hidden lg:flex items-center ml-4 text-white text-sm
        `}
        >
          Claro
        </span>
      </div>
    );
  }

  function renderDarkButton() {
    return (
      <div
        onClick={props.alternarTema}
        className={`
          hidden
          bg-gradient-to-r from-gray-500 to-gray-900
          w-14 lg:w-24 h-8
          sm:flex items-center justify-end
          cursor-pointer p-1
          rounded-full
        `}
      >
        <span
          className={`
          hidden lg:flex items-center mr-2 text-gray-300 text-sm
        `}
        >
          Escuro
        </span>

        <div
          className={`
        flex items-center justify-center
        bg-black text-yellow-300 w-6 h-6 rounded-full
      `}
        >
          {IconeLua(4)}
        </div>
      </div>
    );
  }

  return props.tema === 'dark' ? renderLighButton() : renderDarkButton();
}
