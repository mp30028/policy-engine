import React from 'react';
import { AccordionItem as Item} from '@szhsin/react-accordion';
import chevronDown from "../../static/icons/chevron-down.svg";
import styles from "./accordion.module.css";

export default function AccordionItem({ header, label, description, ...rest }){
	return (
		<>
		  <Item
		    {...rest}
		    header={
		      <>
		      	<span className={styles.label}>{label}: </span>
		        {header}
				<p className={styles.description}>
					{description}
				</p>
				<img className={styles.chevron} src={chevronDown} alt="Chevron Down" />
		      </>
		    }
		    className={styles.item}
		    buttonProps={{className: ({ isEnter }) =>`${styles.itemBtn} ${isEnter && styles.itemBtnExpanded}`}}
		    contentProps={{ className: styles.itemContent }}
		    panelProps={{ className: styles.itemPanel }}
		  />		  
  		</>
  );
}