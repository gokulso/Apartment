package com.rpm.am.test;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;

import com.rpm.am.util.DatabaseConnection;

public class TestDbProc
{
	public static void main(String[] args) throws Exception 
	{
		Connection conn = null;
		try 
		{
			conn = DatabaseConnection.getConnection();
			CallableStatement stmt = conn.prepareCall("{call InsertUser (?, ?, ?, ?, ?, ?, ?, ?)}");
			//
			// Defines all the required parameter values.
			//
			
			stmt.setString(1, "pravin@pravin.pravin");
			stmt.setString(2, "password");
			stmt.setInt(3, 1);
			stmt.setInt(4, 1);
			stmt.setInt(5, 1);
			stmt.setDate(6, new Date(2011, 2, 16));
			stmt.setInt(7, 1);
			stmt.setInt(8, 1);
			
			
			stmt.execute();
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (conn != null && !conn.isClosed()) {
				conn.close();
			}
		}
	}
}
