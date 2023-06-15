import { getRecord } from "lightning/uiRecordApi";
import { LightningElement, wire } from 'lwc';

export default class GetCaseRecord extends LightningElement {

    recordId = '5008d00000QkdqOAAR';
    subject;
    priority;
    status;
    caseNumber;


    @wire(getRecord, {recordId: '$recordId', layoutTypes: ['Full'], modes:['View']})

    caseRecordHandler({data,error}){
        if(error){
            console.log(error);
        }
        else if(data){
            console.log(data);
            this.subject=data.fields.Subject.value;
            this.priority=data.fields.Priority.value;
            this.status=data.fields.Status.value;
            this.caseNumber=data.fields.CaseNumber.value;
        }

    }

}