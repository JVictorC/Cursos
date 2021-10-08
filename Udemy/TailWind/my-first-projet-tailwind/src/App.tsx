import React from 'react';
import './App.css';
import ContainerMain from './components/containerMain';
import Footer from './components/footer';
import Header from './components/header/';



function App() {
  return (
    <div className="App lg:px-20 py-5 m-auto h-screen">
      <Header />
      <ContainerMain />
      <Footer />
    </div>
  );
}

export default App;
