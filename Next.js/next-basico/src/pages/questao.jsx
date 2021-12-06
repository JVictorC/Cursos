import React, { useEffect, useState } from 'react'
import axios from 'axios';

export default function Questao() {
  const [questao, setQuestao] = useState();

  const getQuestao = async () => {
    const result = await axios.get('http://localhost:3000/api/questao/2');
    setQuestao(result.data)
  }


  useEffect(() => {
    getQuestao()
  }, [])


  return (
    <div>
      <h1>{questao?.enunciado}</h1>
      <ul>
        {
          questao?.respostas.map((item) => (
            <li key={item}>
              {item}
            </li>
          ))
        }
      </ul>
    </div>
  )
}
