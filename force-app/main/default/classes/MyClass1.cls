public class MyClass1 {
	
    //Rastgele bir harf ureten bir method (fonksiyon) olusturunuz
    //public ==> herkese acik, static ==> class ismiyle method'u cagirabiliriz, String ==>return type
    
    public static String rastgeleBirHarfVer(){
        
        String alfabe = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
        
        //Mantik: Rastgele bir index bulup onu secmeliyiz. 52 harf var, index 51 olmali cunku index'ler 0'dan baslar.
        
        //Math.random() size 0-1 arasi (0-1 dahil) sayilar verir. Bunu max degerinizle carparsaniz,size o aralikta rastgele sayi uretir.
        
        Integer maxIndex = alfabe.length()-1; //maxIndex icinde 51 vardir
        
           //0-51 sayilar uretir. ornegin, Math.random'dan 0.9 gelsin * 51 = 45,9 ondalikli sayiyi tamsayiya cevirmeliyiz.
            					//Integer.valueOf() tamsayiya cevirir
         Integer rastgeleIndex = Integer.valueOf(Math.random()*maxIndex); //5
        
        
        
        return alfabe.substring(rastgeleIndex, rastgeleIndex+1); //5,6 ==>F
    }
    
}