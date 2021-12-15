import React from 'react';
import MenuLateral from './MenuLateral';
import Cabecalho from './Cabecalho';
import Conteudo from './Conteudo';
import useAppData from '../../data/hook/useAppData';

interface LayoutProps {
  titulo: string;
  subtitle: string;
  children?: any;
}

export default function Layout(props: LayoutProps) {
  const { tema } = useAppData();

  return (
    <div className={`${tema} flex h-screen w-screen `}>
      <MenuLateral />
      <div
        className={`
        flex flex-col 
        w-full bg-gray-300 
        dark:bg-gray-800
        p-7
       `}
      >
        <Cabecalho titulo={props.titulo} subtitle={props.subtitle} />
        <Conteudo>{props.children}</Conteudo>
      </div>
    </div>
  );
}
