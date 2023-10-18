import * as React from 'react';
import { Routes, Route, NavLink, Outlet } from 'react-router-dom';
import AppHome from "./Home";
const App = () => {	return (
		<>
		    <h1>Policy-Engine-App</h1>
		    
			<nav>					
				<NavLink to="/" >Home</NavLink><br /><br />
			</nav>

			<Routes>
				<Route path="/" element={<AppHome />} />
				<Route index element={<AppHome />} />
				<Route path="*" element={<p>There's nothing here: 404!</p>} />
			</Routes>
			
			<main>
				<Outlet />
			</main>
		</>
	);
};

export default App;