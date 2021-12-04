import React from 'react'
import { useRouter } from 'next/dist/client/router'

export default function Produtos() {
  const router = useRouter();

  console.log(router.query);


  return (
    <div>
      <h1>Arroz</h1>

      <button>Click</button>
    </div>
  )
}
