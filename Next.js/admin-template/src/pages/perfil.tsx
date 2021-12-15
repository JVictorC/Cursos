import React, { useContext } from 'react';
import Layout from '../components/template/Layout';

export default function Perfil() {
  return (
    <div>
      <Layout
        titulo="Perfil do Usuário"
        subtitle="Administre as suas informações de usuário!"
      >
        <h1>Perfil de Usuário</h1>
      </Layout>
    </div>
  );
}
