import { LightningElement } from 'lwc';

export default class ForEachComp extends LightningElement {

    contacts =[ 
        {
            Id: 1,
            Name: 'Amy Taylor',
            Title: 'VP of Engineering'
        },
        {
            Id: 2,
            Name: 'Michael Jones',
            Title: 'VP of Sales'
        },
        {
            Id: 3,
            Name: 'Jennifer Wu',
            Title: 'CEO'
        }
    ];

    books = [
        "Sefiller","Suc ve Ceza","1984","Gun Olur Asra Bedel","Insan ne ile Yasar","Denemeler","Cole Inen Nur"
    ];

}