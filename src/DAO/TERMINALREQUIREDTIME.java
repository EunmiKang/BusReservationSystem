package DAO;

public class TERMINALREQUIREDTIME {
	private String ARRIVALTERMINAL = null;
	private String REQUIREDTIME = null;
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
	public TERMINALREQUIREDTIME(String aRRIVALTERMINAL, String rEQUIREDTIME) {
		super();
		ARRIVALTERMINAL = aRRIVALTERMINAL;
		REQUIREDTIME = rEQUIREDTIME;
	}
}