/* eslint-disable @next/next/link-passhref */
/* eslint-disable @next/next/no-img-element */
import React from 'react';
import Link from 'next/link';
import useAuth from '../../data/hook/useAuth';

interface AvatarUsuarioProps {
  className?: string;
}

export default function AvatarUsuario(props: AvatarUsuarioProps) {
  const { usuario, carregando } = useAuth();

  return (
    <Link href="/perfil">
      {carregando ? (
        <img
          src="/Images/loading.gif"
          alt="Imagem de carregando"
          className={`
          h-10 w-10 rounded-full cursor-pointer
          ${props.className}
        `}
        />
      ) : (
        <img
          src={usuario?.imageUrl ?? '/Images/avatar.svg'}
          alt="Avatar do Usuário"
          className={`
            h-10 w-10 rounded-full cursor-pointer
            ${props.className}
          `}
        />
      )}
    </Link>
  );
}
