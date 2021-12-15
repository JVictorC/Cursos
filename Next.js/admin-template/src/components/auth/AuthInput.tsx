import React from 'react';

interface AuthInputProps {
  label: string;
  valor: any;
  obrigatorio?: boolean;
  renderizer?: boolean;
  tipo?: 'text' | 'email' | 'password';
  valorMudou: (novoValor: any) => void;
}

export default function AuthInput(props: AuthInputProps) {
  return props.renderizer ? null : (
    <div className={`flex flex-col  mt-4`}>
      <label htmlFor={props.label}>{props.label}</label>
      <input
        id={props.label}
        required={props.obrigatorio}
        type={props.tipo ?? 'text'}
        value={props.valor}
        onChange={(e) => props.valorMudou?.(e.target.value)}
        className={`
          px-4 py-3 rounded-lg bg-gray-200 border 
          focus:border-blue-500 focus:outline-none
          focus:bg-white  
        `}
      />
    </div>
  );
}
