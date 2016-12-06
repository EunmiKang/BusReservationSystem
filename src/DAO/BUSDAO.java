package DAO;

import java.sql.Connection;
import java.sql.ResultSet;

public class BUSDAO {
	private String busNo;
	private String diver;
	private String busClass;
	public String getBusNo() {
		return busNo;
	}
	public void setBusNo(String busNo) {
		this.busNo = busNo;
	}
	public String getDiver() {
		return diver;
	}
	public void setDiver(String diver) {
		this.diver = diver;
	}
	public String getBusClass() {
		return busClass;
	}
	public void setBusClass(String busClass) {
		this.busClass = busClass;
	}
	public BUSDAO(String busNo, String diver, String busClass) {
		super();
		this.busNo = busNo;
		this.diver = diver;
		this.busClass = busClass;
	}
	
}
