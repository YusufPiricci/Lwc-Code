trigger Q5 on Opportunity (before insert) {

    for(Opportunity w : Trigger.new){
        System.debug(W.Name +'--'+w.CloseDate +'--'+w.Amount);
    }
    
}