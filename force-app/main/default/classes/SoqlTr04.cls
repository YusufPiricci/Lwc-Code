public class SoqlTr04 {
	
    //1.yol
   
    public static void method01(String className){ //Secim yapabilmek icin className parametresini olusturduk
        
        if(className.equals('Class1')){
            
            List<Account> q1 = [SELECT Name, AnnualRevenue FROM Account WHERE Rating = 'Hot' AND AnnualRevenue > 1000];
            for(Account w : q1){
                System.debug(w.Name + '--' + w.AnnualRevenue); //SoqlTr04.method01('Class1'); ile calistir
            }
            
        }else if(className.equals('Class2')){
            
            List<Account> q2 = [SELECT Name, AnnualRevenue FROM Account WHERE Rating = 'Warm' AND AnnualRevenue > 1000];
            for(Account w : q2){
                System.debug(w.Name + '--' + w.AnnualRevenue); //SoqlTr04.method01('Class2'); ile calistir
            }
            
        }else{
            
            List<Account> q3 = [SELECT Name, AnnualRevenue FROM Account WHERE Rating = NULL];
            for(Account w : q3){
                System.debug(w.Name + '--' + w.AnnualRevenue); //SoqlTr04.method01('xyz'); ile calistir
            }            
        }       
    }  
    //scope kapsaminda butun list'lere ayni ismi verebilirdik(ornegin q1)
    
    //-----------------------------------------------
    //2.yol : Iyi. 1.yol'da bir method'un icinde 3 tane List olusturdum. Bu sistemi yorar.(memory)
    //3 tane for loop'ta kullanmayalim. tek for ile kodumuzu sadelestirelim.
    
public static void method02(String className){
        
        List<Account> q1 = new List<Account>(); //Bos bir List olusturduk
        
        if(className.equals('Class1')){            
            q1 = [SELECT Name, AnnualRevenue FROM Account WHERE Rating = 'Hot' AND AnnualRevenue > 1000];            
        }else if(className.equals('Class2')){            
            q1 = [SELECT Name, AnnualRevenue FROM Account WHERE Rating = 'Warm' AND AnnualRevenue > 1000];            
        }else{            
            q1 = [SELECT Name, AnnualRevenue FROM Account WHERE Rating = NULL];            
        }
        
        for(Account w : q1){
            System.debug(w.Name + '--' + w.AnnualRevenue);
        }
    }  
    
    //-----------------------------------------------
    //3.yol : En iyi cunku dinamik sorgu
    //SELECT Name, AnnualRevenue FROM Account bolumu de 3 defa yazilmis. Orayi da sadelestirelim
    
    public static void method03(String className){
        
        String anaQuery = 'SELECT Name, AnnualRevenue FROM Account';
         //1.query tirnak icine alinir
        //2.Tirnagin icinde tirnak kullanabilmek icin, ic tirnaklardan once ters slash kullanilir
        //3.anaQuery ile filtreleme arasinda bosluk birakilir.(Tirnak ile WHERE arasinda bir kere space'e basilir)
        //4.anaQuery concatinate yapilip atama islemi bitirilir
        
        if(className.equals('Class1')){
            
            anaQuery = anaQuery + ' WHERE Rating = \'Hot\' AND AnnualRevenue > 1000';
            
        }else if(className.equals('Class2')){
            
            anaQuery = anaQuery + ' WHERE Rating = \'Warm\' AND AnnualRevenue > 1000';        
            
        }else{
            
            anaQuery = anaQuery + ' WHERE Rating = NULL';
            
        }
        
        //Class'larda Query'lerde normalde String olmaz. [] ile kullanilir ama 
        //Apexx String Query'leri kullanmamizi saglayan bir method olusturmus.
        //Bunu da Database'e yerlestirmis.
        
        List<Account> result = Database.query(anaQuery);
        
        for(Account w: result){
            System.debug(w.Name + '--'+ w.AnnualRevenue);
        }
    }
    
}