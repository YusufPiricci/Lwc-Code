public class SoqlTr07 {
	//Opportunity Object olusturunuz
	//Olusturdugunuz Opportunity Object'i siliniz
	//Opportunity'de zorunlu alanlar Name, CloseDate ve StageName'dir.
    
    public static void method01(){
        
        Opportunity obj = new Opportunity(Name = 'TechproEd', StageName = 'Clased Won', CloseDate = Date.today().addDays(2) );
        
       	//Opportunity obj = new Opportunity();
        //obj.Name='TechproEd';
        //obj.StageName='Closed Won';
        //obj.CloseDate=Date.today().addDays(2);  seklinde de yazilabilirdi.
    	
        Database.insert(obj);
        //Delete icin Id'ye ihtiyac var.
        List<Opportunity> opps = [SELECT Id FROM Opportunity WHERE Name = 'TechproEd' AND StageName = 'Closed Won'];
		Database.delete(opps);        
    }
    
}