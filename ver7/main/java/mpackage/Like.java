package mpackage;

import java.sql.*;

public class Like {
	public static final String URL = "jdbc:oracle:thin:@localhost:1521:orcl";
	public static final String USER_UNIVERSITY ="university";
	public static final String USER_PASSWD ="comp322";
	public static Connection conn = null;
	public static Statement stmt = null;
	
	String ID = "second";
	String PW = "4321";
	int a = 1;
	
	public Like() {}
	
	public int isExist(int a_id, String ac_id) {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver"); 
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		try{
			conn = DriverManager.getConnection(URL, USER_UNIVERSITY, USER_PASSWD);
			conn.setAutoCommit(false); 
			stmt = conn.createStatement();
		}catch(SQLException ex) {
			ex.printStackTrace();
		}
		
		String sql = "SELECT W.favorite "
				   + "FROM WATCHING W "
				   + "WHERE W.a_id = " + String.valueOf(a_id) + " AND W.ac_id = '" + ac_id + "'";
		
		try {
			ResultSet rs = stmt.executeQuery(sql);
			
			if  (rs.next()) {
				if (rs.getInt(1) == 1) {
					rs.close();
					stmt.close();
					conn.close();
					return 1;
				}
				else if (rs.getInt(1) == 0) {
					rs.close();
					stmt.close();
					conn.close();
					return 0;
				}
			}
			else {
				sql = "INSERT INTO WATCHING VALUES (" + String.valueOf(a_id) + ", '" + ac_id + "', 0)";
				int i = stmt.executeUpdate(sql);
				
				if (i == 1)
					System.out.println("Success");
				
				stmt.close();
				conn.close();
			}
			
		}catch (SQLException ex2) {
			ex2.printStackTrace();
		}
		return 0;
	}
	
	public void change(int a_id, String ac_id) {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver"); 
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		try{
			conn = DriverManager.getConnection(URL, USER_UNIVERSITY, USER_PASSWD);
			conn.setAutoCommit(false); 
			stmt = conn.createStatement();
		}catch(SQLException ex) {
			ex.printStackTrace();
		}
		
		String sql = "SELECT W.favorite "
				   + "FROM WATCHING W "
				   + "WHERE W.a_id = " + String.valueOf(a_id) + " AND W.ac_id = '" + ac_id + "'";
		
		try {
			ResultSet rs = stmt.executeQuery(sql);
			
			if  (rs.next()) {
				if (rs.getInt(1) == 1) {
					sql = "UPDATE WATCHING W "
						+ "SET W.favorite = 0 "
						+ "WHERE W.a_id = " + String.valueOf(a_id) + " AND W.ac_id = '" + ac_id + "'";
					
					int i = stmt.executeUpdate(sql);
				}
				else if (rs.getInt(1) == 0) {
					sql = "UPDATE WATCHING W "
							+ "SET W.favorite = 1 "
							+ "WHERE W.a_id = " + String.valueOf(a_id) + " AND W.ac_id = '" + ac_id + "'";
						
					int i = stmt.executeUpdate(sql);
				}
			}
			rs.close();
			stmt.close();
			conn.close();
		}catch (SQLException ex2) {
			ex2.printStackTrace();
		}

	}
}
