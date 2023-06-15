import { LightningElement } from 'lwc';

export default class OnInputOrnegi extends LightningElement {
    // 1-Degisken olusturduk
    isim = 'veli';//isim; yazsaydik ilk degeri olmayan bir property olusturmus olurduk

    // 4-oninput'taki fonksiyonu olusturalim Input'a yeni bir deger girildiginde bu function calisir

    handleinput(event){
        console.log('Degisiklik var');
        this.isim = event.target.value; // Inputa girilen degeri yakalar
    }
}