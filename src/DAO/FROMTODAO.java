package DAO;

import java.util.*;

public class FROMTODAO {
	private String  departureTerminal= null;
	private List<String> arrivalTerminal = null;
	public String getDepartureTerminal() {
		return departureTerminal;
	}
	public void setDepartureTerminal(String departureTerminal) {
		this.departureTerminal = departureTerminal;
	}
	public List<String> getArrivalTerminal() {
		return arrivalTerminal;
	}
	public void setArrivalTerminal(List<String> arrivalTerminal) {
		this.arrivalTerminal = arrivalTerminal;
	}
	public FROMTODAO(String departureTerminal, List<String> arrivalTerminal) {
		super();
		this.departureTerminal = departureTerminal;
		this.arrivalTerminal = arrivalTerminal;
	}
	
	
	
}
