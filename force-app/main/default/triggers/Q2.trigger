trigger Q2 on Case (before update) {
    
    for(Case w : Trigger.new){
        Case oldCase = Trigger.oldMap.get(w.Id);
        if(w.Origin != oldCase.Origin ){
            System.debug('Case origin is changed for ' + w.CaseNumber);
        }
    }
    
}