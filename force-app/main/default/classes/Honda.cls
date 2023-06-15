public abstract class Honda { //public ile class arasina abstract yazarak bu class'i abstract class haline donusturduk
    
    //Abstract method'lar abstract class'lar icinde olabilir
    
    public void music(){ //Concrete-body'si var
        System.debug('Pro');
    }
	
    public abstract void engine(); //abstract method - body'si yok
    //public ile void arasina abstract yazarak bu method'u abstract yani body'siz yaptik
}