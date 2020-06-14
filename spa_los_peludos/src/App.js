import React from 'react';
import './App.css';
import NavBar from './navbar';
import Banner from './banner'
import About from './about'
import Services from './services';
import Footer from './footer';
function App() {
  return (
    <div className="App" id="home">
      <NavBar />
      <header className="App-header">
        <Banner />
      </header>
      <About />
      <Services />
      <Footer/>
    </div>
  );
}

export default App;
