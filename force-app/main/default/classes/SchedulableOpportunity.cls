public class SchedulableOpportunity implements Schedulable{

    public void execute(SchedulableContext context){
        
        //Bize opp list lazim. Senaryomuzdaki sartlara uyanlari sorgu ile bulup parametre olarak gonderelim
        List<Opportunity> oppList = [SELECT Id, Name, OwnerId, CloseDate 
                                     FROM Opportunity 
                                     WHERE isClosed__c = False AND CloseDate < Today];
           //Today yani yakin tarih daha buyuk sayiliyor. Today'i one yazamazsaniz
        TaskClass.createTaskForOpp(oppList);//Task olusumu asenkron hale geldi
        //Calisma zamanini Anonymous window'da belirleyelim
    }
    
}