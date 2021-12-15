import React from 'react';
import useAuth from '../../data/hook/useAuth';
import { IconeAjustes, IconeCasa, IconeSair, IconeSino } from '../Icons';
import Logo from './Logo';
import MenuItem from './MenuItem';

export default function MenuLateral() {
  const {logout} = useAuth()

  return (
    <aside className={`flex flex-col dark:bg-gray-900`}>
      <div
        className={`
          h-20 w-20
          bg-gradient-to-r from-indigo-500 bg-purple-800
          flex flex-col items-center justify-center
      `}
      >
        <Logo />
      </div>
      <ul className={`flex-grow`}>
        <MenuItem url="/" text="Início" icon={IconeCasa} />
        <MenuItem url="/ajustes" text="Ajustes" icon={IconeAjustes} />
        <MenuItem url="/notificacoes" text="Notificações" icon={IconeSino} />
      </ul>
      <ul>
        <MenuItem
          onClick={() => logout()}
          text="Início"
          icon={IconeSair}
          className={`
            text-red-600 dark:text-red-500
            hover:bg-red-400
            hover:text-white dark:hover:text-white
            duration-300
          `}
        />
      </ul>
    </aside>
  );
}
