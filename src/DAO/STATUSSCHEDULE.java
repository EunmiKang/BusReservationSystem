package DAO;

import java.util.List;

public class STATUSSCHEDULE {
	private SCHEDULEINFO SINFO = null;
	private List<Character> SEAT;

	public SCHEDULEINFO getSINFO() {
		return SINFO;
	}

	public void setSINFO(SCHEDULEINFO sINFO) {
		SINFO = sINFO;
	}

	public List<Character> getSEAT() {
		return SEAT;
	}

	public void setSEAT(List<Character> sEAT) {
		SEAT = sEAT;
	}

	public STATUSSCHEDULE(SCHEDULEINFO sINFO, List<Character> sEAT) {
		super();
		SINFO = sINFO;
		SEAT = sEAT;
	}
}
