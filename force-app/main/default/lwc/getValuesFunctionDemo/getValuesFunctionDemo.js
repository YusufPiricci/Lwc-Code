import { getFieldValue, getRecord } from 'lightning/uiRecordApi';
import { LightningElement, wire } from 'lwc';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import AREVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';

const FIELDS = [NAME_FIELD,INDUSTRY_FIELD,AREVENUE_FIELD,PHONE_FIELD];

export default class GetValuesFunctionDemo extends LightningElement {

    recordId = '0018d00000R6uOKAAZ';
    name;
    industry;
    annualRevenue;
    phone;

    @wire(getRecord,{recordId: '$recordId', fields: FIELDS})

    accountHandler({data,error}){
        if(data){
            console.log(data);
            this.name = getFieldValue(data,NAME_FIELD);
            this.industry = getFieldValue(data,INDUSTRY_FIELD);
            this.annualRevenue = getFieldValue(data,AREVENUE_FIELD);
            this.phone = getFieldValue(data,PHONE_FIELD);
        }else if (error) {
            console.log(error);
        }
    }
}