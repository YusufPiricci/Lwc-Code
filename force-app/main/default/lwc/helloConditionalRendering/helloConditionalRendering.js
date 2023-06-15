import { LightningElement } from 'lwc';

export default class HelloConditionalRendering extends LightningElement {

    areDetailVisible = false;
    handleChange(event){
        this.areDetailVisible = event.target.checked;
    }

}