import { LightningElement } from 'lwc';

export default class OnchangeOrnegi extends LightningElement {
    // 1-Bos bir property olusturalim
    isimSoyisim;

    // 4-handleoncahnge fonksiyonunu olusturalim
    handleonchange(event){
        this.isimSoyisim = event.target.value;
    }
}