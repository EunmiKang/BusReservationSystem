package DAO;

public class FROMTODAO {
	private String arrivalTerminal = null;
	private String departureTerminal = null;
	public String getArrivalTerminal() {
		return arrivalTerminal;
	}
	public void setArrivalTerminal(String arrivalTerminal) {
		this.arrivalTerminal = arrivalTerminal;
	}
	public String getDepartureTerminal() {
		return departureTerminal;
	}
	public void setDepartureTerminal(String departureTerminal) {
		this.departureTerminal = departureTerminal;
	}
	public FROMTODAO(String arrivalTerminal, String departureTerminal) {
		super();
		this.arrivalTerminal = arrivalTerminal;
		this.departureTerminal = departureTerminal;
	}
	
}
