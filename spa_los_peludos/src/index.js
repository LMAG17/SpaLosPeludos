import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
import 'bootstrap/dist/css/bootstrap.min.css';
import { FirebaseAppProvider } from "reactfire";
import firebaseConfig from "./firebase/firebase-config";



ReactDOM.render(
  <FirebaseAppProvider firebaseConfig={firebaseConfig}>
    <React.StrictMode>
      <App/>
    </React.StrictMode>
  </FirebaseAppProvider>,
  document.getElementById('root')
);
