package DAO;

import java.util.*;

public class FROMTODAO {
	private String  departureTerminal= null;
	private List<TERMINALREQUIREDTIME> arrivalTerminalLIST = null;
	public String getDepartureTerminal() {
		return departureTerminal;
	}
	public void setDepartureTerminal(String departureTerminal) {
		this.departureTerminal = departureTerminal;
	}
	public List<TERMINALREQUIREDTIME> getArrivalTerminalLIST() {
		return arrivalTerminalLIST;
	}
	public void setArrivalTerminalLIST(List<TERMINALREQUIREDTIME> arrivalTerminalLIST) {
		this.arrivalTerminalLIST = arrivalTerminalLIST;
	}
	public FROMTODAO(String departureTerminal, List<TERMINALREQUIREDTIME> arrivalTerminalLIST) {
		super();
		this.departureTerminal = departureTerminal;
		this.arrivalTerminalLIST = arrivalTerminalLIST;
	}
}