import { LightningElement } from 'lwc';

export default class InputDeneme extends LightningElement {

    fName;
    lName;
    phone;
    click = false;

    handleInput1(event){
        this.fName = event.target.value;
    }
    handleInput2(event){
        this.lName = event.target.value;
    }
    handleInput3(event){
        this.phone = event.target.value;
    }
    handleClick(event){
        this.click = event.target.click;
       
    }

}