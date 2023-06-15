public class AccountBatchClass implements Database.Batchable<sObject>, Database.Stateful{ //1- Database.Statful'u islem goren kayitlari duzgun gorebilmek icin ekledik
	public Integer islenenAccountSayisi = 0;
    //---------------------start methodu
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('SELECT Id, Name, Number_Of_Contact__c ,(SELECT Id FROM Contacts) FROM Account');
    }
    //---------------------execute methodu
    public void execute(Database.BatchableContext bc, List<Account> accList){
        
        for(Account w : accList){
            if(w.Contacts != null){ //Account'un herhangi bir Contact'ı varsa
                w.Number_Of_Contact__c = w.Contacts.size(); //w.Contacts'in icinde List<Contact> vardir
                System.debug('Account Name: ' + w.Name);
                islenenAccountSayisi++;
                
            }
        }
        update accList;
        System.debug('Islem goren kayit sayisi : ' +islenenAccountSayisi);
    }
    //---------------------finish methodu
    public void finish(Database.BatchableContext bc){
        AsyncApexJob myjob = [SELECT Id, Status, NumberOfErrors, TotalJobItems FROM AsyncApexJob WHERE Id =:bc.getJobId()];
        System.debug(myJob);
    }
    
}