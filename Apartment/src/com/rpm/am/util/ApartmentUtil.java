package com.rpm.am.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.*;
 
public class ApartmentUtil 
{
	
	public static int getSocietyId()
	{
		return 1;
	}

	
	

	public static Hashtable getEntityTypes(String entity)
	{
			Connection con = DatabaseConnection.getConnection();	
			Statement stmt = null;
			ResultSet rs= null;
			Hashtable entitytypes=new Hashtable(); 
			
		try
		{
			stmt = con.createStatement();
			String selectSql = "uspGetMetaData " + entity; 
			rs=stmt.executeQuery(selectSql);
	
			while (rs.next())
			{
				entitytypes.put(new Integer(rs.getInt("id")), rs.getString("name"));
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
			System.out.println("Exception "+e);
		}
		finally
		{
			try
			{
				rs.close();
				stmt.close();
				con.close();
			}
			catch (Exception e)
			{
			}
			rs=null;
			stmt=null;
			con=null;
		}
		return entitytypes;
	}

	public static Iterator getEntity(String entity)
	{
			Connection con = DatabaseConnection.getConnection();	
			Statement stmt = null;
			ResultSet rs= null;
			Hashtable entitytypes=new Hashtable(); 
			HashMap map=null;
			Iterator itr=null;
		try
		{
			stmt = con.createStatement();
			String selectSql =  entity; 
			System.out.println("********selectSql "+selectSql);
			rs=stmt.executeQuery(selectSql);
			ResultSetUtils rsutil = new ResultSetUtils();
			map= rsutil.getMapData(rs);
			Set s=map.entrySet();
		    itr = s.iterator();
	 
		}
		catch (SQLException e)
		{
			e.printStackTrace();
			System.out.println("Exception "+e);
		}
		finally
		{
			try
			{
				rs.close();
				stmt.close();
				con.close();
			}
			catch (Exception e)
			{
			}
			rs=null;
			stmt=null;
			con=null;
		}
		return itr;
	}
	

}
