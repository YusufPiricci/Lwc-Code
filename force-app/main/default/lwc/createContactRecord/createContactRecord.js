import { LightningElement } from 'lwc';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import { createRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class CreateContactRecord extends LightningElement {
    fields = {};
    changeHandler(event){
        const {name,value} = event.target;
        this.fields[name] = value;
    }
    contactOlustur(){
        const recordInput = {
            apiName : CONTACT_OBJECT.objectApiName,
            fields: this.fields
        };
        createRecord(recordInput)
        .then(result =>{
            console.log(result);
            this.mesajgoruntule("Başarili", "Contact kaydi basari ile olusturuldu", "success");
            this.template.querySelector('form.ContactOlusturForm').reset();
            this.fields = {};
        })
        .catch(error =>{
            console.log(error);
            this.mesajgoruntule("Hata Olustu", error.body.message, "error");
        })
    }

    mesajgoruntule(title,message,variant){
        const mesaj = new ShowToastEvent({title, message, variant});
        this.dispatchEvent(mesaj);
    }
}