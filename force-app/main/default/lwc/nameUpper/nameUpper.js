import { LightningElement } from 'lwc';

export default class NameUpper extends LightningElement {
    fName = 'john';
    lName = 'conner';

    get fullUpper(){ // get method'unun return'u vadir
        // return this.fName.toUpperCase() + ' ' + this.lName.toUpperCase();
        return `Isim Soyisim : ${this.fName.toUpperCase()} ${this.lName.toUpperCase()}`;
    }
}