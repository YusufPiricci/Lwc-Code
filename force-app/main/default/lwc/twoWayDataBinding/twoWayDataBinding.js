import { LightningElement } from 'lwc';

export default class TwoWayDataBinding extends LightningElement {
    fullName = 'Yusuf Piricci';
    course = 'Salesforce Developer';

    changeHandler(event){
        this.course = event.target.value;

    }
} 