public class AudiA4 implements Motor, Klima, Fren{
	//motor
    public void eco(){
        System.debug('Audi A4 ekonomik motor kullanir...');
    }
    public void turbo(){
        System.debug('Audi A4 Turbo motor kullanir...');
    }
    public void gas(){
        System.debug('Audi A4 Benzinli motor kullanir...');
    }
	//klima
    public void analog(){
        System.debug('Audi A4 Analog klima kullanir...');
    }
    public void digital(){
         System.debug('Audi A4 Digital klima kullanir...');
    }
    //fren
    public void abs(){
        System.debug('Audi A4 abs fren kullanir...');
    }
    public void esp(){
        System.debug('Audi A4 esp fren kullanir...');
    }
}