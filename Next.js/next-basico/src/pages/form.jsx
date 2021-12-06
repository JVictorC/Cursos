import axios from 'axios';
import React, { useEffect, useState } from 'react'

export default function Form() {
  const [nome, setNome] = useState('');
  const [idade, setIdade] = useState(0);
  const [users, setUsers] = useState([])

  const salvarUser = async () => {
    setNome('');
    setIdade(0)

    await axios.post('/api/form', {
      body: { nome, idade }
    })
    buscarUsuarios()
  }

  const buscarUsuarios = async () => {
    const users = await axios.get('/api/form')
    setUsers(users.data);
  }


  useEffect(() => {
    buscarUsuarios()
  }, [])

  return (
    <div>
      <h1>Integrando com API</h1>
      <input
        type="text"
        value={nome}
        onChange={({ target }) => setNome(target.value)}
      />
      <input
        type="number"
        value={idade}
        onChange={({ target }) => setIdade(target.value)}
      />
      <button onClick={salvarUser} >
        Enviar
      </button>
      <div>
        <h1>usuarios Cadastrados</h1>
        <ul>
          {
            users.map((item) => (
              <li key={item.nome}>
                usuario {item.nome} tem {item.idade} anos
              </li>
            ))
          }
        </ul>
      </div>
    </div>
  )
}
