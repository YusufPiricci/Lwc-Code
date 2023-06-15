trigger Q4 on Lead (before insert) {
    
    for(Lead w :Trigger.new){
        if(w.LeadSource=='Web'){
            System.debug('Rating should Be Cold');
            w.Rating = 'Cold';
            
        }else{
            
           System.debug('Rating should Be Hot');
            w.Rating = 'Hot';
        }
    }
    
}