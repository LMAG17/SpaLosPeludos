import React from 'react';
import './App.css';
import NavBar from './navbar';
import Banner from './banner'
import About from './about'
import Services from './services';
import Footer from './footer';
import FormContact from './form';
function App() {
  return (
    <div className="App" id="home">
      <NavBar />
      <header className="App-header">
        <Banner />
      </header>
      <About />
      <Services />
      <FormContact/>
      <header className="App-footer">
        <Footer />
      </header>
    </div>
  );
}

export default App;
