package DAO;

public class HOSTDAO {
	private String DEPARTURETERMINAL = null;
	private String HOSTPW = null;

	public String getDEPARTURETERMINAL() {
		return DEPARTURETERMINAL;
	}

	public void setDEPARTURETERMINAL(String dEPARTURETERMINAL) {
		DEPARTURETERMINAL = dEPARTURETERMINAL;
	}

	public String getHOSTPW() {
		return HOSTPW;
	}

	public void setHOSTPW(String hOSTPW) {
		HOSTPW = hOSTPW;
	}

	public HOSTDAO(String dEPARTURETERMINAL, String hOSTPW) {
		super();
		DEPARTURETERMINAL = dEPARTURETERMINAL;
		HOSTPW = hOSTPW;
	}

}
