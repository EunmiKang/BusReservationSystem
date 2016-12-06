package DAO;

import java.util.List;

import DAO.*;

public class RESERVATIONSTATUS {
	private String STATUSDATA = null;
	private List<STATUSSCHEDULE> STATUSLIST = null;

	public RESERVATIONSTATUS(String sTATUSDATA, List<STATUSSCHEDULE> sTATUSLIST) {
		super();
		STATUSDATA = sTATUSDATA;
		STATUSLIST = sTATUSLIST;
	}

	public String getSTATUSDATA() {
		return STATUSDATA;
	}

	public void setSTATUSDATA(String sTATUSDATA) {
		STATUSDATA = sTATUSDATA;
	}

	public List<STATUSSCHEDULE> getSTATUSLIST() {
		return STATUSLIST;
	}

	public void setSTATUSLIST(List<STATUSSCHEDULE> sTATUSLIST) {
		STATUSLIST = sTATUSLIST;
	}
}
