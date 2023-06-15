import { LightningElement } from 'lwc';
import LightningAlert from 'lightning/alert';

export default class Deneme extends LightningElement {
        async handleAlertClick() {
        await LightningAlert.open({
            message: 'this is the alert message',
            theme: 'inverse', // a red theme intended for error states
            label: 'Success', // this is the header text
        });
        //Alert has been closed
    }
}