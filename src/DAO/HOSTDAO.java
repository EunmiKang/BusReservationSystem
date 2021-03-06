package DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
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

	public List<SCHEDULEINFO> loadSchedule() {
		Connection conn = null;
		ResultSet rs = null;
		SCHEDULEINFO SINFO = null;
		DAO dao = new DAO();
		dao.createConn();
		conn = dao.getConn();
		List<SCHEDULEINFO> SINFOLIST = new ArrayList<>();

		try {
			rs = dao.select(conn, "SELECT * FROM SCHEDULE_INFO ORDER BY DEPARTURE_TIME");

			while (rs.next() != false) {
				SINFO = new SCHEDULEINFO(rs.getString("SCHEDULE_NO"), rs.getString("DEPARTURE_TERMINAL"),
						rs.getString("ARRIVAL_TERMINAL"), rs.getString("BUS_NO"), rs.getString("DEPARTURE_TIME"),
						rs.getString("PRICE"), rs.getString("REQUIRED_TIME"));
				SINFOLIST.add(SINFO);
			}
			dao.cancel();
			return SINFOLIST;
		} catch (Exception e) {
			System.out.println("[*]	JOIN SELECT error: \n" + e.getMessage());
		}
		dao.cancel();
		return null;
	}

	public String showSchedule(SCHEDULEINFO SINFO) {
		String INFO = null;
		try {
			INFO = SINFO.getFK_departureTerminal() + " " + SINFO.getFK_arrivalTerminal() + " "
					+ SINFO.getDepartureTime() + " " + SINFO.getRequiredTime() + " "
					+ SINFO.returnBusClass(SINFO.getFK_busNo()) + " " + SINFO.getPrice();
			if (INFO != null) {
				return INFO;
			}
		} catch (Exception e) {
			System.out.println("[*]	SHOWSCHEDULE error: \n" + e.getMessage());
		}
		return null;
	}
	
	public String showTerminalList(TERMINALDAO TDAO) {
		String INFO = null;
		String tClass = null;
		String className = "";
		try {
			
			tClass = TDAO.getBusClass();
			if(tClass.charAt(0) == '1')
				className += "일반 ";
			if(tClass.charAt(1) == '1')
				className += "우등 ";
			if(tClass.charAt(2) == '1')
				className += "프리미엄 ";
			
			INFO = TDAO.getTerminalName() + ":" + TDAO.getAddress() + ":" +
					TDAO.getTeleNum() +":"+ className;
			
			if (INFO != null) {
				return INFO;
			}
		} catch (Exception e) {
			System.out.println("[*]	SHOWSCHEDULE error: \n" + e.getMessage());
		}
		return null;
	}

	public boolean findDepartureTerminal() {
		Connection conn = null;
		ResultSet rs = null;

		DAO dao = new DAO();
		dao.createConn();
		conn = dao.getConn();
		try {
			rs = dao.select(conn, "SELECT TERMINALNAME FROM TERMINAL");
			dao.cancel();
			return true;

		} catch (Exception e) {
			System.out.println("[*]	JOIN SELECT error: \n" + e.getMessage());
		}
		dao.cancel();
		return false;
	}
	
	public List<FROMTODAO> loadDepartureTerminal(){
		Connection conn = null;
		String temp;
		ResultSet rs = null;
		ResultSet rs2 = null;
		DAO dao = new DAO();
		dao.createConn();
		conn = dao.getConn();
		List<FROMTODAO> FTList = new ArrayList<>();
		List<String> terminalName = new ArrayList<>();
		List<TERMINALREQUIREDTIME> terminalRequiredTimeList = new ArrayList<>();
		try {
			rs = dao.select(conn, "SELECT TERMINALNAME FROM TERMINAL");

			while (rs.next() != false) {
				temp = rs.getString("TERMINALNAME");
				terminalName.add(temp);
				terminalRequiredTimeList = new ArrayList<>();
				rs2 = dao.select(conn, "SELECT * FROM FROM_TO WHERE DEPARTURE_TERMINAL = \'"+temp+"\'");
				while(rs2.next()!=false){
					terminalRequiredTimeList.add(
							new TERMINALREQUIREDTIME(rs2.getString("ARRIVAL_TERMINAL"),rs2.getString("REQUIRED_TIME"),rs2.getString("PRICE")));
					
				}
				FTList.add(new FROMTODAO(temp, terminalRequiredTimeList));
			}
			dao.cancel();
			return FTList;
		} catch (Exception e) {
			System.out.println("[*]	JOIN SELECT error: \n" + e.getMessage());
		}
		dao.cancel();
		return null;
	}
	
	public List<TERMINALDAO> loadTerminal(){
		Connection conn = null;
		ResultSet rs = null;
		TERMINALDAO terminal = null;
		DAO dao = new DAO();
		dao.createConn();
		conn = dao.getConn();
		List<TERMINALDAO> resultList = new ArrayList<>();
		try {
			rs = dao.select(conn, "SELECT * FROM TERMINAL");

			while (rs.next() != false) {
				terminal = new TERMINALDAO(rs.getString("TERMINALNAME"), rs.getString("ADDRESS"),
						rs.getString("TELENUM"), rs.getString("BUSCLASS"));
				resultList.add(terminal);
			}
			dao.cancel();
			return resultList;
		} catch (Exception e) {
			System.out.println("[*] loadTerminal SELECT error: \n" + e.getMessage());
		}
		dao.cancel();
		return null;
	}
	
	public String returnBusNo(String busClass){
		if(busClass.equals("일반"))
			return "1";
		else if(busClass.equals("우등"))
			return "2";
		else return "4";

	}
	

	public String returnNameOfBusClass(String busClass){
		if(busClass.equals("100"))
			return "일반";
		else if(busClass.equals("010"))
			return "우등";
		else
			return "프리미엄";
	}
	
	public boolean insertSchedule(SCHEDULEINFO SINFO){
		Connection conn = null;
		ResultSet rs = null;
		
		DAO dao = new DAO();
		dao.createConn();
		conn = dao.getConn();	
		String price="";
		float tempPrice;
		
		try {
			rs = dao.select(conn, "SELECT * FROM SCHEDULE_INFO "
					+ "WHERE DEPARTURE_TERMINAL = '"+SINFO.getFK_departureTerminal()
					+"' AND ARRIVAL_TERMINAL = '"+SINFO.getFK_arrivalTerminal()
					+"' AND DEPARTURE_TIME = '"+SINFO.getDepartureTime()+"'");
			if(!SINFO.getFK_arrivalTerminal().equals("선택")&&!SINFO.getFK_arrivalTerminal().equals("null"))
			{
				price = SINFO.getPrice();
				
				if(rs.next()==false){
					
					if(SINFO.getFK_busNo().equals("2")){
						float test = Float.parseFloat(price);
						tempPrice = test * (float)1.2;
						price = Integer.toString((int)tempPrice);
					}else if(SINFO.getFK_busNo().equals("4")){
						float test = Float.parseFloat(price);
						tempPrice = test * (float)1.4;
						price = Integer.toString((int)tempPrice);
					}
					
					if(dao.insert(conn, "INSERT INTO "
							+"SCHEDULE_INFO(SCHEDULE_NO, DEPARTURE_TERMINAL, ARRIVAL_TERMINAL, BUS_NO, DEPARTURE_TIME, PRICE, REQUIRED_TIME) "
							+"VALUES(SCHEDULE_NO.NEXTVAL,'"+SINFO.getFK_departureTerminal()+"','"+SINFO.getFK_arrivalTerminal()+"',"+SINFO.getFK_busNo()
							+",'"+SINFO.getDepartureTime()+"','"+price+"','"+SINFO.getRequiredTime()+"')"))
					{
						
						/*
						 * RESERVATIONSTATUS 객체를 만들어서 넣자
						 */
						for(int i=0; i<7; i++){
						dao.insert(conn, "INSERT INTO RESERVATION_STATUS_TABLE(SCHEDULE_NO, DEPARTURE_DATE, SEAT_INFO, REMAINING_SEATS_NUM) "
								+ "VALUES(SCHEDULE_NO.CURRVAL,'"+getToday(i)+"','"+getSeatInfo(SINFO.getFK_busNo())+"',"+getSeatNumtoBusNo(SINFO.getFK_busNo())+")");
						}
						dao.cancel();
							return true;
					}
				}
			}
			else{
				dao.cancel();
				return false;
			}
		} catch (Exception e) {
			System.out.println("[*]	insertSchedule INSERT error: \n" + e.getMessage());
		}
		dao.cancel();
		return false;
	}
	
	public String getToday(int day){
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy-MM-dd", Locale.KOREA );
	      Date currentTime = new Date ( );
	      Date tmTime = new Date();
	      tmTime.setTime(currentTime.getTime() + (1000*60*60*24)*day);
	      String mTime = mSimpleDateFormat.format ( tmTime );
	      return mTime;
	}
	
	public String getSeatInfo(String BusNo){
		String seatInfo="";
		if(BusNo.equals("1"))
			seatInfo = 	"0000000"+
						"0000000"+
						"0000000"+
						"0000000";
		
		else if(BusNo.equals("2"))
			seatInfo = 	"0000000"+
						"0000000"+
						"0000000";
		
		else
			seatInfo = 	"0000000"+
						"0000000";
		return seatInfo;
	}
	
	public int getSeatNumtoBusNo(String BusNo){
		int seatNo = 0;
		if(BusNo.equals("1"))
			seatNo = 28;
		else if(BusNo.equals("2"))
			seatNo = 21;
		else
			seatNo = 14;
		return seatNo;
	}
	
	public boolean deleteSchedule(String departure, String arrival, String departureTime){
		Connection conn = null;
		ResultSet rs = null;
		
		DAO dao = new DAO();
		dao.createConn();
		conn = dao.getConn();	
		
		try {
			if(dao.delete(conn, "DELETE FROM SCHEDULE_INFO "
					+ "WHERE DEPARTURE_TERMINAL = '"+departure
					+"' AND ARRIVAL_TERMINAL = '"+arrival
					+"' AND DEPARTURE_TIME = '"+departureTime+"'")){
				dao.cancel();
				return true;
			}
			else
				dao.cancel();
				return false;
		} catch (Exception e) {
			System.out.println("[*]	insertSchedule INSERT error: \n" + e.getMessage());
		}
		dao.cancel();
		return false;
	}
	

	public List<String> getVIPMembers(){
		Connection conn = null;
		List<String> members = new ArrayList<>();
		DAO dao = new DAO();
		ResultSet rs = null;
		dao.createConn();
		conn = dao.getConn();
		try {
			rs = dao.select(conn, "SELECT * FROM MEMBER WHERE M_ID <> 'ADMIN' ORDER BY M_TOTALPOINT DESC");
			for(int i=0; rs.next()!=false && i<10; i++)
			{
				members.add(rs.getString("M_ID")+" : "+ rs.getString("M_TOTALPOINT"));
			}
			
		} catch (Exception e) {
			System.out.println("[*]	JOIN SELECT error: \n" + e.getMessage());
		}
		dao.cancel();
		return members;
	}
	
	public boolean addBusClass(String terminal, int busClassIndex){
		Connection conn = null;
		ResultSet rs = null;
		
		DAO dao = new DAO();
		dao.createConn();
		conn = dao.getConn();
		try {
			rs = dao.select(conn, "SELECT * FROM TERMINAL WHERE TERMINALNAME = '" + terminal + "'");
			if(rs.next() != false) {
				String terminalBusClass = rs.getString("BUSCLASS");
				if(terminalBusClass.charAt(busClassIndex) == '0'){	//add
					String changeValue = "";
					for(int i=0; i<3; i++) {
						if(i==busClassIndex) {
							changeValue += "1";
						}
						else {
							changeValue += terminalBusClass.charAt(i);
						}
					}
					dao.updateBranch(conn, "TERMINAL", "BUSCLASS", changeValue , "TERMINALNAME = '" + terminal + "'");
					dao.cancel();
					return true;
				}
				else{
					dao.cancel();					
					return false;
				}
			}
		} catch (Exception e) {
			System.out.println("[*]	addBusClass UPDATE error: \n" + e.getMessage());
		}
		dao.cancel();
		return false;
	}
	
	public boolean deleteBusClass(String terminal, int busClassIndex){
		Connection conn = null;
		ResultSet rs = null;
		
		DAO dao = new DAO();
		dao.createConn();
		conn = dao.getConn();
		try {
			rs = dao.select(conn, "SELECT * FROM TERMINAL WHERE TERMINALNAME = '" + terminal + "'");
			if(rs.next() != false) {
				String terminalBusClass = rs.getString("BUSCLASS");
				if(terminalBusClass.charAt(busClassIndex) == '1'){	//delete
					String changeValue = "";
					for(int i=0; i<3; i++) {
						if(i==busClassIndex) {
							changeValue += "0";
						}
						else {
							changeValue += terminalBusClass.charAt(i);
						}
					}
					dao.updateBranch(conn, "TERMINAL", "BUSCLASS", changeValue , "TERMINALNAME = '" + terminal + "'");
					dao.cancel();
					return true;
				}
				else
					dao.cancel();
					return false;
			}
		} catch (Exception e) {
			System.out.println("[*]	deleteBusClass UPDATE error: \n" + e.getMessage());
		}
		dao.cancel();
		return false;
	}
	
	public boolean changeTerminalClass(String terminal, String changeaddress, String changephone){
		Connection conn = null;
		ResultSet rs = null;
		
		DAO dao = new DAO();
		dao.createConn();
		conn = dao.getConn();
		try{
			if(
				dao.updateBranch(conn, "TERMINAL", "ADDRESS", changeaddress , "TERMINALNAME = '" + terminal + "'")
				&&	
				dao.updateBranch(conn, "TERMINAL", "TELENUM", changephone , "TERMINALNAME = '" + terminal + "'")
			){
				dao.cancel();
				return true;
			}
			else {
				dao.cancel();
				return false;
			}
		}catch(Exception e) {
			System.out.println("[*]	deleteBusClass UPDATE error: \n" + e.getMessage());
		}
		dao.cancel();
		return false;
	}
	
	public boolean deleteTerminal(String terminal){
		Connection conn = null;
				
		DAO dao = new DAO();
		dao.createConn();
		conn = dao.getConn();
		try {
			if(dao.delete(conn, "DELETE FROM TERMINAL WHERE TERMINALNAME = '" + terminal + "'")){
				dao.cancel();
				return true;
			}else{
				dao.cancel();				
				return false;
			}
		} catch (Exception e) {
			System.out.println("[*]	deleteBusClass DELETE error: \n" + e.getMessage());
		}
		dao.cancel();
		return false;
	}

	public boolean insertTerminal(String terminalName, String terminalAddress, String terminalPhone){
		Connection conn = null;
		ResultSet rs = null;
		
		DAO dao = new DAO();
		dao.createConn();
		conn = dao.getConn();
		try {
			if(dao.insert(conn, "INSERT INTO TERMINAL(TERMINALNAME, ADDRESS, TELENUM, BUSCLASS)"
					+ " VALUES('"+terminalName+"','"+terminalAddress+"','"+terminalPhone+"','100')")){
				dao.cancel();				
				return true;
			}
			else{
				dao.cancel();
				return false;
			}
		}catch(Exception e){
			System.out.println("[*]	insertTerminal INSERT error: \n" + e.getMessage());
		}
		dao.cancel();
		return false;
	}
	
}
