trigger Que10 on Account (after update) {

    if(Trigger.isAfter && Trigger.isUpdate){
       
        Set<Id> accIds = new Set<Id>();
        
        for(Account  w : Trigger.new){
        
            if(w.Rating == 'Hot'){
            
                accIds.add(w.Id);
                
                List<Opportunity> opp = [SELECT Name FROM Opportunity WHERE AccountId IN : accIds] ;
                
                Integer oppCount = opp.size();
                
                if(oppCount > 3){
                
                    System.debug('Account is NOW HOT!And it has '+oppCount+' opportunities');
                
                }
            }
        }
        
    }
    
}