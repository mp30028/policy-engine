import * as React from 'react';
import { Routes, Route, Outlet } from 'react-router-dom';
import Home from './Home';
const App = () => {	return (
		<>
			<Routes>
				<Route path="/" element={<Home />} /> 
				<Route path="*" element={<p>There's nothing here: 404!</p>} />			
			</Routes>
			
			<main>
				<Outlet />
			</main>
		</>
	);
};

export default App;