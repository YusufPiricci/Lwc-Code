public class DeleteAccount implements Database.Batchable<sObject>{

    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('SELECT Id, Name FROM Account WHERE Name LIKE \'Iterable Test Account%\'');
    }
    public void execute(Database.BatchableContext bc, List<Account> accList){
        for(Account w : accList){
            
        }delete accList;
    }
    public void finish(Database.BatchableContext bc){
        
    }
    
}