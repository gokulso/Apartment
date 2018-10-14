package com.rpm.am.society;

/**
 * Handles Apartment and Admin Registration
 */
import java.io.IOException;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException; 
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.rpm.am.constants.DataConstants;
import com.rpm.am.exceptions.SocietyRegistrationFailedException;
import com.rpm.am.formbeans.SocietyBean;
import com.rpm.am.formbeans.UserBean;
import com.rpm.am.formbeans.MemberBean;
import com.rpm.am.util.DatabaseConnection;
import com.rpm.am.util.DateUtility;

import java.sql.*;
import java.util.ArrayList;

public class SocietyHandler extends HttpServlet 
{

	final static Logger logger = Logger.getLogger(SocietyHandler.class);
	private static String PAGE_DEFAULT = "../society/index.jsp";	
	private static String ERROR_MESSAGE = "errorMessage";
	//int Status=0;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{

		String action = request.getParameter("operation");
		String redirectPage = PAGE_DEFAULT;
		boolean result = false ;
		 
		if (action == null || action.equalsIgnoreCase("")) {
			action = "apartmenrBasicInfo";
		}
		
		System.out.println("Operation = " + action);
		logger.info("Operation = " + action);
		
		SocietyBean societyBean =  new SocietyBean(request);
		MemberBean memberBean = new MemberBean(request);
		
		System.out.println("Society Name = " + societyBean.getSocietyName());
		request.setAttribute(ERROR_MESSAGE, "Testing apartmentBean values" + societyBean.getSocietyName());	
		
		
		/*
		 * Registering Society
		 * A) Society Registration
		 * B) Society Confirmation
		 * C) Society Cancellation
		 * D) Society Delete (Soft + Hard)
		 * 
		 * Steps :
		 * (1) Register society with SuperAdmin as the apartment admin
		 * (2) Enter Society Admin in Admin table
		 * (3) Send email to SuperAdmin regarding new society registration
		 */
		
		if(action.equalsIgnoreCase("registerSociety"))
		{	
			
				/**
				 Steps :
					 * (1) Register society with SuperAdmin as the apartment admin
					 * (2) Get newly created society id from the database
					 * (3) Enter Society Admin in Member table
					 * (4) Send email to SuperAdmin regarding new society registration
				*/	
			
				try
				{	
					  //register Society
						System.out.println("***** calling registersociety");
						
					 int status = registerSociety(societyBean);
						
					 System.out.println("***** After  registerSociety");
					 //*****************************************************************
					 if(status==0) 
					 {
						 request.setAttribute(ERROR_MESSAGE, "Resitration successfull " + societyBean.getSocietyName());
						 redirectPage="successMsg.jsp";
					 }
					 else if(status==1)
					 {
						 System.out.println("Society already exists");
						 request.setAttribute(ERROR_MESSAGE, "Resitration successfull " + societyBean.getSocietyName());
						 redirectPage="successMsg.jsp";
					 }
					 else if(status==2)
						 System.out.println("User already exists");
					 else 
						 System.out.println("Error occured while inserting");
					 	  			 
					//Send email to SuperAdmin for confirmation
					 sendNewSocietyRegistrionEmail(societyBean);
				}
				catch(SocietyRegistrationFailedException exception)
				{
					logger.error("Exception while Society Registration : " + exception.getMessage());
				}
				 /**
				  * Validation returns false
				  * Society data may be duplicate or Pending for Confirmation 
				  * Add more logic in future to show matching apartments
				  */
		} 
		else if(action.equalsIgnoreCase("confirmApt"))
		{	
			
			
			//confirm Society
			
			
			//Add admin id to apartment
			
			
			//Send email to Society Admin regarding confirmation
			
			
		}
		else if(action.equalsIgnoreCase("deleteApt"))
		{	
			
			
			//register Society
			
			
			//register Admin
		}
		else if(action.equalsIgnoreCase("noticeboard"))
		{	
			try 
			{
				//Get database connection
				Connection con= DatabaseConnection.getConnection();
				PreparedStatement stmt;
				ResultSet rs;

				//This is false at the time of validating
				//Once confirmed by superAdmin - it will become true
				//Create prepared statement
				String selectSql = " INSERT INTO NoticeBoard(UserId,Notice,Date,Expiry,FrequencyId,ExecuteOn,IsPublic) VALUES( )"; 
				System.out.println("selectSql = " + selectSql);
				logger.info("Society Registration DSQL : " + selectSql);
				stmt = con.prepareStatement (selectSql);
				rs=stmt.executeQuery();
					
				if(rs.next())
				{
					
				}
			} 
			catch (Exception e)
			{
				//throw new SocietyRegistrationFailedException();
			}	
		}

