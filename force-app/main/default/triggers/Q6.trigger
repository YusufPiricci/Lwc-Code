trigger Q6 on Opportunity (before insert) {
    
    for(Opportunity w: Trigger.new){
        System.debug(w.StageName +'---'+w.Description+ '---'+w.Name);
    }
    
}