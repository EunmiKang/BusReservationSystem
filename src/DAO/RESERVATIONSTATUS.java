package DAO;

import java.util.List;

import DAO.*;

public class RESERVATIONSTATUS {
	
	private String DEPARTURETERMINAL	= null;
	private String ARRIVALTERMINAL		= null;
	private String DEPARTUREDATA		= null;
	private String DEPARTURETIME		= null;
	private String BUSCLASS 			= null;
	private String REQUIREDTIME 		= null;
	private String PRICE 				= null;
	private String SEATINFO				= null;
	public String getSEATINFO() {
		return SEATINFO;
	}
	public void setSEATINFO(String sEATINFO) {
		SEATINFO = sEATINFO;
	}
	private String REMAINSEAT			= null;
	
	public String getDEPARTURETERMINAL() {
		return DEPARTURETERMINAL;
	}
	public void setDEPARTURETERMINAL(String dEPARTURETERMINAL) {
		DEPARTURETERMINAL = dEPARTURETERMINAL;
	}
	public String getARRIVALTERMINAL() {
		return ARRIVALTERMINAL;
	}
	public void setARRIVALTERMINAL(String aRRIVALTERMINAL) {
		ARRIVALTERMINAL = aRRIVALTERMINAL;
	}
	public String getDEPARTUREDATA() {
		return DEPARTUREDATA;
	}
	public void setDEPARTUREDATA(String dEPARTUREDATA) {
		DEPARTUREDATA = dEPARTUREDATA;
	}
	public String getDEPARTURETIME() {
		return DEPARTURETIME;
	}
	public void setDEPARTURETIME(String dEPARTURETIME) {
		DEPARTURETIME = dEPARTURETIME;
	}
	public String getBUSCLASS() {
		return BUSCLASS;
	}
	public void setBUSCLASS(String bUSCLASS) {
		BUSCLASS = bUSCLASS;
	}
	public String getREQUIREDTIME() {
		return REQUIREDTIME;
	}
	public void setREQUIREDTIME(String rEQUIREDTIME) {
		REQUIREDTIME = rEQUIREDTIME;
	}
	public String getPRICE() {
		return PRICE;
	}
	public void setPRICE(String pRICE) {
		PRICE = pRICE;
	}
	public String getREMAINSEAT() {
		return REMAINSEAT;
	}
	public void setREMAINSEAT(String rEMAINSEAT) {
		REMAINSEAT = rEMAINSEAT;
	}
	public RESERVATIONSTATUS(String dEPARTURETERMINAL, String aRRIVALTERMINAL, String dEPARTUREDATA,
			String dEPARTURETIME, String bUSCLASS, String rEQUIREDTIME, String pRICE, String sEATINFO,
			String rEMAINSEAT) {
		super();
		DEPARTURETERMINAL = dEPARTURETERMINAL;
		ARRIVALTERMINAL = aRRIVALTERMINAL;
		DEPARTUREDATA = dEPARTUREDATA;
		DEPARTURETIME = dEPARTURETIME;
		BUSCLASS = bUSCLASS;
		REQUIREDTIME = rEQUIREDTIME;
		PRICE = pRICE;
		SEATINFO = sEATINFO;
		REMAINSEAT = rEMAINSEAT;
	}
	public RESERVATIONSTATUS(String dEPARTURETERMINAL, String aRRIVALTERMINAL, String dEPARTUREDATA) {
		super();
		DEPARTURETERMINAL = dEPARTURETERMINAL;
		ARRIVALTERMINAL = aRRIVALTERMINAL;
		DEPARTUREDATA = dEPARTUREDATA;
	}
	
	
	
}
