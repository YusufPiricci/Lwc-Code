public class Students { //Class isimleri buyuk harfle baslar
    
    private String name = 'Ali Can';
    private Integer age = 13;
    private Boolean successful = true;
    
    //name, age ve successful data'larini okunabilir yapin
    
    public String getName(){ //getName variable ismidir(method ismidir). Genel kullanim bu sekildedir.Once get sonra variable yazmak
        return this.name; //name kesinlikle private'daki variable olan name olmalidir. Return, name;deki veriri bana ver demektir
        
    }
    
    public Integer getAge(){
        return this.age;
    }
    
    public Boolean isSuccessful(){ //is soru anlami katar. Basarili mi? evet
        return this.successful;
    }
	//yeni data uretmeyen methodlarin return typelari 'void' dir.
    //set method yeni data uretmez, var olan data'yi degistirir.Bu yuzden return type lari 'void'dir
	
    public void setName(String name){
        this.name = name;
    }
    
    public void setAge(Integer age){
        this.age = age;
    }
    
    public void setSuccessful(Boolean successful){
        this.successful = successful;
    }
}