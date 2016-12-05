package DAO;

import java.beans.Statement;
import java.sql.*;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

public class USERDAO {
	private String USERID = null;
	private String USERPW = null;
	private String USERPHONENUM = null;
	private String USERNAME = null;
	private String USERTOTAL_POINT = null;
	private String USERCURRENT_POINT = null;

	public USERDAO(String USERID, String USERPW, String USERNAME, String USERPHONENUM, String USERTOTAL_POINT,
			String USERCURRENT_POINT) {
		super();
		this.USERID = USERID;
		this.USERPW = USERPW;
		this.USERPHONENUM = USERPHONENUM;
		this.USERNAME = USERNAME;
		this.USERTOTAL_POINT = USERTOTAL_POINT;
		this.USERCURRENT_POINT = USERCURRENT_POINT;
	}
	
	public USERDAO(String USERID, String USERPW) {
		super();
		this.USERID = USERID;
		this.USERPW = USERPW;
	}

	public String getUSERID() {
		return USERID;
	}

	public void setUSERID(String uSERID) {
		USERID = uSERID;
	}

	public String getUSERPW() {
		return USERPW;
	}

	public void setUSERPW(String uSERPW) {
		USERPW = uSERPW;
	}

	public String getUSERPHONENUM() {
		return USERPHONENUM;
	}

	public void setUSERPHONENUM(String uSERPHONENUM) {
		USERPHONENUM = uSERPHONENUM;
	}

	public String getUSERNAME() {
		return USERNAME;
	}

	public void setUSERNAME(String uSERNAME) {
		USERNAME = uSERNAME;
	}

	public String getUSERTOTAL_POINT() {
		return USERTOTAL_POINT;
	}

	public void setUSERTOTAL_POINT(String uSERTOTAL_POINT) {
		USERTOTAL_POINT = uSERTOTAL_POINT;
	}

	public String getUSERCURRENT_POINT() {
		return USERCURRENT_POINT;
	}

	public void setUSERCURRENT_POINT(String uSERCURRENT_POINT) {
		USERCURRENT_POINT = uSERCURRENT_POINT;
	}

	public String updateSeat(String seat, int seatNum, String info) {
		StringBuffer SB_seat = new StringBuffer(seat);
		SB_seat.replace(seatNum, seatNum + 1, info);
		return SB_seat.toString();
	}

	public boolean userJoin() {
		
		Connection conn = null;
		ResultSet rs = null;
		
		DAO dao = new DAO();
		dao.createConn();
		conn = dao.getConn();	
		
		try {
			rs = dao.select(conn, "SELECT M_ID FROM MEMBER WHERE M_ID = \'"+USERID+"\'");
			if(rs.next()==true)
			{
				return false;
			}
			else{
				System.out.println("INSERT INTO MEMBER VALUES("+USERID+","+USERPW+","
						+USERNAME+","+USERPHONENUM
						+",0,0)");
				try{
				dao.insert(conn, "INSERT INTO "
						+ "MEMBER(M_ID,M_PW,M_NAME,M_PHONENUM,M_TOTALPOINT,M_CURRENTPOINT)"
						+ " VALUES('"+USERID+"','"+USERPW+"','"+USERNAME+"','"+USERPHONENUM+"',0,0)");
	
				}catch(Exception e){
					System.out.println("[*]	JOIN INSERT error: \n" + e.getMessage());
				}
				return true;
			}
		} catch (Exception e) {
			System.out.println("[*]	JOIN SELECT error: \n" + e.getMessage());
		}
		return false;
	}
	
	public int userLogin()
	{
		Connection conn = null;
		ResultSet rs = null;
		DAO dao = new DAO();
		dao.createConn();
		conn = dao.getConn();	
		
		try{
			rs = dao.select(conn, "SELECT M_ID,M_PW FROM MEMBER WHERE M_ID = \'"+USERID+"\'");
			if(rs.next()==false)
			{
				return 0;//ID가 존재하지 않을 때
			}else
			{
				if(rs.getString("M_PW").equals(USERPW)){
					if(rs.getString("M_ID").equals("ADMIN"))
						return 3;//관리자일떄
					return 1;//login!
				}
				else
					return 2;//PW 틀렸을 때
			}
		}catch(Exception e){
			System.out.println("[*] LOGIN SELECT result error: \n" + e.getMessage());
		}
		
		return 1;	
	}
	
	public String selectUserInfo(){
		String userInfo=null;
		Connection conn = null;
		ResultSet rs = null;
		DAO dao = new DAO();
		dao.createConn();
		conn = dao.getConn();
		try{
			rs = dao.select(conn, "SELECT * FROM MEMBER WHERE M_ID = \'"+USERID+"\'");
			if(rs.next()==true){
				userInfo = rs.getString("M_ID")+":"+rs.getString("M_PW")+":"+rs.getString("M_NAME")
					+":"+rs.getString("M_PHONENUM")+":"+rs.getString("M_CURRENTPOINT");
			}
		}catch(Exception e){
			System.out.println("[*] SELECTUSERINFO SELECT error: \n" + e.getMessage());
		}
		return userInfo;
	}
	
	public boolean deactivateAccount(){
		String userInfo=null;
		Connection conn = null;
		boolean rs = false;
		DAO dao = new DAO();
		dao.createConn();
		conn = dao.getConn();
		try{
			rs = dao.delete(conn, "DELETE FROM MEMBER WHERE M_ID = \'"+USERID+"\'");
			if(rs == true)
				return true;
			else
				return false;
		}catch(Exception e){
			System.out.println("[*]	DEACTIVATEACCOUNT DELETE error: \n" + e.getMessage());
		}
		return false;
	}
	
	public boolean changeUserSetting(String changePW, String changePhoneNum){
		String userInfo=null;
		Connection conn = null;
		ResultSet rs = null;
		DAO dao = new DAO();
		dao.createConn();
		conn = dao.getConn();
		try{
			//rs = dao.select(conn, "SELECT * FROM MEMBER WHERE M_ID = \'"+USERID+"\'");
			//Connection conn, String table, String col, String changevalue, String condition
			dao.updateBranch(conn, "MEMBER", "M_PW", changePW, "M_ID = \'"+USERID+"\'");
			dao.updateBranch(conn, "MEMBER", "M_PHONENUM", changePhoneNum, "M_ID = \'"+USERID+"\'");
			return true;
		}catch(Exception e){
			System.out.println("[*] changeUserSetting CHANGE error: \n" + e.getMessage());
		}
		return false;
	}
}
