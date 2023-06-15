public class BatchApexYes implements Database.Batchable<sObject>{
	
    //------veriler start'ta cekilir
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('SELECT Id, Name FROM Account');
    }
    //------islem execute'ta yapilir
    public void execute(Database.BatchableContext bc, List<Account> accList){
        for(Account w : accList){
            w.Active__c = 'Yes';
        }
        update accList;
    }
    //-----kullanmak zorunda degiliz ama implement etmek zorundayiz. job ile ilgili bilgiler finish'te alinir
    public void finish(Database.BatchableContext bc){
        
    }
}