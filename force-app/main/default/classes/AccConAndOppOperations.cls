public class AccConAndOppOperations {
    
    public static List<Account> method01(){
     
        List<Account> acc = [SELECT Name, AnnualRevenue, Type, AccountSource From Account];
        for(Account w :acc){
            System.debug(w.Name+' '+ w.AnnualRevenue+' '+w.Type+' '+w.AccountSource);        
        }
        return acc;
    }

//------------------------------------------------------------------------------------------

	public static List<Opportunity> method02(String leadS , String stg){
    
        List<Opportunity> opp = [SELECT Name, LeadSource, StageName FROM Opportunity WHERE LeadSource ='Web' AND StageName = 'Closed Lost'];
        for(Opportunity w :opp){
            System.debug(w.Name+'---'+w.LeadSource+'---'+w.StageName);
        }        
        return opp;
	}

//-------------------------------------------------------------------------------------------    
    
    public static void method03(){
        
        List<Opportunity> opp1 = [SELECT Account.Name, Opportunity.Name, Opportunity.Amount, Account.AnnualRevenue, Account.Type, StageName 
                                  FROM Opportunity WHERE Account.Type = 'Customer - Direct' AND StageName = 'Closed Won'];
        for(Opportunity w :opp1){
            System.debug(w.Account.Name + ' => '+ w.Name+ ' => '+w.Account.Type + ' => '+ w.StageName);
        }
    }
    
//--------------------------------------------------------------------------------------------  

    public static void createAcc(String name, Integer annualRevenue, String type){
        if(String.isBlank(name)){
            System.debug('Account isim yazilmadan olusturulamaz!!!');
            return;    
        }
        Account newAccount = new Account(Name = name, AnnualRevenue = annualRevenue, Type = type);
        insert newAccount;
    }
    //Bunda biraz yardim aldim :)
    
//-------------------------------------------------------------------

    public static void sumAmount(){
        List<Opportunity> total = [SELECT Amount From Opportunity WHERE StageName = 'Closed Won'];
         
        Decimal toplam =0;
       
        for(Opportunity w :total){
          toplam += w.Amount;  
        }
        System.debug(toplam);
        
    }
    
//-------------------------------------------------------------------

    public static List<Account> method05(String stg){
        List<Account> acc = [sELECT Name, (SELECT Id From Opportunities) FROM Account WHERE Id IN (SELECT AccountId FROM Opportunity Where StageName = :stg)];
    	System.debug(acc);
        return acc;
    	
    } 
    
//---------------------------------------------------------------------
     
    
    public static void runDynamicContactQuery(List<String> lstStr){
        String fieldNames = '';
        for(String eachStr : lstStr){
          fieldNames += eachStr + (',');
        }
        fieldNames = fieldNames.removeEnd(',');
    
        String queryString = 'Select ' + fieldNames + ' From Contact' ;
        system.debug(queryString);
    
        List<Contact> lstCon = Database.query(queryString);
    
        for(Contact eachCon : lstCon){
          System.debug(eachCon);
        }
    
      }
    
    //---------------------------------------------------------
    
    public static Contact createCont(Id AccId){
        Account acc = [SELECT Id, Name FROM Account WHERE ID = : AccId];
        Contact cont = new Contact();
        cont.LastName = Acc.Name;
        cont.AccountId = acc.Id;
        insert cont;
        return cont;
    }
    
    //-----------------------------------------------------------
    
    public static void des(){
        List<Opportunity> oppList = [SELECT Id, Name,  Description, Amount FROM Opportunity ORDER BY Amount DESC NULLS LaST LIMIT 10];
        for(Opportunity w : oppList){
            w.Description ='This is one of the top 10 opportunities.Please work on this properly ';
        }
        update oppList;
    }
    
    
    
    
    
    
    
    
    
    
}