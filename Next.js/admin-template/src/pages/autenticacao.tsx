/* eslint-disable @next/next/no-img-element */
import Image from 'next/image';
import React, { useState } from 'react';
import AuthInput from '../components/auth/AuthInput';
import { IconeDeAtenção } from '../components/Icons';
import useAuth from '../data/hook/useAuth';

export default function Autenticacao() {
  const { usuario, loginGoogle } = useAuth();

  const [modo, setModo] = useState<'login' | 'cadastro'>('login');
  const [email, setEmail] = useState('');
  const [senha, setSenha] = useState('');
  const [erro, setErro] = useState();

  function exibirErro(msg, tempoEmSegundos = 5) {
    setErro(msg);
    setTimeout(() => {
      setErro(null);
    }, tempoEmSegundos * 1000);
  }

  function submeter() {
    if (modo === 'login') {
      console.log(modo);
    } else {
      console.log(modo);
    }
  }

  return (
    <div className="flex h-screen items-center justify-center">
      <div className={`hidden md:block w-1/2 lg:w-2/3`}>
        <img
          src="https://source.unsplash.com/random"
          alt="Imagem da Tela de Autenticação"
          className={`h-screen w-full object-cover`}
        />
      </div>
      <div className={`m-10 w-full md:w-1/2 lg:w-1/3`}>
        <h1
          className={`
            text-2xl font-bold mb-5
          `}
        >
          {modo === 'login'
            ? 'Entre com a Sua Conta'
            : 'Cadastre-se na Plataforma'}
        </h1>
        {erro ? (
          <div
            className={`
            flex items-center
          bg-red-400 text-white py-3 px-5 my-2
            border-2 border-red-700 rounded-lg
          `}
          >
            {IconeDeAtenção()}
            <span className="ml-3">{erro}</span>
          </div>
        ) : null}

        <AuthInput
          label="Email"
          valor={email}
          valorMudou={setEmail}
          tipo="email"
          obrigatorio
        />
        <AuthInput
          label="Senha"
          valor={senha}
          valorMudou={setSenha}
          tipo="password"
          obrigatorio
        />

        <button
          className={`
          w-full bg-indigo-500 hover:bg-indigo-400
          text-white rounded-lg px-4 py-3 mt-6
        `}
          onClick={submeter}
        >
          {modo === 'login' ? 'Entrar' : 'Cadastrar'}
        </button>

        <hr className="my-6 border-gray-300" />

        <button
          className={`
          w-full bg-red-500 hover:bg-red-400
          text-white rounded-lg px-4 py-3
        `}
          onClick={loginGoogle}
        >
          Entrar com Google
        </button>
        {modo === 'login' ? (
          <p className={`mt-8`}>
            Novo por aqui?
            <a
              onClick={() => setModo('cadastro')}
              className={`
              text-blue-500 hover:text-blue-700 font-semibold cursor-pointer ml-2
            `}
            >
              Crie uma conta Gratuitamente.
            </a>
          </p>
        ) : (
          <p className={`mt-8`}>
            Já faz parte da nossa comunidade?
            <a
              onClick={() => setModo('login')}
              className={`
              text-blue-500 hover:text-blue-700 font-semibold cursor-pointer ml-2
            `}
            >
              Entre com sua credenciais.
            </a>
          </p>
        )}
      </div>
    </div>
  );
}
