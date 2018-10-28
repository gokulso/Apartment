package com.rpm.am.user;

/**
 * ComplaintHandler
 * Handles all complaint activities like register, view, delete, update. 
 * @author Milind
 *
 */ 

import java.io.IOException;


import java.security.SecureRandom;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.rpm.am.constants.PageNameConstants;
import com.rpm.am.constants.ParameterConstants;

import com.rpm.am.exceptions.ComplaintRegistrationFailedException;
import com.rpm.am.formbeans.ComplaintBean;

import com.rpm.am.util.DatabaseConnection;
import com.rpm.am.util.DateUtility;
import com.rpm.am.util.StringEncrypter;

public class ComplaintHandler extends HttpServlet
{
	private static String PAGE_DEFAULT = PageNameConstants.PAGE_NOTICE_DASHBOARD;	
	private static String ERROR_MESSAGE = "errorMessage";
	
	final static Logger logger = Logger.getLogger(UserHandler.class);
	static final String encryptionScheme = StringEncrypter.DESEDE_ENCRYPTION_SCHEME;;
	static final String encryptionKey = "123456789012345678901234567890";
	static StringEncrypter  encrypter = null;
	static SecureRandom prng =null;
	
	
	
	public ComplaintHandler()
	{
		
	}
	
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
		
		ComplaintBean complaintBean =  new ComplaintBean(request);
		
		//Check user session
		
		//Validate request
		
		//Check if user has permission to create notice
		
		boolean isAllowed = isComplaintRegisterAllowed(complaintBean.getCreatedById(),complaintBean.getSocietyId());
		
		if(action==null || action.equalsIgnoreCase(""))
		{			
			action="view";
		}
		
		System.out.println("Operation = " + action);
		logger.info("Operation = " + action);
		
		//perform the operation
		if(!isAllowed)
		{
			System.out.println("User not allowed to register complaint");
			request.setAttribute(ERROR_MESSAGE, "You are not allowed to register complaint");			
			
			redirectPage = PAGE_DEFAULT;		
		}
		else if(action.equalsIgnoreCase("registerComplaint"))
		{	
			try
			{	
				System.out.println("***** calling registerComplaint()");
				
				int status = registerComplaint(request);
				
				System.out.println("***** After  registerComplaint()");

				if(status >= 0) 
				{
					 request.setAttribute(ERROR_MESSAGE, "Complaint Registered successfully. Your complaint Number: " + status);
					 redirectPage = "complaints.jsp";
				}
				else if(status == -1)
				{
					 System.out.println("error");
					 request.setAttribute(ERROR_MESSAGE, "Error " );
					 redirectPage = "complaints.jsp";
				}
			}
			catch(ComplaintRegistrationFailedException exception)
			{
				logger.error("Exception while Complaint Registration : " + exception.getMessage());
			}
		}
		else if(action.equalsIgnoreCase("view"))
		{
			System.out.println("Inside View Complaint");
			complaintBean = viewComplaint(complaintBean);
			System.out.println("###########################  " + complaintBean.getSubject());
			request.setAttribute("viewComplaint", complaintBean);			
			System.out.println("After View Complaint");			
			redirectPage = PageNameConstants.PAGE_COMPLAINT_VIEW;
			
		}
		/*else if(action.equalsIgnoreCase("update"))
		{
			System.out.println("Before UPDATE Complaint");
			int status = updateComplaint(complaintBean);
			System.out.println("After UPDATE Complaint");			
			redirectPage = PAGE_DEFAULT ;
		}	*/	
		else if(action.equalsIgnoreCase("delete"))
		{
			System.out.println("Before delete Complaint");
			int status = deleteComplaint(complaintBean);
			System.out.println("After delete Complaint");			
			redirectPage = PAGE_DEFAULT;
		}
			
