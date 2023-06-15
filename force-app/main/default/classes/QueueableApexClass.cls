public class QueueableApexClass implements Queueable{
	
    public void execute(QueueableContext context){
        Account acc = new Account(Name ='TechPro99');
        insert acc;
    }
    
}