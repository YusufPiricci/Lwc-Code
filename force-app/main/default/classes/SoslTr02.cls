public class SoslTr02 {
	
    public static void method01(){
        
        List<List<sObject>> result = [FIND 'Un*' IN NAME FIELDS RETURNING Account(Name), Contact(FirstName, LastName)];
        //'Un*' ==> Un ile baslar, devami baska olabilir.
        
        //System.debug(result); //SoslTr02.method01(); ile calistir. Tek satirda yazdirir.
        
        //Account ve Contact'lari ayri satirda yazdiralim
        
        for(List<sObject> w : result){
            System.debug(w); //SoslTr02.method01(); ile calistir. Ayri satirlarda yazdirir.
        }
    }    
}