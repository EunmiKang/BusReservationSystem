package DAO;

public class TERMINALREQUIREDTIME {
	private String ARRIVALTERMINAL = null;
	private String REQUIREDTIME = null;
	private String PRICE = null;
	
	public String getPRICE() {
		return PRICE;
	}
	public void setPRICE(String pRICE) {
		PRICE = pRICE;
	}
	public String getARRIVALTERMINAL() {
		return ARRIVALTERMINAL;
	}
	public void setARRIVALTERMINAL(String aRRIVALTERMINAL) {
		ARRIVALTERMINAL = aRRIVALTERMINAL;
	}
	public String getREQUIREDTIME() {
		return REQUIREDTIME;
	}
	public void setREQUIREDTIME(String rEQUIREDTIME) {
		REQUIREDTIME = rEQUIREDTIME;
	}
	
	public TERMINALREQUIREDTIME(String aRRIVALTERMINAL, String rEQUIREDTIME,
			String pRICE) {
		super();
		ARRIVALTERMINAL = aRRIVALTERMINAL;
		REQUIREDTIME = rEQUIREDTIME;
		PRICE = pRICE;
	}
}
