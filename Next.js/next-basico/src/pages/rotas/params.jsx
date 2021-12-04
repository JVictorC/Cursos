import { useRouter } from 'next/dist/client/router';
import Link from 'next/link';

import React from 'react'

export default function Params() {
  const router = useRouter()
  console.log(router);
  const id = router.query.id;
  const nome = router.query.nome
  return (
    <div>
      <p>Rotas Params / {id} / {nome}</p>
      <Link href='/rotas' passHref>
        <button>Voltar</button>
      </Link>
    </div>
  )

}