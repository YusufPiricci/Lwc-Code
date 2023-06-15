@isTest
public class UpdateContactAddressTest {

    
    @testSetup //Verileri hazirlamak icin kullanilir(Cunku gercek veriler uzerinde test yapilmaz)
    public static void setup(){
        List<Account> accList = new List<Account>();
        list<Contact> conlist = new List<Contact>();
        //------------
        for(Integer i = 1; i<101;i++){//100 tane Account olusturalim
            Account acc = new Account(Name = 'New Account ' + i);
            acc.BillingCountry = 'USA';
            acc.BillingCity = 'San Diego';
            accList.add(acc);
        }
        insert accList;
        //------------
        for(Account acc : accList){//Her gelen Account icin bir Contact olusturduk
            Contact con = new Contact(LastName ='TechPro', AccountId=acc.Id);
            conList.add(con);
            
        }
        insert conList; //Veri hazirlama bitti test bolumune gecelim
    }
    //--------------
    @isTest
    public static void test(){
        Test.startTest();//Limitler yenilenir. best practise
        UpdateContactAddress uca = new UpdateContactAddress();
        Database.executeBatch(uca);
        Test.stopTest();
        //Butun Contact'larin MaillingCity'lerinin San Diego olmasini bekliyoruz
        System.assertEquals(100, [SELECT Count() FROM Contact WHERE MailingCity = 'San Diego']);
    }
}