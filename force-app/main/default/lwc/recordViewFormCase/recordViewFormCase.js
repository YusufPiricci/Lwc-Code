import { LightningElement } from 'lwc';

import CASE_OBJECT from '@salesforce/schema/Case';
import CASENUMBER_FIELD from '@salesforce/schema/Case.CaseNumber';
import ACCOUNT_FIELD from '@salesforce/schema/Case.AccountId';
import ORIGIN_FIELD from '@salesforce/schema/Case.Origin';
import PRIORTY_FIELD from '@salesforce/schema/Case.Priority';
import STATUS_FIELD from '@salesforce/schema/Case.Status';
import SUBJECT_FIELD from '@salesforce/schema/Case.Subject';
import CaseNumber from '@salesforce/schema/Case.CaseNumber';

export default class RecordViewFormCase extends LightningElement {
    recordId ='5008d00000QkdvSAAR';
    objectName = CASE_OBJECT;
    fields = {
        caseNumber :CASENUMBER_FIELD,
        account : ACCOUNT_FIELD,
        origin : ORIGIN_FIELD,
        priorty : PRIORTY_FIELD,
        status : STATUS_FIELD,
        subject : SUBJECT_FIELD
    }
}