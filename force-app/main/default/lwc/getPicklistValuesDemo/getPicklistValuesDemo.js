import { LightningElement, wire } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';

export default class GetPicklistValuesDemo extends LightningElement {
   industryOptions = [];
    accRtId;
    selectedIndustry;

    @wire(getObjectInfo,{objectApiName: ACCOUNT_OBJECT})
    objectInfoHandler({data,error}){
        if (data) {
            this.accRtId = data.defaultRecordTypeId;
        }
        if (error) {
            console.log(error);
        }
    }

    @wire(getPicklistValues, {fieldApiName : INDUSTRY_FIELD, recordTypeId :  '$accRtId'})
    piclistHandler({data, error}){
        if (data) {
            console.log('getPiclistValues datasi' , data);
            this.industryOptions = this.piclistGenerator(data);
        }
        if (error) {
            console.log(error);
        }

    }
    piclistGenerator(data){
        return data.values.map(item=> ({
            label: item.label,
            value: item.value
        }) )
    }
    industryChangeHandler(event){
        this.selectedIndustry = event.target.value;
    }
}