		try 
		{
		    	RequestDispatcher disp = request.getRequestDispatcher(redirectPage);
		    	disp.forward(request,response);       
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	/*
	 * Get the apartment ID from the database using the  SocietyBean values
	 * @param societyBean
	 * @throws SocietyRegistrationFailedException 
	 */
	
	private int getSocietyId(SocietyBean societyBean) throws SocietyRegistrationFailedException 
	{
		int apartmentId=0;
		
		try 
		{
			//Get database connection
			Connection con= DatabaseConnection.getConnection();
			PreparedStatement stmt;
			ResultSet rs;

			//This is false at the time of validating
			//Once confirmed by superAdmin - it will become true
			//Create prepared statement
			String selectSql = " SELECT ID FROM SOCIETY WHERE NAME= '" +societyBean.getSocietyName() + "', CITYID='" + societyBean.getSocietyCityId() + "',ADDRESS1='" + societyBean.getSocietyAddress1()+"',ADDRESS2 = '" + societyBean.getSocietyAddress2() + "'"; 
			System.out.println("selectSql = " + selectSql);
			logger.info("Society Registration DSQL : " + selectSql);
			stmt = con.prepareStatement (selectSql);
			rs=stmt.executeQuery();
			
			if(rs.next())
			{
				apartmentId = rs.getInt("ID");
			}
		} 
		catch (Exception e)
		{
			throw new SocietyRegistrationFailedException();
		}	
		  return apartmentId;
	}


	/**
	 * Validate Society Data
	 * Check for duplicates	
	 * @param societyBean
	 * @return
	 */
	
/*
	private boolean validateData(SocietyBean societyBean)throws SocietyRegistrationFailedException
	{
		// TODO Auto-generated method stub
		
		try {
			//Get database connection
			Connection con;
			PreparedStatement stmt;
			ResultSet rs;
			con = DatabaseConnection.getConnection();	
			
			CallableStatement callproc = null;
		
			//This is false at the time of validating
			//Once confirmed by superAdmin - it will become true
			boolean isActive = false;
			
			//Create prepared statment
			
			callproc = con.prepareCall("{ call uspRegisterSociety(?) }");
			
			callproc.setString(parameterName, x)
		
			String selectSql = " SELECT * FROM SOCIETY WHERE NAME= '" + societyBean.getSocietyName() + "' and CITYID=" + societyBean.getSocietyCityId() + " and ADDRESS1='" + societyBean.getSocietyAddress1()+"' and ADDRESS2 = '" + societyBean.getSocietyAddress2() + "'"; 
			System.out.println("selectSql = " + selectSql);
			logger.info("Society Registration DSQL : " + selectSql);
			stmt = con.prepareStatement (selectSql);
			rs=stmt.executeQuery();
			
			if(rs.next()){
				System.out.println("rs.next = " + selectSql);
				  return isActive;
			}
			} 
		   catch (Exception e)
		   {
			   System.out.println("Exception = " + e.getMessage());
			  throw new SocietyRegistrationFailedException();
		   }		
		return true;
	}
*/
	
	/**
	 * Send email to SuperAdmin informing registration of new apartment
	 * Also send email to registering admin 
	 * @param societyBean
	 */
	private void sendNewSocietyRegistrionEmail(SocietyBean societyBean) 
	{
		// TODO Auto-generated method stub
		
	}

	
	
	
	
	/**
	 * Register Admin in the Member Table
	 * Set User Type as Admin 
	 * @param societyBean
	 * @throws SocietyRegistrationFailedException 
	 */
	
	/* 
	 private void registerSocietyAdmin(UserBean userBean,MemberBean memberBean) throws SocietyRegistrationFailedException 
	
	{
		// TODO Auto-generated method stub
		//DataConstants.USER_TYPE_APT_ADMIN
		
		try 
		{
			//Get database connection
			Connection con = DatabaseConnection.getConnection();	
		
			//This is false at the time of registration
			//Once confirmed by superAdmin - it will become true
			int isActive = 1;
			
			//Create prepared statment
			//String insertSql = " INSERT INTO APARTMENT(USER_LOGIN,USER_PASS,USER_EMAIL,USER_STATUS,USER_ACTIVATION_KEY) " +
			 String insertSql = " INSERT INTO MEMBERINFORMATION (USERID,RELATIONID,NAME,DOB,BADGENUMBER,WING,FLATNUMBER,MOBILE,PHONE,EMAIL,ISACTIVE) VALUES(" + 1 + "," + 1 + ",'" +  userBean.getUserName() + "','" + userBean.getUserDOB() + "'," + 1 + ",'" + userBean.getUserWing()+ "'," + userBean.getUserFlatNumber() + "," + userBean.getUserMobile() + "," + userBean.getUserPhone() + ",'" + userBean.getUserEmail() + "'," + isActive +")"; 
			 logger.info("Society Registration DSQL : " + insertSql);			
			 Statement stmt = con.createStatement ();
			 stmt.executeUpdate(insertSql);		
			 System.out.println("insertSql = " + insertSql);
		} 
		catch (SQLException e)
		{
			 System.out.println("Exception = " + e.getMessage());
		  
			 throw new SocietyRegistrationFailedException();
		}
	}
      */
	
	
	
	
	
	/**
	 * Register Society
	 * Insert data into apartment table
	 * @param societyBean
	 */
	private int registerSociety(SocietyBean societyBean) throws SocietyRegistrationFailedException
	{
		//int isActive = 0;
		int returnStatus=0;

		try 
		{
			//Get database connection
			Connection con = DatabaseConnection.getConnection();	
			CallableStatement procInsert=null;
			 
			//This is false at the time of registration
			//Once confirmed by superAdmin - it will become true
			
			
			//Create prepared statment
			//String insertSql = " INSERT INTO APARTMENT(USER_LOGIN,USER_PASS,USER_EMAIL,USER_STATUS,USER_ACTIVATION_KEY) " +
			//String insertSql = " INSERT INTO SOCIETY(NAME,ADDRESS1,ADDRESS2,CITYID,MOBILE,PHONE,EMAIL,WEBSITE,ISACTIVE) VALUES('" + societyBean.getSocietyName() + "','" + societyBean.getSocietyAddress1() + "','" + societyBean.getSocietyAddress2()+ "'," + societyBean.getSocietyCityId() + "," + societyBean.getSocietyMobile() + "," + societyBean.getSocietyPhone() + ",'" + societyBean.getSocietyEmail() + "','" + societyBean.getSocietyWebsite() + "'," + isActive +")"; 
			procInsert = con.prepareCall("{ call uspRegisterSociety(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) }");
		    
			procInsert.setString("Name",societyBean.getSocietyName());
			procInsert.setString("Address1",societyBean.getSocietyAddress1());
			procInsert.setString("Address2",societyBean.getSocietyAddress2());
			procInsert.setInt("CityId",societyBean.getSocietyCityId());
			procInsert.setString("Mobile",societyBean.getSocietyMobile());
			procInsert.setString("Phone",societyBean.getSocietyPhone());
			procInsert.setString("SocietyEmail",societyBean.getSocietyEmail());
			procInsert.setString("Website",societyBean.getSocietyWebsite());
		    procInsert.setString("UserEmail",((MemberBean)societyBean.getUserMemberBean().get(0)).getMemberEmail());
		    procInsert.setString("Password",societyBean.getUserPassword());
		    //procInsert.setInt("UserTypeId",societyBean.getUserUserTypeId()); 
		    procInsert.setInt("UserTypeId",DataConstants.USER_TYPE_APT_MEMBER);
		    procInsert.setBoolean("IsOwner",societyBean.getUserIsOwner());
		    
		    //procInsert.setDate("JoinDate",new java.sql.Date( (societyBean.getUserJoinDate()).getTime()));
		    procInsert.setDate ("JoinDate",new java.sql.Date((DateUtility.getDateFromString(societyBean.getUserJoinDate()).getTime())));

		    procInsert.setInt("InterCom",societyBean.getUserInterCom());
		    procInsert.setBoolean("IsStayingHere",societyBean.getUserIsStayingHere());
		    procInsert.setString("MemberName",((MemberBean)societyBean.getUserMemberBean().get(0)).getMemberName());
		    
		    //procInsert.setDate("DOB",new java.sql.Date(((MemberBean)societyBean.getUserMemberBean().get(0)).getMemberDOB().getTime()));
		    procInsert.setDate("DOB",new java.sql.Date((DateUtility.getDateFromString(((MemberBean)societyBean.getUserMemberBean().get(0)).getMemberDOB()).getTime())));
		    
		    procInsert.setInt("GenderId",((MemberBean)societyBean.getUserMemberBean().get(0)).getMemberGender());
		    procInsert.setInt("BadgeNumber",((MemberBean)societyBean.getUserMemberBean().get(0)).getMemberBadgeNumber());
		    procInsert.setString("Wing",((MemberBean)societyBean.getUserMemberBean().get(0)).getMemberWing());
		    procInsert.setInt("FlatNumber",((MemberBean)societyBean.getUserMemberBean().get(0)).getMemberFlatNumber());
		    procInsert.setString("MemberMobile",((MemberBean)societyBean.getUserMemberBean().get(0)).getMemberMobile());
		    procInsert.setString("MemberPhone",((MemberBean)societyBean.getUserMemberBean().get(0)).getMemberPhone());
		    
			//logger.info("Society Registration DSQL : " + insertSql);
		    ResultSet srs = procInsert.executeQuery();
		    //int memberId = ((MemberBran)societyBean.getUserMemberBean().get(0)).getMemberId());
		   
		    String s ="call uspRegisterSociety @Name = '" + societyBean.getSocietyName() + "'," +
		    								  "@Address1 = '" + societyBean.getSocietyAddress1() + "'," +
		    								  "@Address2 = '" + societyBean.getSocietyAddress2() + "'," +
		    								  "@CityId = " + societyBean.getSocietyCityId()  + "," +
		    								  "@Mobile = '" + societyBean.getSocietyMobile() + "'," +
		    								  "@Phone = '" + societyBean.getSocietyPhone()  + "'," +
		    								  "@SocietyEmail = '" + societyBean.getSocietyEmail() + "'," +
		    								  "@Website = '" + societyBean.getSocietyWebsite() + "'," +
		    								  "@UserEmail = '" + ((MemberBean)societyBean.getUserMemberBean().get(0)).getMemberEmail() + "'," +
		    								  "@Password = '" + societyBean.getUserPassword() + "'," +
		    								  "@UserTypeId = " + societyBean.getUserUserTypeId() + "," +
		    								  "@IsOwner = " + societyBean.getUserIsOwner() + "," +
		    								  "@JoinDate = '" + new java.sql.Date((DateUtility.getDateFromString(societyBean.getUserJoinDate()).getTime())) + "'," +
		    								  "@InterCom = " + societyBean.getUserInterCom() + "," +
		    								  "@IsStayingHere = " + societyBean.getUserIsStayingHere() + "," +
		    								  "@MemberName = '" + ((MemberBean)societyBean.getUserMemberBean().get(0)).getMemberName() + "'," +
		    								  "@DOB = '" + new java.sql.Date((DateUtility.getDateFromString(((MemberBean)societyBean.getUserMemberBean().get(0)).getMemberDOB()).getTime())) + "'," +
		    								  "@GenderId = " + ((MemberBean)societyBean.getUserMemberBean().get(0)).getMemberGender() + "," +
		    								  "@BadgeNumber = " + ((MemberBean)societyBean.getUserMemberBean().get(0)).getMemberBadgeNumber() + "," +
		    								  "@Wing = '" + ((MemberBean)societyBean.getUserMemberBean().get(0)).getMemberWing() + "'," +
		    								  "@FlatNumber = " + ((MemberBean)societyBean.getUserMemberBean().get(0)).getMemberFlatNumber() + "," +
		    								  "@MemberMobile = '" + ((MemberBean)societyBean.getUserMemberBean().get(0)).getMemberMobile() + "'," +
		    								  "@MemberPhone = '" + ((MemberBean)societyBean.getUserMemberBean().get(0)).getMemberPhone() + "'" ;
		
			System.out.println(s);
		    
		    while (srs.next())
		    {
		    	System.out.println("Status "+ srs.getInt("Status"));
		    	returnStatus=srs.getInt("Status");
		    	
		    	/*
		    	System.out.println("Societyid "+ srs.getInt("SocietyId"));
		    	societyBean.setSocietyId(srs.getInt("Id"));
		    	
		    	System.out.println("Userid "+ srs.getInt("UserId"));
		    	societyBean.setUserId(srs.getInt("UserId"));
		    	
		    	System.out.println("MemberId "+ srs.getInt("MemberId"));		    	
		    	//societyBean.setMemberId(srs.getInt("MemberId"));
		    	((MemberBean)societyBean.getUserMemberBean().get(0)).setMemberId(srs.getInt("MemberId"));
		    	System.out.println("MemberId "+ ((MemberBean)societyBean.getUserMemberBean().get(0)).getMemberId());
		    	*/		    	
		    }
		    
		} 
		catch (SQLException e)
		{
			 System.out.println("Exception = " + e.getMessage());
			 e.printStackTrace();
			 throw new SocietyRegistrationFailedException();
		}
		catch (Exception e)
		{
			 System.out.println("Exception = " + e.getMessage());
			 e.printStackTrace();
		}
		
		return returnStatus;
	}

}
