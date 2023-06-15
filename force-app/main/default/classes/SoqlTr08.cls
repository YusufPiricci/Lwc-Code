public class SoqlTr08 {
    
	//SoqlTr07'de cop kutusuna gonderilen Opportunity'i geri getirelim.
	
    public static void method01(){
        
        List<Opportunity> opps = [SELECT Id FROM Opportunity WHERE isDeleted=true ALL ROWS];
        
        //isDeleted=true ALL ROWS ile Recyle Bin'deki butun opp'ler geri gelir.
        //Ornegin, WHERE'den sonra Name='GenePoint' ALL ROWS]; diye belirtirseniz, sadece GenePoint geri getirilir.
        
        Database.undelete(opps, false); //direkt eslesme olmayabiliyor. False kullanilmasi uygundur.
        //undelete opps; veya Database.undelete(opps); ta yazilabilirdi.
    }    
}