import React from 'react'
import Link from 'next/link';
import { useRouter } from 'next/router'

export default function Rotas() {
  const router = useRouter();

  return (
    <div>
      <p>Rotas</p>
      <ul>
        <Link href="/rotas/params?id=12&nome=Ana" passHref>
          <li>Paramns</li>
        </Link>
        <Link href="/rotas/123/produto" passHref>
          <li>Buscar</li>
        </Link>
      </ul>
      <div style={{ display: "flex", flexDirection: "column", alignItems:"flex-start" }}>
        <button onClick={() => router.push('/rotas/params?id=12&nome=Ana') }>
            Params
        </button>
      </div>
    </div>
  )
}
