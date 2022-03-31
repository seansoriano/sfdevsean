import { LightningElement,api } from 'lwc';

export default class ContactRecord extends LightningElement {

	@api contactRecord;


	setContactFirstName(event) {
		this.contactRecord = { ...this.contactRecord, FirstName: event.target.value };
		
		this.handleInputChange(this.contactRecord);
	}


	handleInputChange(record) {

		//creates custom event with updated record information
		const changeEvent = new CustomEvent('inputchange',{detail:record});

		//fires input change event handled by parent component
		this.dispatchEvent(changeEvent);

	}
}