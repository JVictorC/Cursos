import React, {
  useState,
} from 'react';


interface iUser {
  name: String;
  login: String;
  avatar_URL: String;
}


function App() {
  const [user, SetUser] = useState<iUser>()


  async function loadData() {
    const response = await fetch('https://api.github.com/users/JVictorC')
    const data = await response.json();

    SetUser(data);
  }

  return (
    <div className="App">
    </div>
  );
}

export default App;
