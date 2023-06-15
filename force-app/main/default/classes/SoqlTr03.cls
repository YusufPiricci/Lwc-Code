public class SoqlTr03 {
    
	//ornek 3: Account ismi 'GenePoint', 'Burlington Textiles Corp of America', 'sForce', 'Dickenson plc' olan
	//Account'larin Rating'lerini, Account isimleri ile birlikte console'a yazdiran method'u olusturunuz
	
    //1.yol: Tavsiye edilmez cunku IN'den sonra bir cok Account yazilabilir bu da Query'i okunmaz hale getirir. 
    //Query'inin bozulma ihtimali de artar. Sadelestirelim.
    
    public static void method01(){
        List<Account> accs = [SELECT Name, Rating 
                              FROM Account 
                              WHERE Name IN ('GenePoint', 'Burlington Textiles Corp of America', 'sForce', 'Dickenson plc')];
        
        for(Account w : accs){
            System.debug(w.Name + '--' + w.Rating); //SoqlTr03.method01(); ile calistir
        }
    }
    
    //--------------------------------------------
    // 2.yol: Tavsiye edilir.
    // :accountNames ifadesine 'Binding Variable' denir
    // Binding Variable'lar 'IN', 'NOT IN', '=', '!=', 'LIMIT', 'OFFSET' lerde kullanilabilir
    
    public static void method02(){
        
        List<String> accountNames = new List<String>{'GenePoint', 'Burlington Textiles Corp of America', 'sForce', 'Dickenson plc'};
         //----------------------------------------------------
        //IN Kullanimi
        
        List<Account> accs1 = [SELECT Name, Rating FROM Account WHERE Name IN :accountNames];
        for(Account w : accs1){
            System.debug(w.Name + '--' + w.Rating); //Class'i SAVE edip SoqlTr03.method02(); ile calistir
        }
        System.debug('============================'); //SoqlTr03.method02(); ile calistir
        
        //----------------------------------------------------
        //'NOT IN' kullanimi
        
        List<Account> accs2 = [SELECT Name, Rating FROM Account WHERE Name NOT IN :accountNames];
        for(Account w : accs2){
            System.debug(w.Name + '--' + w.Rating);
        }
        System.debug('============================'); //SoqlTr03.method02(); ile calistir
        
        //----------------------------------------------------
        //'=' kullanimi
        
        List<Account> accs3 = [SELECT Name, Rating FROM Account WHERE Name = :accountNames];
        for(Account w : accs3){
            System.debug(w.Name + '--' + w.Rating);
        }
        System.debug('============================'); //SoqlTr03.method02(); ile calistir
        
        //----------------------------------------------------
        //'!=' kullanimi
        
        List<Account> accs4 = [SELECT Name, Rating FROM Account WHERE Name != :accountNames];
        for(Account w : accs4){
            System.debug(w.Name + '--' + w.Rating);
        }
        System.debug('============================'); //SoqlTr03.method02(); ile calistir
        
    }   
    
    //-----------------------------
    
    //Account isimlerini alfabetik siraya koyduktan sonra 3. 4. ve 5. Account'larin Rating'lerini Account
    //isimleriyle beraber console'a yazdiran method'u olusturunuz. LIMIT 3 OFFSET 2
    //LIMIT ve OFFSET kullaniminda ORDER BY
    
    //1.yol: 
    
    public static void method03(){
        
        List<Account> accs = [SELECT Name, Rating FROM Account ORDER BY Name LIMIT 3 OFFSET 2];
        
        for(Account w : accs){
            System.debug(w.Name + '--' + w.Rating);
        }
        
    }
    
    //-----------------------------
    
    //2.yol : Binding variable kullanalim
    //Query'e dokunmadan sadece Integer kisminda degisiklik yapariz. Kodu bozma riski azalir.
    
    public static void method04(){
        
        Integer lim = 3;
        Integer oSet = 2;
        
        List<Account> accs = [SELECT Name, Rating FROM Account ORDER BY Name LIMIT :lim OFFSET :oSet];
        
        for(Account w : accs){
            System.debug(w.Name + '--' + w.Rating); //SoqlTr03.method04(); ile calistir
        }       
    }
    
    //-----------------------------
    
    //3.yol: En iyi yol (best)
    //Method'u dinamik yapabiliriz. Parametreleri baslangicta sorar
    
    public static void method05(Integer lim, Integer oSet){
        
        List<Account> accs = [SELECT Name, Rating FROM Account ORDER BY Name LIMIT :lim OFFSET :oSet];
        
        for(Account w : accs){
            System.debug(w.Name + '--' + w.Rating); //SoqlTr03.method05(3,2); ile calistir
        }
    }
}