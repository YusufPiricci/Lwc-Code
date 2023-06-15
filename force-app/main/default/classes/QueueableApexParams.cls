public class QueueableApexParams implements Queueable{

    //1-Constructor (yapilandirma). Bunu olusturma sebebimiz disardan parametre alabilmesi icin
    
    public List<Account> listAccount;//4-Method disi bir List'e yukeledik ki kullanilabilsin
    
    public QueueableApexParams(List<Account> accList){ //2- Class isminin aynisi buraya verilir
        listAccount = acclist;//3-Scope yuzunden accList bu method disi kullanilamaz
        
    }
    //------------------------5- execute methodunu implement edelim
    
    public void execute(QueueableContext context){
        for(Account w : listAccount){
            if(w.Contacts != null){ //6- Account'un Contact'i bos degilse
                w.Number_Of_Contact__c = w.Contacts.size();//7-accContacts List'tir
            }
        }
        update listAccount;
        //context variable'ini su sekilde kullanabilirdik.
        //AsyncApexJob myAsync = [SELECT Id, Status FROM AsyncApexJob WHERE Id =:context.getJobId()];
        //System.debug(myAsync);
        
        //Alttaki kodlari Child queueable Class'i olusturunca yazdik
        
        ChildQueueableClass cqc = new ChildQueueableClass();
        System.enqueueJob(cqc);
    }
    
}