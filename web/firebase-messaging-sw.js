// Give the service worker access to Firebase Messaging.
// Note that you can only use Firebase Messaging here. Other Firebase libraries
// are not available in the service worker.
importScripts('https://www.gstatic.com/firebasejs/9.0.0/firebase-app-compat.js');
importScripts('https://www.gstatic.com/firebasejs/9.0.0/firebase-messaging-compat.js');

// Initialize the Firebase app in the service worker by passing in
// your app's Firebase config object.
// https://firebase.google.com/docs/web/setup#config-object
const firebaseApp = firebase.initializeApp({
    apiKey: 'AIzaSyApcxS753OsUAVdOSPJBpnzjhxgGr5gwNg',
    authDomain: 'toohak-58bc4.firebaseapp.com',
    projectId: 'toohak-58bc4',
    storageBucket: 'toohak-58bc4.appspot.com',
    messagingSenderId: '574878357929',
    appId: '1:574878357929:web:10d7cbd883f39971f5ccb8',
    measurementId: 'G-T00Q6NCL7N',
});

// Retrieve an instance of Firebase Messaging so that it can handle background
// messages.
const messaging = firebase.messaging(firebaseApp);
