import { LightningElement } from 'lwc';

export default class Homework extends LightningElement {
    firstName =' ';
    lastName= ' ';


    nameHandler(event){
        this.firstName = event.target.value;
        
    }
    lastNameHandler(event){
        this.lastName = event.target.value;
    }
    get upperName(){
        return `Isim Soyisim :  ${this.firstName.toUpperCase()} ${this.lastName.toUpperCase()}`;
    }
}