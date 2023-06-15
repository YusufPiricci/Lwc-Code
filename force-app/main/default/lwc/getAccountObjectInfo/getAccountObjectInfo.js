import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import ACCOUNT_OBJECT  from '@salesforce/schema/Account'

export default class GetAccountObjectInfo extends LightningElement {
    accDefRecordTypeId;
    @wire(getObjectInfo,{objectApiName: ACCOUNT_OBJECT})
    accountInfoHandler(data , error){
       if(data){
        console.log("Data sonuclar : " , data);
        this.accDefRecordTypeId = data.defaultRecordTypeId;
        }
        if(error){
            console.log("Errorlar : " , error);
        }
    }
}