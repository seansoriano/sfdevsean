import { LightningElement,api,track } from 'lwc';

export default class CreateContactRecords extends LightningElement {


	@api contactCollection=[{'uid':'test1','sobjectType' : 'Contact','FirstName':'Test01'}];

	handleChange(event) {
		//unique identifier
		let uid = event.detail.uid;

		//get index of contact record
		let sectionItemIndex = this.contactCollection.findIndex(obj=> obj.uid === uid);

		//create new instance of array
		let updateValueList = [...this.contactCollection];

		//update object on list based on index
		updateValueList[sectionItemIndex]=event.detail;

		//re-assign new list to collection
		this.contactCollection=updateValueList;

		
	}
	
	

	// generateUniqueString = () => '_'+Math.floor(Math.random() * Date.now());
}

