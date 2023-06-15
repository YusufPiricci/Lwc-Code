public class AudiS5 implements Motor, Klima, Fren {
	//motor
    public void eco(){
        System.debug('Audi S5 ekonomik motor kullanir...');
    }
    public void turbo(){
        System.debug('Audi S5 Turbo motor kullanir...');
    }
    public void gas(){
        System.debug('Audi S5 Benzinli motor kullanir...');
    }
	//klima
    public void analog(){
        System.debug('Audi S5 Analog klima kullanir...');
    }
    public void digital(){
         System.debug('Audi S5 Digital klima kullanir...');
    }
    //fren
    public void abs(){
        System.debug('Audi S5 abs fren kullanir...');
    }
    public void esp(){
        System.debug('Audi S5 esp fren kullanir...');
    }
}