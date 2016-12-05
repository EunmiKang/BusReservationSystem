package DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.*;

public class HOSTDAO {
	private String HOSTID = null;
	private String HOSTPW = null;
	public String getHOSTID() {
		return HOSTID;
	}

	public void setHOSTID(String hOSTID) {
		HOSTID = hOSTID;
	}
	public String getHOSTPW() {
		return HOSTPW;
	}

	public void setHOSTPW(String hOSTPW) {
		HOSTPW = hOSTPW;
	}

	public HOSTDAO(String hOSTID, String hOSTPW) {
		super();
		HOSTID = hOSTID;
		HOSTPW = hOSTPW;
	}
	
	public List<SCHEDULEINFO> loadSchedule(){
		Connection conn = null;
		ResultSet rs = null;
		SCHEDULEINFO SINFO = null;
		DAO dao = new DAO();
		dao.createConn();
		conn = dao.getConn();	
		List<SCHEDULEINFO> SINFOLIST = new ArrayList<>();
		
		try {
			rs = dao.select(conn, "SELECT * FROM SCHEDULE_INFO");
			
			while(rs.next()!=false){
				SINFO = new SCHEDULEINFO(
											rs.getString("SCHEDULE_NO"),
											rs.getString("DEPARTURE_TERMINAL"),
											rs.getString("ARRIVAL_TERMINAL"),
											rs.getString("BUS_NO"),
											rs.getString("DEPARTURE_TIME"),
											rs.getString("REMAINING_SEATS_NUM"),
											rs.getString("PRICE"),
											rs.getString("REQUIRED_TIME")
										); 
				SINFOLIST.add(SINFO);
			}
			return SINFOLIST;
		} catch (Exception e) {
			System.out.println("[*]	JOIN SELECT error: \n" + e.getMessage());
		}
		return null;
	}
	
	public String showSchedule(SCHEDULEINFO SINFO){
		String INFO = null;
		try{
			INFO = SINFO.getFK_departureTerminal()
					+":"+SINFO.getFK_arrivalTerminal()
					+":"+SINFO.getDepartureTime()
					+":"+SINFO.getRequiredTime()
					+":"+SINFO.returnBusClass(SINFO.getFK_busNo()
							+":"+SINFO.getPrice()
							);
			if(INFO!=null){
				return INFO;
			}
		}catch(Exception e){
			System.out.println("[*]	SHOWSCHEDULE error: \n" + e.getMessage());
		}
		return null;
	}
	
	
	public boolean addSchedule(){
		Connection conn = null;
		ResultSet rs = null;
		
		DAO dao = new DAO();
		dao.createConn();
		conn = dao.getConn();	
		
		try {
			
			/*	dao.insert(conn, "INSERT INTO "
						+ "MEMBER(M_ID,M_PW,M_NAME,M_PHONENUM,M_TOTALPOINT,M_CURRENTPOINT)"
						+ " VALUES('"+USERID+"','"+USERPW+"','"+USERNAME+"','"+USERPHONENUM+"',0,0)");
	*/
				return true;
			
		} catch (Exception e) {
			System.out.println("[*]	JOIN SELECT error: \n" + e.getMessage());
		}
		return false;
	}
}
