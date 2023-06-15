public class AccountBatchIterable implements Database.Batchable<Account>{

    //--------------------start
    public Iterable<Account> start(Database.BatchableContext bc){
        List<Account> accList = new List<Account>(); //Bu bos listin icini execute'ta dolduracaz
        Account acc = new Account();
        accList.add(acc);
        return accList; //execute'daki scope'a gonderdik
    }
    //--------------------execute
    public void execute(Database.BatchableContext bc, List<Account> scope){
        
        for(Integer i = 1 ; i <201;i++){
            Account acc = new Account(Name = 'Iterable Test Account' + i);
            scope.add(acc);
        }
         Database.insert (scope,false); //Account'larda hata olanlar varsa da insert gerceklesir
    }
    //--------------------finish
    public void finish(Database.BatchableContext bc){
        
        AsyncApexJob myJob = [SELECT Id, Status,NumberOfErrors, TotalJobItems FROM AsyncApexJob WHERE Id=:bc.getJobId()];
        System.debug(myJob);
    }
}