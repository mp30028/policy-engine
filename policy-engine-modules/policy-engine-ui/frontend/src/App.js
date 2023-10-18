import * as React from 'react';
import { Routes, Route, Outlet } from 'react-router-dom';
import PolicyEngineApp from "./policy-engine-app/PolicyEngineApp"
const App = () => {	return (
		<>
			<Routes>
				<Route path="/" element={<PolicyEngineApp />} />			
				<Route path="*" element={<p>There's nothing here: 404!</p>} />			
			</Routes>
			
			<main>
				<Outlet />
			</main>
		</>
	);
};

export default App;