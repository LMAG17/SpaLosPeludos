import firebase from 'firebase/app'
import "firebase/firestore";
var firebaseConfig = {
    apiKey: "AIzaSyAc6VSCig3J1VwiCz8MrzQ7hx-j9iNqT8A",
    authDomain: "spalospeludos.firebaseapp.com",
    databaseURL: "https://spalospeludos.firebaseio.com",
    projectId: "spalospeludos",
    storageBucket: "spalospeludos.appspot.com",
    messagingSenderId: "267997855255",
    appId: "1:267997855255:web:3f2c76f50df291a02a6652",
    measurementId: "G-KMH3950WEK"
};

const fb = firebase.initializeApp(firebaseConfig);

export const db  = fb.firestore(); 