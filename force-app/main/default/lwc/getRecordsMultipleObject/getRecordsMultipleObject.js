import { getRecords } from 'lightning/uiRecordApi';
import { LightningElement, wire } from 'lwc';
import ACCNAME_FIELD from '@salesforce/schema/Account.Name';
import ACCINDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import CONNAME_FIELD from '@salesforce/schema/Contact.Name';
import CONTITLE_FIELD from '@salesforce/schema/Contact.Title';

export default class GetRecordsMultipleObject extends LightningElement {
    accounts;
    contacts;
    @wire(getRecords, {
        records: [
            {
                recordIds: ['0018d00000MeVpaAAF','0018d00000MeVpUAAV'],
                fields: [ACCNAME_FIELD,ACCINDUSTRY_FIELD]

            },
            {
                recordIds: ['0038d00000MJOLAAA5','0038d00000MJOLBAA5'],
                fields: [CONNAME_FIELD,CONTITLE_FIELD]

            }
        ]

    })
    recordsHandler({data,error}){
        if (data) {
            console.log('data : ' ,data);
            this.accounts = data.results[0];
            this.contacts = data.results[2];

        } else if(error) {
            console.log('error : ', error);
        }
    }
}