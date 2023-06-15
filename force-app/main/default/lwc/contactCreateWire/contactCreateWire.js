import { LightningElement, wire } from 'lwc';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import LEADSOURCE_FIELD from '@salesforce/schema/Contact.LeadSource';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';

export default class ContactCreateWire extends LightningElement {
    objectName = CONTACT_OBJECT;
    leadSourceOptions = [
        LEADSOURCE_FIELD
    ];
}