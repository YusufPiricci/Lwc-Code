import FirstName from '@salesforce/schema/Contact.FirstName';
import { LightningElement } from 'lwc';

export default class TemplateLooping extends LightningElement {
    countries = ["Istanbul", "Adana", "Izmir", "Ankara"];

    contacts = [
        {
            id:1,
            firstName:"Steve",
            lastName: "Jobs"
        },
        {
            id:2,
            firstName: "Yusuf",
            lastName: "Piricci"
        }
    ];
}