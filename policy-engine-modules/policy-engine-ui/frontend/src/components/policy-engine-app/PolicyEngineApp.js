import React, {useEffect, useState } from 'react';
//import { Accordion, AccordionItem as Item} from '@szhsin/react-accordion';
import { Accordion, AccordionItem} from '@szhsin/react-accordion';
import chevronDown from "../../static/icons/chevron-down.svg";
import styles from "../../static/css/accordion.module.css";
import ApiClientConfigs from "../../configurations/ApiClientConfigsClass";
import DataService from "../../data-services/DataServiceClass";
//import Policies from "./policies/Policies";

function PolicyEngineApp() {
	const ENTITY_NAME = "assetType";
	const [assetTypes, setAssetTypes] = useState([]);
			
	useEffect(() => {
		const dataService = new DataService(new ApiClientConfigs(),ENTITY_NAME);
		dataService.fetchAll().then((data) => setAssetTypes(data));
	}, [setAssetTypes]);
			
	return (
		<div className={styles.accordion}>
			<Accordion allowMultiple >
				{assetTypes.map(at =>
					<div >
						<AccordionItem
							key={at.id}
							header={
								<div >
									<p className={styles.title}>
										{at.name}
										<img className={styles.chevron} src={chevronDown} alt="Chevron Down" />
									</p>
									<p className={styles.description}>
										{at.description}
									</p>
								</div>
							}
							buttonProps={{ className: ({ isEnter }) => `${styles.itemBtn} ${isEnter && styles.itemBtnExpanded}` }}
							contentProps={{ className: styles.itemContent }}
							panelProps={{ className: styles.itemPanel }}
						>
							---- Policies for the Asset-Type above to go here -----
{/*							<Policies /> */}
						</AccordionItem>
						<hr style={{ width: "1000px", marginLeft: "0" }} />
					</div>
				)}
			</Accordion>
		</div>
	);
}

export default PolicyEngineApp;