import { useState } from 'react';
import Porta from '../components/Porta'
import Presente from '../components/Presente'
import PortaModel from '../models/porta'


export default function Home() {
  const [p1, setP1] = useState(new PortaModel(1))

  return (
    <div>
      <Porta porta={p1} />
    </div>
  )
}
