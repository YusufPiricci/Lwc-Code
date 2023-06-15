trigger Que9 on Account (before update) {
    
    if(Trigger.isBefore && Trigger.isUpdate){
        
        for(Account w : Trigger.new){
            
            Account accOld = Trigger.oldMap.get(w.Id);
            
            if(w.AnnualRevenue <accOld.AnnualRevenue){
                w.addError('Annual Revenue for an account cannot be reduced');
            }
            
        }
        
    }
    
}