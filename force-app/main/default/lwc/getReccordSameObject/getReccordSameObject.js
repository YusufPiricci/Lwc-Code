import { getRecords } from 'lightning/uiRecordApi';
import { LightningElement, track, wire} from 'lwc';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';

export default class GetReccordSameObject extends LightningElement {

    @track accounts;

    @wire(getRecords,{
        records: [
            {
                recordIds: ["0018d00000MeVpaAAF","0018d00000MeVpRAAV"],
                fields: [NAME_FIELD, TYPE_FIELD],
                optionalFields: [INDUSTRY_FIELD]
            }
        ]
    })
    recordsHandler({data, error}){
        if(data){
            console.log('data : ' , data);
            this.accounts = data.results;
        }else if(error){
             console.log('error : ' , error);
        }
    }
}