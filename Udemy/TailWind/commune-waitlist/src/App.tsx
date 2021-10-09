import React from 'react';
import Footer from './components/footer';
import Header from './components/header';
import MainContent from './components/mainContent';
import './Styles/App.css';

function App() {
  return (
    <div className="App w-4/5 m-auto">
      <Header />
      <MainContent />
      <Footer />
    </div>
  );
}

export default App;
