import * as React from 'react';
import { Routes, Route, NavLink, Outlet } from 'react-router-dom';
import AppHome from "./Home";
import ExamplesLayout from "./examples/Layout";
const App = () => {	return (
		<>
		    <h1>Chat-App</h1>
		    
			<nav>
				<NavLink to="/examples">Examples</NavLink><br />					
				<NavLink to="/" >Home</NavLink><br /><br />
			</nav>

			<Routes>
				<Route path="examples/*" element={<ExamplesLayout />} />
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