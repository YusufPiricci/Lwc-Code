trigger Opp on Opportunity (before update) {

    if(Trigger.isBefore && Trigger.isUpdate){
        
        for(Opportunity w : Trigger.new){
      
            
            if(w.StageName != Trigger.oldMap.get(w.Id).StageName){
            
         
            
            
                if(w.StageName == 'Closed Lost'){
                    w.Description = 'Cok Uzgunuz :(';
                }
                if(w.StageName == 'Closed Won'){
                    w.Description = 'Yasasin :)';
                }
                if(w.StageName == 'Prospecting'){
                    w.StageName.addError('Sureci basa donduremezsiniz!!!');
                }
            }
        }
    }
    
}