import React, { useCallback, useReducer, useState } from 'react';

interface State {
  user: string;
  email: string;
}

type Action = {
  type: 'SET_DATA_USER';
  paylod: {};
};

const reducer = (state: State, action: Action) => {
  const { paylod, type } = action;
  switch (type) {
    case 'SET_DATA_USER':
      return { ...state, ...paylod };
    default:
      return state;
  }
};


interface Event {
  target: {
    name: string,
    value: string
  }
  preventDefault: () => void
}

function App() {
  const INITIAL_STATE: State = { user: '', email: '' };
  const [Data, setData] = useState<State>()
  const [DataUser, dispatch] = useReducer(reducer, INITIAL_STATE);

  const handleSubmit = () => {};

  const handleChange = (e: Event) => {
    e.preventDefault()
    const {target} = e
   
  };

  return (
    <div className="App">
      <form onSubmit={handleSubmit}>
        <label htmlFor="user">
          User:
          <input type="text" name="user" id="user" onChange={handleChange} />
        </label>
        <label htmlFor="email">
          Email:
          <input type="text" name="email" id="email" onChange={handleChange} />
        </label>
        <input type="submit" value="Cadastrar" />
      </form>
    </div>
  );
}

export default App;
