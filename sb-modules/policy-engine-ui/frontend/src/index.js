import React from 'react';
import ReactDOM from 'react-dom/client';
import { BrowserRouter } from 'react-router-dom';
import App from './App';

////Iinstall the dotenv packagae as per instructions at https://github.com/motdotla/dotenv locally before using process.env 
//// npm install dotenv --save
//// Once installed creat a ".env" file in the folder where this script resides and make the following entry in it.
//// TEST_STRING=this is a test string in the dot env file
//// Add the next two lines of code to initialise
//import * as dotenv from 'dotenv' // see https://github.com/motdotla/dotenv#how-do-i-use-dotenv-with-import
//dotenv.config();

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
	  <BrowserRouter>
	    <App />
	  </BrowserRouter>
  </React.StrictMode>
);
