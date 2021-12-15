import React from 'react'

interface CounteudoProps {
  children?: any;
}

export default function Conteudo(props: CounteudoProps) {
  return (
    <div className={`
      flex flex-col mt-7
      dark:text-gray-200
    `}>
      {props.children}
    </div>
  )
}
