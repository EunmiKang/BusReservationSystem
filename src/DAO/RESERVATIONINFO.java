package DAO;

public class RESERVATIONINFO {
	private String DEPARTURE = null;
	private String ARRIVAL = null;
	private String RESERVATIONDATE = null;
	private String DEPARTURETIME = null;
	private String SEATNUM = null;
	public String getDEPARTURE() {
		return DEPARTURE;
	}
	public void setDEPARTURE(String dEPARTURE) {
		DEPARTURE = dEPARTURE;
	}
	public String getARRIVAL() {
		return ARRIVAL;
	}
	public void setARRIVAL(String aRRIVAL) {
		ARRIVAL = aRRIVAL;
	}
	public String getRESERVATIONDATE() {
		return RESERVATIONDATE;
	}
	public void setRESERVATIONDATE(String rESERVATIONDATE) {
		RESERVATIONDATE = rESERVATIONDATE;
	}
	public String getDEPARTURETIME() {
		return DEPARTURETIME;
	}
	public void setDEPARTURETIME(String dEPARTURETIME) {
		DEPARTURETIME = dEPARTURETIME;
	}
	public String getSEATNUM() {
		return SEATNUM;
	}
	public void setSEATNUM(String sEATNUM) {
		SEATNUM = sEATNUM;
	}
	public RESERVATIONINFO(String dEPARTURE, String aRRIVAL, String rESERVATIONDATE, String dEPARTURETIME, String sEATNUM) {
		super();
		DEPARTURE = dEPARTURE;
		ARRIVAL = aRRIVAL;
		RESERVATIONDATE = rESERVATIONDATE;
		DEPARTURETIME = dEPARTURETIME;
		SEATNUM = sEATNUM;
	}
}
