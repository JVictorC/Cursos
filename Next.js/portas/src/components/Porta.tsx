import React from 'react'
import styles from '../styles/porta.module.css'
import PortaModel from '../models/porta'

interface PortaProps {
  porta: PortaModel
}


export default function Porta(props: PortaProps) {
  const { porta } = props;
  const eSelecionada = porta.selecionada ? styles.selecionada : '';
  return (
    <div className={styles.area}>
      <div className={`${styles.estrutura} ${eSelecionada}`}>
        <div className={styles.porta}>
          <div className={styles.numero}>{porta.numero}</div>
          <div className={styles.macaneta}></div>
        </div>
      </div>
      <div className={styles.chao}></div>
    </div>
  )
}
