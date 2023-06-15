public class SoslTr01 {
	
    public static void method01(){
        //SOSL Query'si class icinde [] icinde yazilir.
        //Arama kelimesi de '' (tirnak) icinde yazilir.
        
        List<List<sObject>> result = [FIND 'United' IN NAME FIELDS RETURNING Account(Name), Contact(FirstName, LastName)];
        
        //sObject ==> Salesforce Object
        //List'in icine neden List yazdim? Cunku Account'tan ayri, Contact'tan ayri bir List gelecek
        
        System.debug(result);
        
        for(List<sObject> w : result){
            
            System.debug(w);
            
        }
    }    
}