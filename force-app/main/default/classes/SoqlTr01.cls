public class SoqlTr01 {
    
	//Account Name'lerini ve telefon numaralarini console'a yazan bir method olusturunuz.
		
    public void method01(){
        
        List<Account> accs = [SELECT Name, Phone FROM Account]; //Class icerisinde SOQL query [] icinde yazilir.
        														//Account'tan gelen veriyi List'e koyduk
        System.debug(accs); //Tek satirda cikti verdi. Class icinde direkt yazdirirsaniz ID otomatik gelir
        					//Birde UI (User Interface)'de otomatik geliyordu
        					
		//Ayri satirlarda yazdiralim
		
        for(Account w : accs){
            System.debug('Account Name: ' + w.Name + 'Account Phone: ' + w.Phone);
            //SoqlTr01 a1 = new SoqlTr01();
			//a1.method01(); ile calistir
        }        
    }
    //----------------------
    //Account Name'lerini ve telefon numaralarini console'a yazan bir method olusturunuz.(Map kullanin)
    
    public static void method02(){
        
        //Map'lerde key-value vardir. Key unique olmalidir yani ID kullanilmalidir
        //Mapler'de SOQL sorgusu, parantezi icine yazilir.
        
        Map<Id, Account> accsMap = new Map<Id, Account>([SELECT Name, Phone FROM Account]);
        System.debug(accsMap); //Tek satirda yazdirir. 2 defa ID verdi. Iyi bir cikti olmadi.
        
        //Ayri satirlarda yazdiralim
        
        for(Account w : accsMap.values()){ //w'nun icine direkt map'i atmadik.Value tarafini aldik
            System.debug('Account Name: ' + w.Name + ' Account Phone: ' + w.Phone + w.Id); //SoqlTr01.method02(); ile calistir
        }       
    }
    //----------------------
    //Her bir Contact icin, Account Name, Account Rating, Contact Name, Contact Department,
    //Case Number ve Case Subject'i console'a yazdiran method olusturunuz.
    //Account parent, Contact child, Case Contact'in child'idir. Ana object Contact'tir.
    
    public static void method03(){
        
        List<Contact> contacts = [SELECT Contact.Name, 
                                  Contact.Department, 
                                  Account.Name, 
                                  Account.Rating, 
                                  (SELECT Case.CaseNumber,Case.Subject 
                                   FROM Cases) 
                                  FROM Contact];
        //Data'yi ana object'ten alalim
        
        for(Contact w : contacts){
            System.debug(w.Name + '--' + w.Department + '--' + w.Account.Name + '--' + w.Account.Rating);
            
            //Data'yi en kucuk child object'ten almak (case)
            for(Case t : w.cases){ //child'a uzandik
                System.debug(t.CaseNumber + '--' + t.Subject);
            }
            System.debug('-----------------------'); //SoqlTr01.method03(); ile calistir
        }       
    }    
}