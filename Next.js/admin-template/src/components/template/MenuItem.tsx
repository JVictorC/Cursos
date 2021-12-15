import Link from 'next/link';
import React from 'react';

interface MenuItemProps {
  url?: string;
  text: string;
  icon: any;
  className?: string;
  onClick?: (evento: any) => void;
}

export default function MenuItem(props: MenuItemProps) {
  function renderizarLink() {
    return (
      <a
        className={`
          flex flex-col justify-center items-center
          w-20 h-20 
        dark:text-gray-200 ${props.className}
        `}
      >
        {props.icon}
        <span
          className={`
        text-xs font-ligh
      `}
        >
          {props.text}
        </span>
      </a>
    );
  }

  return (
    <li
      onClick={props.onClick}
      className={`
      hover:bg-gray-100 dark:hover:bg-gray-800
      cursor-pointer text-gray-600
    `}
    >
      {props.url ? (
        <Link href={props.url}>{renderizarLink()}</Link>
      ) : (
        renderizarLink()
      )}
    </li>
  );
}
