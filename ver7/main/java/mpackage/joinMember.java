package mpackage;
import java.sql.*;


public class joinMember {
	
	public static final String URL = "jdbc:oracle:thin:@localhost:1521:orcl";
	public static final String USER_UNIVERSITY ="university";
	public static final String USER_PASSWD ="comp322";
	public static Connection conn = null;
	public static Statement stmt = null;
	public static PreparedStatement pstmt = null;
	
	
	public joinMember() {
		try { // Driver loading
			Class.forName("oracle.jdbc.driver.OracleDriver"); 
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		try{ // Get connection
			conn = DriverManager.getConnection(URL, USER_UNIVERSITY, USER_PASSWD);
			conn.setAutoCommit(false); 
			stmt = conn.createStatement();
		}catch(SQLException ex) {
			ex.printStackTrace();
			
		}
		
	}
	
public int checkID(String ID) {
		
		String sql= "SELECT id "
				+ "FROM ACCOUNT "
				+ "WHERE EXISTS "
				+ "(select * "
				+ "from ACCOUNT "
				+ "where id = '"+ID+"')";
		
		try {
			ResultSet rs = stmt.executeQuery(sql);
			
			if  (rs.next()) {
				return -1;
			}
			
		}catch (SQLException ex2) {
			ex2.printStackTrace();
		}
		
			
			return 0;
		}
			
	public int login(String ID, String pw) {
		
		String sql= "SELECT id, pw "
				+ "FROM ACCOUNT "
				+ "WHERE EXISTS "
				+ "(select * "
				+ "from ACCOUNT "
				+ "where id = '"+ID+"' and pw='"+pw+"' )";
		
		try {
			ResultSet rs = stmt.executeQuery(sql);
			
			if  (rs.next()) {
				
			}
			else {
				sql= "SELECT id, pw "
						+ "FROM ADMIN "
						+ "WHERE EXISTS "
						+ "(select * "
						+ "from ADMIN "
						+ "where id = '"+ID+"' and pw='"+pw+"' )";
				rs = stmt.executeQuery(sql);
				if  (rs.next())
				{
					return 1; //admin
				}
				else {
					return -1; //login 실패
				}
			}
			
			
		} catch (SQLException ex2) {
			ex2.printStackTrace();
		}
		
		return 0; //account
	}
	public  void join(Member m) {
		String sql = ""; 
		try {
			sql = "INSERT INTO ACCOUNT VALUES('" + m.getPhoneNumber() + "', '" + m.getPw_1() + "', '" + m.getId() + "', '" + m.getName()
					+ "', '" + m.getAddress() + "', '" + m.getSex() + "', '" + m.getAccountNumber() + "', 'X')";
			System.out.print(sql);
			stmt.addBatch(sql);
			stmt.executeBatch();
			
			conn.commit();
		} catch (SQLException ex2) {
			ex2.printStackTrace();

		}
		
	}
	
	
	
	public boolean edit(Member m) {
		String sql="";
		String ID= m.getId().trim();
		
		try {
			
			sql = "Update ACCOUNT SET PW = '"+ m.getPw_1() +"', phone_number= '"+ m.getPhoneNumber()+ "', address= '"+m.getAddress()+
					"', sex= '"+m.getSex()+"', name= '"+m.getName()+"', account_number = '"+m.getAccountNumber() +"' WHERE Id = '"+
					ID+"'"; 
			//pstmt = conn.prepareStatement(sql);
			System.out.print(sql);
			System.out.print(m.getAccountNumber());
			stmt.executeUpdate(sql);
			
			conn.commit();
		
		} catch (SQLException ex2) {
			ex2.printStackTrace();
		}
		
		return true;
	}
	
	public void delete(String ID) {
		ID= ID.trim();
		try {
			String sql = "DELETE FROM ACCOUNT WHERE Id = '"+ID+"'";
			System.out.print(sql);
			stmt.addBatch(sql);
			stmt.executeBatch();
			conn.commit();
		

		} catch (SQLException ex2) {
			ex2.printStackTrace();
		}
	}

	public void donate(String ID) {
		System.out.println("기부를 선택하였습니다.");
		System.out.println(ID);
		ID= ID.trim();
		try {
			String sql = "UPDATE ACCOUNT SET Donation = 'O' WHERE Id ='"+ID+"'";
			stmt.addBatch(sql);
			stmt.executeBatch();
			conn.commit();
			System.out.println(sql);
		} catch (SQLException ex2) {
			System.err.println("sql error = " + ex2.getMessage());
			System.exit(1);
		}
		System.out.println(new String(new char[26]).replace('\0', '-'));
	}
	
}