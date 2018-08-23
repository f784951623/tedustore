package cn.tedu.store.service.ex;

public class UsernameAleradyException extends RuntimeException{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public UsernameAleradyException(){
		
	}
	public UsernameAleradyException(String msg){
		super(msg);
	}
}
