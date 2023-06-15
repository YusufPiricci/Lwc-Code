public interface Motor { //Motor interface olacak.class'i silip interface yazdik
    
    //i) Interface icindeki method'lar otomatik olarak 'public' dir. Bu yuzden Interface'lerde method olustururken
    //access modifier yazmayiz
    //ii) Interface icindeki method'lar otomatik olarak 'abstract'tir. Bu yuzden Interface'lerde abstract
    //method olusturuken 'abstract' keywordunu ve method body'sini yazmayiz.
    
    void eco();
    void turbo();
    void gas();
    //interface olduklari icin otomatik abstract'tirlar yani abstract yazmaya gerek yoktur
    //abstract olduklari icin de body'leri yoktur.

}