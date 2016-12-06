package DAO;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DAO {

	private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static final String URL = "jdbc:oracle:thin:@168.188.128.130:1521:DB14";
	private static final String USER = "DBJS";
	private static final String PASS = "DBSERVER";

	private static Connection conn = null;
	private static DatabaseMetaData meta = null;

	public boolean createConn() {
		System.out.println("This is USER PAGE");
		try {
			Class.forName(DRIVER);
			System.out.println("[*]	JDBC load success.");
			conn = DriverManager.getConnection(URL, USER, PASS);
			System.out.println("[*]	Database join success.");
		} catch (Exception e) {
			System.out.println("[*]	Database join error: \n" + e.getMessage());
			return false;
		}

		return true;
	}

	public Connection getConn() {
		return conn;
	}

	public boolean insert(Connection conn, String query) {
		try {
			Statement stmt = conn.createStatement();
			int rowCount = stmt.executeUpdate(query);
			if (rowCount == 0) {
				System.out.println("insert data fail");
				return false;
			} else {
				System.out.println("insert data success");
			}
		} catch (Exception e) {
			System.out.println("[*]	INSERT data fail: \n" + e.getMessage());
		}

		return true;
	}

	public ResultSet select(Connection conn, String query) {
		Statement stmt = null;
		ResultSet rs = null;
		ResultSetMetaData rsMeta = null;

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			rsMeta = rs.getMetaData();
			
			for (int col = 1; col <= rsMeta.getColumnCount(); col++) {
				int type = rsMeta.getColumnType(col);
				String typeName = rsMeta.getColumnTypeName(col);
				String name = rsMeta.getColumnName(col);
				//System.out.println(col + "st column " + name + " is JDBC type " + type + " which is called " + typeName);
			}

			// 질의 결과 반환
			return rs;
		} catch (Exception e) {
			System.out.println("[*]	SELECT error: \n" + e.getMessage());
		}

		return rs;
	}

	public boolean updateBranch(Connection conn, String table, String col, String changevalue, String condition) {
		try {
			Statement stmt = conn.createStatement();
			int rowCount = stmt.executeUpdate("UPDATE "+table 
					+" SET "+col +" = \'"+changevalue
					+"\' WHERE "+condition);
		
			if (rowCount == 0) {
				System.out.println("data modify fail");
			} else {
				System.out.println("data modify success");
			}
		} catch (Exception e) {
			System.out.println("[*]	UPDATE modify fail: \n" + e.getMessage());
		}

		return true;
	}

	public boolean delete(Connection conn, String query) {
		try {
			Statement stmt = conn.createStatement();
			int rowCount = stmt.executeUpdate(query);
			if (rowCount == 0) {
				System.out.println("data delete fail");
				return false;
			} else {
				System.out.println("data delete success");
			}
		} catch (Exception e) {
			System.out.println("[*]	DELETE error: \n" + e.getMessage());
		}

		return true;
	}

	public DatabaseMetaData getDBMD(Connection conn) {
		try {
			meta = conn.getMetaData();
		} catch (Exception e) {
			System.out.println("[*]	DBMD error: \n" + e.getMessage());
		}

		return meta;
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
							new TERMINALREQUIREDTIME(rs2.getString("ARRIVAL_TERMINAL"),rs2.getString("REQUIRED_TIME")));
					
				}
				FTList.add(new FROMTODAO(temp, terminalRequiredTimeList));
			}
			return FTList;
		} catch (Exception e) {
			System.out.println("[*]	JOIN SELECT error: \n" + e.getMessage());
		}
		return null;
	}
}
