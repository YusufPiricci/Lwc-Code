trigger Q41 on Contact (before insert) {

    for(Contact w : Trigger.new){
        if(w.AccountId != Null){
            System.debug(w.Name+w.LastName+' contact crated with Account');
        }
        if(w.AccountId == Null){
            System.debug(w.Name+w.LastName+' Contact crated without Account');
        }
    }
    
}