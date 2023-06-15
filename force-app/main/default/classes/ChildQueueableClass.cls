public class ChildQueueableClass implements Queueable{

    public void execute(QueueableContext context){
        System.debug('Bu mesaj Child Queueable Class tan gelmektedir');
    }
    
}