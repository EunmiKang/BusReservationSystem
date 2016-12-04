package DAO;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

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

	public boolean updateBranch(Connection conn, String branch_number, int asset) {
		try {
			PreparedStatement pstmt = conn.prepareStatement("UPDATE BRANCH SET ASSETS = ? WHERE BRANCH_NUMBER = ?");

			pstmt.setInt(1, asset);
			pstmt.setString(2, branch_number);

			int rowCount = pstmt.executeUpdate();
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
}
