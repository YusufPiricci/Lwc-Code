trigger Q7 on Opportunity (before update) {
    
    if(Trigger.isBefore && Trigger.isUpdate){
        for(Opportunity w : Trigger.new){
            Opportunity oppOld = Trigger.oldMap.get(w.Id);
            System.debug('New Name ==> ' + w.Name + 'Old Name ==> '+oppOld.Name );
            System.debug('New Amount ==> '+ w.Amount + 'Old Amount ==> ' + oppOld.Amount);
            
            
        }
    }
    
}