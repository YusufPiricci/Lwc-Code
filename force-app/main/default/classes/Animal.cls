public virtual class Animal {
	//Yeni data uretmeyen method'larin return type'lari 'void' olur
	//Bu method'lar console'a yazi yazdiracak, yeni data uretmeyecek
	//public yapalim ki, kolaylikla ulasalim (get ve set'siz)
	
    public virtual void eat(){
        System.debug('Animals eat...');
    }
	
    public virtual void drink(){
        System.debug('Animals drink...');
    }




}