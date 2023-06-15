trigger Q8 on Opportunity (before update) {

    if(Trigger.isBefore && Trigger.isUpdate){
        
        for(Opportunity w : Trigger.new){
            
            Opportunity oppOld = Trigger.oldMap.get(w.Id);
            if(w.StageName != oppOld.StageName){
               
               System.debug('Description => ' + w.Description + '/  Opportunity Name => ' + w.Name);
            
            }
            
        }
        
    }
    
}