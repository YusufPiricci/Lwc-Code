import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import AREVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';


import { getRecord } from 'lightning/uiRecordApi';
import { LightningElement, wire } from 'lwc';


const FIELDS = [NAME_FIELD, TYPE_FIELD, AREVENUE_FIELD, INDUSTRY_FIELD];


export default class GetAccountRecord extends LightningElement {
   
    recordId = '0018d00000R6uOKAAZ';
    account;

    @wire(getRecord, {recordId:'$recordId', fields:FIELDS})
    accountHandler({data,error}){

        if(error){
            console.log(error);
        }
        else if(data){
            this.account = data;
            console.log(this.account);
        }

    }
}   