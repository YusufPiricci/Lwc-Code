public class Deneme2 {

    public static void method1(){
        
        List<Opportunity> opp = [SELECT Name, CreatedDate, Amount FROM Opportunity WHERE CreatedDate = LAST_N_DAYS:365 AND Amount>100000];
        for(Opportunity w : opp){
            System.debug(w.Name+ '==>'+'Yıllık hedefinize ulastınız.Tebrikler...');
        }
        
    }
    
}