		 try 
		 {
		    	RequestDispatcher disp = request.getRequestDispatcher(redirectPage);
		    	disp.forward(request, response);       
		 }
		 catch(Exception e)
		 {
		   e.printStackTrace();
		 }		
	}

	private int deleteComplaint(ComplaintBean complaintBean) {
		try 
		{
			Connection con = DatabaseConnection.getConnection();	
			CallableStatement procDelete=null;
			//Create prepared statement
			procDelete = con.prepareCall("{ call uspDeleteComplaint(?) }");
			procDelete.setInt("ComplaintId",complaintBean.getId());
			//logger.info("Society Registration DSQL : " + insertSql);
			procDelete.executeUpdate(); 
		} 
		catch (SQLException e)
		{
			 System.out.println("Exception = " + e.getMessage());
			 e.printStackTrace();
			  
		}
		return 1;
	}

	public int  registerComplaint(HttpServletRequest request) throws ComplaintRegistrationFailedException
	{
		int returnStatus=0; 
		
		try 
		{
			Connection con = DatabaseConnection.getConnection();	
			CallableStatement procAddComplaint=null;
			
			procAddComplaint = con.prepareCall("{ call uspInsertComplaint(?,?,?,?,?)}");
		    
			//procAddComplaint.setInt("SocietyId",Integer.parseInt(request.getParameter("societyid")));
			procAddComplaint.setInt("SocietyId",1);
			//procAddComplaint.setInt("UserId",Integer.parseInt(request.getParameter("userid")));
			procAddComplaint.setInt("UserId",1);
			procAddComplaint.setString("Subject",request.getParameter("subject"));
			procAddComplaint.setString("Description",request.getParameter("description"));
			procAddComplaint.setInt("AssignedToVendtorTypeId",Integer.parseInt(request.getParameter("vendorTypeId")));
			
			System.out.println("Before Resultset");
		    ResultSet rs = procAddComplaint.executeQuery();
		    
		    System.out.println("Result Set = " + rs);
		    
		    //System.out.println(userBean.getUserEmail());
		    
		    while (rs.next())
		    {
		    	//System.out.println("Status "+ rs.getInt("Status"));
		    	returnStatus = rs.getInt("ComplaintId");
		    }
		} 
		catch (SQLException ex) 
		{
			ex.printStackTrace();
			System.out.println("Exception in MyNumbersHandler  = "+ex);
        	logger.error("Exception in MyNumbersHandler  = " + ex);
        	throw new ComplaintRegistrationFailedException();
		}
		return returnStatus;
	}
	
	public ArrayList getComplaints(String userId,String apartmentId)
	{
		ArrayList complaintList = new ArrayList();
		
		String sql = "EXEC [dbo].[uspGetComplaints] @SocietyId = " + apartmentId + ", @UserId = 0";
		Connection con = DatabaseConnection.getConnection();	
		System.out.println("SQL = " + sql );
		
		try
		{
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			int count = 1 ;
		
			while(rs.next())
			{
				System.out.println("Inside RS  = " + count );
				System.out.println("Complaint  = " + rs.getString("Subject") );
				ComplaintBean bean = new ComplaintBean(rs.getInt("Id"),rs.getString("Subject"),rs.getString("CreatedDate"));
				complaintList.add(bean);
				count ++; 
			}
			rs.close();
			con.close();
		} 
		catch (SQLException e) 
		{
			System.out.println("SQLException" + e.toString());
			e.printStackTrace();
		}
		return complaintList ;
	}
	
	private ComplaintBean viewComplaint(ComplaintBean complaintBean)
	{
		ArrayList noticeList = new ArrayList();
		
		//HttpSession session = request.getSession(true);
	 
		//String sql = "select CM.Subject , CD.Description from Complaint CM, ComplaintDetail CD where CM.Id=CD.ComplaintId AND CM.Id=" + complaintBean.getId()  ;
		String sql = "[dbo].[uspGetComplaintDetails] @ComplaintId = " + complaintBean.getId() + ",@UserId = 24"; //+ session.getAttribute("s_userId"); 
		Connection con = DatabaseConnection.getConnection();	
		System.out.println("SQL = " + sql );
		
		try
		{
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			int count = 1 ;
		
			while(rs.next())
			{ 
				System.out.println("@@@@@@@@@@@@@ Subject  = " + rs.getString("Subject") );
				complaintBean = new ComplaintBean();
				complaintBean.setId(complaintBean.getId());
				complaintBean.setSubject( rs.getString("Subject"));
				complaintBean.setDescription(rs.getString("Description"));
				System.out.println("@@@@@@@@@@@@@ Subject Desc = " + rs.getString("Subject") );
			 
				complaintBean.setCreatedDate(rs.getString("CreatedDate")); 
			}
			rs.close();
			con.close();
		} 
		catch (SQLException e) 
		{
			System.out.println("SQLException" + e.toString() );
			e.printStackTrace();
		}
		return complaintBean ;
	}	

	/**
	 * Check if user is allowed to register complaint
	 * @param createdById
	 * @param societyId
	 * @return
	 */
	private boolean isComplaintRegisterAllowed(int createdById, int societyId) 
	{
		// TODO Auto-generated method stub
		return true;
	}
}

