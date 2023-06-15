import { LightningElement } from 'lwc';

export default class ConditionalRander extends LightningElement {
    //1
    flag = true;
    display = false;

    handleChange(event){
        this.display = event.target.checked;
    }

}