public class UpdateContactAddress implements Database.Batchable<sObject>{

    //ornek 4: Bir Account'un Billing Country'si USA ise, Billing City'sini Child Contact'in Mailing City'sine atayiniz
    
    //----------------------Start
    public Database.QueryLocator start(Database.BatchableContext bc){
        
        return Database.getQueryLocator('SELECT Id, BillingCity, (SELECT Id, MailingCity FROM Contacts) FROM Account WHERE BillingCountry = \'USA\' ');
        
    }
    //--------------------Execute
    public void execute(Database.BatchableContext bc, List<Account> accList){
        List<Contact> conList = new List<Contact>();
        
        for(Account w : accList){
            for(Contact con : w.Contacts){ // Her Account'a bagli Contact'i relationship ismiyle aldik
                con.MailingCity = w.BillingCity;
                conList.add(con);
            }
            update conList;
        }
        
    }
    //---------------------Finish
    public void finish(Database.BatchableContext bc){
        
    }
    
}