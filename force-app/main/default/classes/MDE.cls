public class MDE {
    	
    public static void test(){
    //1.DML islemi
        Account acc = new Account(Name='Deneme');
        insert acc;
        MDE.assignPS(); //future method'u parametre ile cagirdik
        
    }
    @future
    public static void assignPS(){
    //2.DML islemi
    //Hangi permission set ve user oldugunu anlamak icin sorgulama yapalim 
       
        PermissionSet ps = [SELECT Id FROM PermissionSet WHERE Name='Izin'];
        User u = [SELECT Id FROM User WHERE Username='yusufpiricci97@gmail.com'];
        
        //User'a PermissionSet'i atayalim. Bunun icin PermissionSetAssignment Object'i kullanilir
        //PermissionSetAssignment'in AssigneeId ve PermissionSetId field'leri kullanilir
        
        PermissionSetAssignment psa = new PermissionSetAssignment(AssigneeId=u.Id, PermissionSetId=ps.Id);
        insert psa;
    }
}