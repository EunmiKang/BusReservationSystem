package DAO;

import java.sql.Connection;
import java.sql.ResultSet;

public class SCHEDULEINFO {
	private String scheduleNo;
	private String FK_departureTerminal;
	private String FK_arrivalTerminal;
	private String FK_busNo;
	private String departureTime;
	private String price;
	private String requiredTime;
	
	public String getScheduleNo() {
		return scheduleNo;
	}
	public void setScheduleNo(String scheduleNo) {
		this.scheduleNo = scheduleNo;
	}
	public String getFK_arrivalTerminal() {
		return FK_arrivalTerminal;
	}
	public void setFK_arrivalTerminal(String fK_arrivalTerminal) {
		FK_arrivalTerminal = fK_arrivalTerminal;
	}
	public String getFK_departureTerminal() {
		return FK_departureTerminal;
	}
	public void setFK_departureTerminal(String fK_departureTerminal) {
		FK_departureTerminal = fK_departureTerminal;
	}
	public String getFK_busNo() {
		return FK_busNo;
	}
	public void setFK_busNo(String fK_busNo) {
		FK_busNo = fK_busNo;
	}
	public String getDepartureTime() {
		return departureTime;
	}
	public void setDepartureTime(String departureTime) {
		this.departureTime = departureTime;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getRequiredTime() {
		return requiredTime;
	}
	public void setRequiredTime(String requiredTime) {
		this.requiredTime = requiredTime;
	}
	
	public SCHEDULEINFO(String scheduleNo, 
						String fK_departureTerminal, 
						String fK_arrivalTerminal, 
						String fk_busNo,
						String departureTime, 
						String price, 
						String requiredTime) {
		super();
		this.scheduleNo = scheduleNo;
		this.FK_departureTerminal = fK_departureTerminal;
		this.FK_arrivalTerminal = fK_arrivalTerminal;
		this.FK_busNo = fk_busNo;
		this.departureTime = departureTime;
		this.price = price;
		this.requiredTime = requiredTime;
	}
	
	public String returnBusClass(String busNo){
	      Connection conn = null;
	      ResultSet rs = null;
	      
	      DAO dao = new DAO();
	      dao.createConn();
	      conn = dao.getConn();   
	      
	      try {
	         rs = dao.select(conn, "SELECT BUSCLASS FROM BUS WHERE BUSNO = " + busNo);
	         rs.next();
	         String returnBusClass = rs.getString("BUSCLASS");
	         dao.cancel();
	         return returnBusClass;
	      } catch (Exception e) {
	         System.out.println("[*]   returnBusClass SELECT error: \n" + e.getMessage());
	      }
	      dao.cancel();
	      return null;
	   }
}
