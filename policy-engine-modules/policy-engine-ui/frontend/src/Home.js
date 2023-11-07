import * as React from 'react';
import { Tab, Tabs, TabList, TabPanel } from 'react-tabs';
import "./static/css/ZonesoftTabs.css"
import ManageAssetTypes from "./components/manage-asset-types/ManageAssetTypes"

function Home() {
	return (
		<Tabs>
			<TabList>
				<Tab>Manage Asset Types</Tab>
				<Tab>Manage Policies</Tab>
				<Tab>Examples etc</Tab>
			</TabList>

			<TabPanel>
				<ManageAssetTypes />
			</TabPanel>
			
			<TabPanel>
				<h2>Managing Policies will go here</h2>
			</TabPanel>
			<TabPanel>
				<h2>Examples etc will go here</h2>
			</TabPanel>

		</Tabs>
	);
};

export default Home;