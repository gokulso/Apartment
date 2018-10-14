package com.rpm.am.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class DatabaseConnection 
{
/*
	public static Connection getConnection()
	{
		
			System.out.println("MySQL Connect Example");
		    Connection conn = null;
		    String url = "jdbc:mysql://localhost:3306/";
		    String dbName = "apartment";
		    String driver = "com.mysql.jdbc.Driver";
		    String userName = "rssUser"; 
		    String password = "admin";
		    
		    try 
		    {
		      Class.forName(driver).newInstance();
		      conn = (Connection) DriverManager.getConnection(url+dbName,userName,password);
		      System.out.println("Connected to the database");
		      
		      System.out.println("Disconnected from database");
		    } 
		    catch (Exception e) 
		    {
		      e.printStackTrace();
		    }
		    return conn ; 
	}

	public static Connection getDatabaseConnection() {
		// TODO Auto-generated method stub
		return null;
	}
*/
	
	public static Connection getConnection()
	{
			Connection con = null;
			Statement stmt = null;
			
			System.out.println("MySQL Connect Example");
		    
			String url = "jdbc:jtds:sqlserver://localhost:1433/Apartment";
			String userName = "sa";
			String password = "root";
 
		    //String driver = "sun.jdbc.odbc.JdbcOdbcDriver";
			 
		    try
			{
		    	Class.forName("net.sourceforge.jtds.jdbc.Driver");
				con = DriverManager.getConnection(url,userName,password);
				//stmt = con.createStatement();
				
				System.out.println("Connected to the database");
			      
			   // System.out.println("Disconnected from database");
			    
			    //stmt.close();
			    //con.close();
			}
		    catch (Exception e) 
		    {
		      e.printStackTrace();
		      System.out.println(e.toString());
		    }
		    return con; 
	}
}
