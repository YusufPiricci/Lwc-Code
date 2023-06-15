public class SoqlTr06 {
    
    //Database'e bir tane Lead object'i insert ediniz.
    //Insert ettiginiz Lead Object'inin LastName'ini 'xyz' yapiniz.
    //Lead'de Company, LastName, Status zorunlu alanlardir. 
    //Lead Status'in default degeri oldugundan yazmayabiliriz
    
    public static void method01(){
        
        Lead obj = new Lead(FirstName='Ali', LastName='Can', Company='TechPro Education');
        insert obj;
        
        //Update, Delete, Undelete operasyonlari kritik operasyonlardir. Bunlar 'Id' olmadan yapilamazlar.
        //Id bir object'i unique yapar (benzersiz)
        
        //List<Lead> leads = [SELECT Id FROM Lead WHERE FirstName='Ali' AND LastName='Can' AND Company='TechPro Education'];
        
        List<Lead> leads = [SELECT Id FROM Lead WHERE Id =: '00Q8d00000B7atYEAR'];
        
        for(Lead w : leads){
            w.LastName = 'Kaya';
        }
        update leads; // Database.update(leads); seklinde de yazabilirdik
   	  //00Q8d00000B7atYEAR
    //00Q8d00000B7auMEAR
    }
}