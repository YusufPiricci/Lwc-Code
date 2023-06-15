public class SoqlTr02 {
	
    //Ornek 1: Account Object'inin minimum, maksimum ve ortalama isci sayilarini veren method olusturunuz
    
    //Object olusturmamak icin, method'umuzu static yapalim
    //Isci sayilarinin field name'i NumberOfEmployees'dir.
    //Aggregate function'lar ile olusturulan veriler genelde Array'in icine konulur.
    //AggregateResult bir data tipidir (String, List<DataType> gibi)
    
    public static void method01(){
        
        AggregateResult[] result = [SELECT MIN(NumberOfEmployees), MAX(NumberOfEmployees),AVG(NumberOfEmployees) FROM Account];
        
        System.debug(result); //(AggregateResult:{expr0=120, expr1=145000, expr2=21996.81818181818}) Tek satirda yazdirdi
        					  //SoqlTr02.method01(); ile calistir
        
        //Record'daki her data'yi ayri ayri alalim.
        
        System.debug('Minimum number of employees = ' + result[0].get('expr0')); //Minimum number of employees = 120
        System.debug('Maximum number of employees = ' + result[0].get('expr1')); //Maximum number of employees = 145000
        System.debug('Avarege number of employees = ' + result[0].get('expr2')); //Avarege number of employees = 21996.81818181818
    }
    //--------------------------------
    
    //expr0 ve digerlerinin yerine daha manali seyler yazalim
    public static void method02(){
        
        //Alias ==> Takma isim kullanalim.
        AggregateResult[] result = [SELECT MIN(NumberOfEmployees) min, MAX(NumberOfEmployees) max, AVG(NumberOfEmployees) avg FROM Account];
        
        System.debug(result); //(AggregateResult:{min=120, max=145000, avg=21996.81818181818})
        					  //SoqlTr02.method02(); ile calistir
        
        //Record'daki her data'yi ayri ayri alalim.
        
        System.debug('Minimum number of employees = ' + result[0].get('min')); //Minimum number of employees = 120
        System.debug('Maximum number of employees = ' + result[0].get('max')); //Maximum number of employees = 145000
        System.debug('Avarege number of employees = ' + result[0].get('avg')); //Avarege number of employees = 21996.81818181818
        
    }
    //--------------------------------
    
    //Array'in icinde coklu kayit olabilir
    //Ornek 2: Account ortalama isci sayilarini Industry'lere gore veren method olusturunuz
    //1.yol
    public static void method03(){
        AggregateResult[] result = [SELECT Industry, AVG(NumberOfEmployees) avgByIndustry FROM Account GROUP BY Industry];
        System.debug(result); //SoqlTr02.method03(); ile calistir
        
        //record'lardaki her bir data'yi ayri ayri yazdiralim
        for(AggregateResult w : result){
            System.debug('Industry: ' + w.get('Industry') + '==> Avarege Number of Employees : ' + w.get('avgByIndustry'));
            //SoqlTr02.method03(); ile calistir
        }
    }
 	//2.yol: Tavsiye edilmez
    //1.yol daha iyidir. 2.yolda, for’un parantez ici okunurlugu daha zordur
    //Query, loop’un icinde oldugu icin disinda kullanilamaz. Buna scope (kapsam) denir.Scope’u gerektigi kadar acmak gerekir.
    public static void method04(){
        for(AggregateResult w : [SELECT Industry, AVG(NumberOfEmployees) avgByIndustry FROM Account GROUP BY Industry]){
            		//method03'teki result yerine, result’in karsiligi olan QUERY’i for dongusu icine yazdik
            System.debug('Industry: ' + w.get('Industry') + '==> Avarege Number of Employees : ' + w.get('avgByIndustry'));
            		//SoqlTr02.method04(); ile calistir
        }
    }
    }