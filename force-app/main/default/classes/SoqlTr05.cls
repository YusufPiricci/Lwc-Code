public class SoqlTr05 {
    
	//Bir Account object olusturunuz, onu database'e insert ediniz.
	//Insert edildigini hem developer console'dan hem de Admin part'tan dogrulayiniz
	
    public static void method01(){
        
        Account acc1 = new Account(Name='Test01', Phone='123'); //bu sekilde veri girebiliriz
        acc1.Rating='Hot'; //bu sekilde de veri girebilirsiniz
        
        //insert acc1;
        
        //insert acc1; yerine Database.insert(acc1); de yazabiliriz
        //Database.insert(acc1,true); insert acc1; ile aynidir kismi basariya musade etmez. ya hep ya hic
        //Database.insert(acc1,false); kismi basariya musade eder.
        
        //coklu insert yapalim
        
        Account acc2 = new Account(Name='Test02');
        Account acc3 = new Account(Name='Test03');
        Account acc4 = new Account(Name='Test04');
        Account acc5 = new Account(Phone='12345');
        //Account acc5 = new Account(Phone='12345'); ve  Database.insert(accList,true); ile hata alinir
        
        List<Account> accList = new List<Account>{acc2,acc3,acc4,acc5};
        
        Database.insert(accList,true); //ya hep ya hic. insert(accList); te yazabilirdik
        //Database.insert(accList,false); kismi basriya izin verir
        //SoqlTr05.method01(); ile calistir
    }
}