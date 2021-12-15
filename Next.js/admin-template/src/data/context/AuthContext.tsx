import { route } from 'next/dist/server/router';
import Router from 'next/router';
import React, { createContext, useEffect, useState } from 'react';
import firebase from '../../firebase/config';
import Usuario from '../../models/usuario';
import Cookies from 'js-cookie';

interface AuthContextProps {
  usuario?: Usuario;
  loginGoogle?: () => Promise<void>;
  carregando?: boolean;
  logout?: () => void;
}

const AuthContext = createContext<AuthContextProps>({});

async function usuarioNormalizado(
  usuarioFirebase: firebase.User
): Promise<Usuario> {
  const token = await usuarioFirebase.getIdToken();
  return {
    uid: usuarioFirebase.uid,
    nome: usuarioFirebase.displayName,
    email: usuarioFirebase.email,
    token,
    provedor: usuarioFirebase.providerData[0].providerId,
    imageUrl: usuarioFirebase.photoURL,
  };
}

function gerenciarCookies(logado: boolean) {
  if (logado) {
    Cookies.set('admin-te,plate-jvictor-auth', `${logado}`, {
      expires: 7,
    });
  } else {
    Cookies.remove('admin-te,plate-jvictor-auth');
  }
}

export function AuthProvider(props) {
  const [usuario, setUsuario] = useState<Usuario>(null);
  const [carregando, setCarregando] = useState<boolean>(true);

  async function confgurarSessao(usuarioFirebase: firebase.User) {
    if (usuarioFirebase?.email) {
      const usuario = await usuarioNormalizado(usuarioFirebase);
      setUsuario(usuario);
      gerenciarCookies(true);
      setCarregando(false);
      return usuario.email;
    } else {
      setUsuario(null);
      gerenciarCookies(false);
      setCarregando(false);
      return false;
    }
  }

  async function loginGoogle() {
    const resposta = await firebase
      .auth()
      .signInWithPopup(new firebase.auth.GoogleAuthProvider());

    confgurarSessao(resposta.user);
    Router.push('/');
  }

  async function logout() {
    try {
      setCarregando(true);
      await firebase.auth().signOut();
      await confgurarSessao(null);
    } finally {
      setCarregando(false);
    }
  }

  useEffect(() => {
    if (Cookies.get('admin-te,plate-jvictor-auth')) {
      const cancelar = firebase.auth().onIdTokenChanged(confgurarSessao);
      return () => cancelar();
    }
  }, []);

  const valueProvider: AuthContextProps = {
    usuario,
    loginGoogle,
    carregando,
    logout,
  };
  return (
    <AuthContext.Provider value={valueProvider}>
      {props.children}
    </AuthContext.Provider>
  );
}

export default AuthContext;
