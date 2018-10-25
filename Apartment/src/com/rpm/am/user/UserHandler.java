package com.rpm.am.user;

/**
 * UserHandler
 * Handles all user activities like login, registration, password reset
 * @author Pravin
 *
 */ 

import java.io.IOException;




import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;

import com.rpm.am.exceptions.ComplaintRegistrationFailedException;
import com.rpm.am.exceptions.UserRegistrationFailedException;
import com.rpm.am.exceptions.MemberRegistrationFailedException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.rpm.am.constants.DataConstants;
import com.rpm.am.constants.PageNameConstants;
import com.rpm.am.constants.ParameterConstants;
import com.rpm.am.formbeans.ComplaintBean;
import com.rpm.am.formbeans.MemberBean;
import com.rpm.am.formbeans.NoticeBean;
import com.rpm.am.formbeans.SocietyBean;
import com.rpm.am.formbeans.UserBean;
 
import com.rpm.am.util.DatabaseConnection;
import com.rpm.am.util.DateUtility;
import com.rpm.am.util.EmailSender;
import com.rpm.am.util.StringEncrypter;
import com.rpm.am.util.StringEncrypter.EncryptionException;
import java.util.*;
import java.sql.Date;

public class UserHandler extends HttpServlet
{
	private static String PAGE_DEFAULT = PageNameConstants.PAGE_USER_DASHBOARD;	
	private static String ERROR_MESSAGE = "errorMessage";
	
	final static Logger logger = Logger.getLogger(UserHandler.class);
	static final String encryptionScheme = StringEncrypter.DESEDE_ENCRYPTION_SCHEME;;
	static final String encryptionKey = "123456789012345678901234567890";
	static StringEncrypter  encrypter = null;
	static SecureRandom prng =null;
	
	 HttpSession userSession = null ;

	static
	{
		try
		{
		encrypter = new StringEncrypter(encryptionScheme,encryptionKey);
		prng = SecureRandom.getInstance("SHA1PRNG");
		
		}catch(Exception ex)
		{
			System.out.println("Exception whiile initializing StringEncrypter"+ ex);
		}
	}
	
	public UserHandler()
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
		System.out.println("Action:" +action);
		/*
		SocietyBean societyBean=null;
		MemberBean memberBean =null;
		UserBean userBean =null;
		*/
		SocietyBean societyBean =  new SocietyBean(request);
		MemberBean memberBean = new MemberBean(request);
		UserBean userBean = new UserBean(request);
		ComplaintBean complaintBean = new ComplaintBean(request);
		
		
		if(action!=null || ! action.equalsIgnoreCase("registerComplaint"))
		{
			/*
			societyBean =  new SocietyBean(request);
			memberBean = new MemberBean(request);
			userBean = new UserBean(request);
			*/
		}
		
		//Validate request
		
		if(action==null || action.equalsIgnoreCase(""))
		{			
			action="login";
		}
		
		System.out.println("Operation = " + action);
		logger.info("Operation = " + action);
				
		if(action.equalsIgnoreCase("login"))
		{	
			userBean = doSignOn(userBean);
			
			 if (!userBean.getUserEmail().equalsIgnoreCase(""))// not empty
			 {	
				 //Populate Member Bean for the logged in user
				 memberBean = getMemberData(memberBean,userBean.getUserId());
				 
				//Set session values
				 request.setAttribute(ERROR_MESSAGE, "");		
				 HttpSession session = request.getSession(true);
				 session.setMaxInactiveInterval(100000);
				 
				 System.out.println("###### session status = " +session.toString());
				// session.setAttribute("loginName",memberBean.getMemberName());	
				// session.setAttribute("userId", userBean.getUserEmail());
				 
				 session.setAttribute("s_userName",memberBean.getMemberName());	
				 session.setAttribute(ParameterConstants.SEESION_USER_ID,userBean.getUserId()+""  );	
				 session.setAttribute("s_userType",userBean.getUserUserTypeId()+"");	
				 session.setAttribute(ParameterConstants.SEESION_SOCIETY_ID, 1+"");	 //,memberBean.getMemberName());	 
				 session.setAttribute("s_societyName","Swagat Corner");	 //,memberBean.getMemberName());	 
				 
				 
				 //logger.info("###### Setting Session loginName =" + userBean.getUserName() + "..... userID  =" + userBean.getUserName()  );
				 //session.getAttribute("loginName").toString();
				 //logger.info("###### Getting Session loginName =" + session.getAttribute("loginName").toString());
				 
				/* if(userBean.getRememberMe() != null)
				 {
					 session.setMaxInactiveInterval(24*60*60); // 24 Hours
				 }
				 else
				 { 
					 session.setMaxInactiveInterval(30*60);    // 30 Minutes
				 }*/
				 
				 System.out.println("###### session status = " +session.toString());
				 
				// String requestedPage = PageNameConstants.PAGE_USER_DASHBOARD ;//REDIRECT_TO
				 
				 //Redirect to requested page
				 
				String redirect_to = request.getParameter("redirect_to") ; 
				
				if (redirect_to != null && ! redirect_to.equalsIgnoreCase(""))
				{
					redirectPage = request.getParameter("redirect_to").toString();
					System.out.println(" ............ redirectPage = " + redirectPage);
					//response.sendRedirect(redirectPage);
				} 
				else
				{
					//request.setAttribute(ERROR_MESSAGE, "Login Successful. ");
					request.setAttribute("operation", "my_numbers");
					redirectPage = PageNameConstants.PAGE_USER_DASHBOARD;
				}
			} 
			else
			{
				// Failed login
				request.setAttribute(ERROR_MESSAGE,"Login failed. Please try again.");
				redirectPage = PageNameConstants.PAGE_LOGIN;
			}
		} 
		else if(action.equalsIgnoreCase("registerUser"))
		{
			try
			{
				int status = createUser(userBean,societyBean);
				logger.info("Satus :  "+status);
				
				if(status==0)
				{
					//Send confirmation email
					//sendConfirmationEmail(userBean.getUserName(),userBean.getUserEmail(),activationKey);
					request.setAttribute(ERROR_MESSAGE, "User Registration Successful.");	
					redirectPage = PageNameConstants.PAGE_ACTION_SUCCESS;
					System.out.println("Status : "+status);
				}
				else
				{
					System.out.println("Status : "+status);
					logger.info("status false" );
					request.setAttribute(ERROR_MESSAGE, "Could not register at this time. Please try again.");	
					redirectPage = PageNameConstants.PAGE_REGISTER ;
				}
			}
			catch(Exception e)
			{}
		}
		else if(action.equalsIgnoreCase("registerMember"))
		{
			try
			{
				int status = createMember(userBean);
				logger.info("Satus :  "+status);
				
				if(status == 0)
				{
					//Send confirmation email
					//sendConfirmationEmail(userBean.getUserName(),userBean.getUserEmail(),activationKey);
					request.setAttribute(ERROR_MESSAGE, "Member Registration Successful.");	
					redirectPage = PageNameConstants.PAGE_ACTION_SUCCESS;
					System.out.println("Status : "+status);
					System.out.println("Member Added Successfully.");
				}
				else
				{
					System.out.println("Status : "+status);
					System.out.println("Member Already Exists.");
					logger.info("status false" );
					request.setAttribute(ERROR_MESSAGE, "Could not register at this time. Please try again.");	
					redirectPage = PageNameConstants.PAGE_REGISTER ;
				}
			}
			catch(Exception e)
			{}
		} else if(action.equalsIgnoreCase("approvedresidents"))
		{
			System.out.println("Inside View approved residents");
			userBean = viewRegisteredUsers(userBean);
			request.setAttribute("userBean", userBean);
		}
		else if(action.equalsIgnoreCase("changePassword"))
		{
			if (changePassword(userBean.getUserEmail(),userBean.getUserPassword(),userBean.getUserNewPassword() ))
			{
				//logger.info("Password changes for user : =  " + ((MemberBean)societyBean.getUserMemberBean().get(0)).getMemberName()  );
				request.setAttribute(ERROR_MESSAGE, "Password changed successfully.");	
				//redirectPage = PageNameConstants.PAGE_ACTION_SUCCESS;
				
				redirectPage="change_password_success.jsp";
			}
			else
			{
				//logger.info("Password change failed for user : =  " + ((MemberBean)societyBean.getUserMemberBean().get(0)).getMemberName() );
				request.setAttribute(ERROR_MESSAGE, "Change password failed. Please try again.");	
				redirectPage = PageNameConstants.PAGE_PASSWORD_CHANGE; 
			}
		}
		else if(action.equalsIgnoreCase("logout"))
		{ 
				request.getSession().invalidate();
				request.setAttribute(ERROR_MESSAGE, "Logout Successful");	
				redirectPage = PageNameConstants.PAGE_LOGIN; 
		}

		try 
		{
		    	RequestDispatcher disp = request.getRequestDispatcher(redirectPage);
		    	if (disp != null)
		    	disp.forward(request,response);       
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	private UserBean viewRegisteredUsers(UserBean userBean) {
		
		ArrayList noticeList = new ArrayList();
		String sql = "SELECT * FROM [user]  where id=" + userBean.getUserIsActive()  ;
		Connection con = DatabaseConnection.getConnection();	
		System.out.println("get user SQL = " + sql );
		userBean = new UserBean();
		try
		{
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			int count = 1 ;
			while(rs.next())
			{ 
			
			}
			
			rs.close();
			con.close();
			
		} 
		catch (SQLException e) 
		{
			System.out.println("SQLException" + e.toString() );
			e.printStackTrace();
		}
		return userBean;
	}

	private MemberBean getMemberData(MemberBean memberBean, int userId) 
	{
		
		if(memberBean==null)
		{			
			memberBean = new MemberBean();
		}
		
		Connection conn = DatabaseConnection.getConnection();	
		Statement s;
		
		try 
		{
			s = conn.createStatement ();
		
			String selectSql = "SELECT * FROM  [MemberInformation ] WHERE  [UserId] =" + userId;

			System.out.println("selectSql = " + selectSql);
			logger.info("doSignOn  selectSql= " + selectSql);
		
			ResultSet rs = s.executeQuery(selectSql);
 
			while(rs.next())
			{
				memberBean.setMemberName( rs.getString("Name"));
				memberBean.setMemberMobile( rs.getString("Mobile")); 
			}
			rs.close();
			conn.close();
		}
		catch(SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return memberBean;
	}

	private boolean changePassword(String userName, String oldPassword, String newPassword) 
	{
		int rows = 0;	
		
		try 
		{
			//String oldEncryptedPassword = encrypter.encrypt(oldPassword);
			//String newEncryptedPassword = encrypter.encrypt(newPassword);
		
			String updateSql = "UPDATE [user] SET password ='" + newPassword + "' WHERE email = '" + userName + "' AND password ='" + oldPassword + "'";
			
			System.out.println("Change Password query = " + updateSql);
			
			logger.info("changePassword Sql = " + updateSql);
			
			Connection conn = DatabaseConnection.getConnection();
			System.out.println("conn = " + conn);
		
			Statement s = conn.createStatement ();
			System.out.println("s = " + s);
			
			rows = s.executeUpdate(updateSql);
			
			System.out.println("rows = " + rows);
		} 
		catch (Exception ex) 
		{
			System.out.println("Exception in MyNumbersHandler  = " + ex);
			ex.printStackTrace();
			logger.error("Exception in MyNumbersHandler  = " + ex);
		}
		
		if(rows>0)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	
	public UserBean doSignOn( UserBean userBean )
	{
		try
		{
			System.out.println("password from login page = " + userBean.getUserPassword());
			//String encryptedPassword = encrypter.encrypt(userBean.getUserPassword());
			String dbUserName = ""; 
			int userId =-1; 
			String userType = ""; 
			
			Connection conn = DatabaseConnection.getConnection();	
			Statement s = conn.createStatement ();
			
			String selectSql = "SELECT * FROM [user] WHERE  email = '" + userBean.getUserEmail() + "' AND password='" + userBean.getUserPassword() + "' and IsActive=1";

			System.out.println("selectSql = " + selectSql);
			logger.info("doSignOn  selectSql= " + selectSql);
			
			ResultSet rs = s.executeQuery(selectSql);
	 
			while(rs.next())
			{
				dbUserName = rs.getString("email");
				userId = rs.getInt("Id");
				userType= rs.getString("UserTypeId");
			}
		    rs.close();
			conn.close();
			
			if(dbUserName.equals(userBean.getUserEmail()))
			{
				userBean.setUserEmail(dbUserName);
			
				System.out.println(" doSignOn  return true" );
				logger.info("doSignOn  success for = " );
				userBean.setUserId(userId);
				return userBean;
			}
			else
			{
				userBean.setUserEmail("Pravin");
				System.out.println(" doSignOn  return false" );
				logger.info("doSignOn  failed for = " );
				return userBean;
			}
		} 
		catch (Exception ex)
		{
			userBean.setUserEmail("");
			System.out.println("Exception in doSignOn  = " + ex);
			ex.printStackTrace();
			logger.error("Exception in doSignOn  = " + ex);
		}
		return userBean;
	} 
	
	 
	public int  createUser(UserBean userBean, SocietyBean societyBean) throws UserRegistrationFailedException
	{
		int returnStatus=0; 
		
		try 
		{
			
			//String encryptedPassword = encrypter.encrypt(password);
			//String activationKey = createRandomString();
			
			Connection con = DatabaseConnection.getConnection();	
			CallableStatement procUserAdd=null;
			
			procUserAdd = con.prepareCall("{ call uspAddUser(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
		    
			procUserAdd.setInt("SocietyId", societyBean.getSocietyId());
			procUserAdd.setString("Email",userBean.getUserEmail());
			procUserAdd.setString("Password",userBean.getUserPassword());
			procUserAdd.setInt("UserTypeId",DataConstants.USER_TYPE_APT_MEMBER);
			procUserAdd.setBoolean("IsOwner",userBean.getUserIsOwner());
			//procUserAdd.setDate("JoinDate",new java.sql.Date(userBean.getUserJoinDate().getTime()));
			procUserAdd.setDate("JoinDate",new java.sql.Date((DateUtility.getDateFromString(userBean.getUserJoinDate()).getTime())));
			procUserAdd.setInt("InterCom",userBean.getUserInterCom());
			procUserAdd.setBoolean("IsStayingHere",userBean.getUserIsStayingHere());
			procUserAdd.setString("Name",((MemberBean)userBean.getUserMemberBean().get(0)).getMemberName());
			//procUserAdd.setDate("DOB",new java.sql.Date(((MemberBean)userBean.getUserMemberBean().get(0)).getMemberDOB().getTime()));
			procUserAdd.setDate("DOB",new java.sql.Date((DateUtility.getDateFromString(((MemberBean)userBean.getUserMemberBean().get(0)).getMemberDOB()).getTime())));
			procUserAdd.setInt("BadgeNumber",((MemberBean)userBean.getUserMemberBean().get(0)).getMemberBadgeNumber());
			procUserAdd.setString("Wing",((MemberBean)userBean.getUserMemberBean().get(0)).getMemberWing());
			procUserAdd.setInt("FlatNumber",((MemberBean)userBean.getUserMemberBean().get(0)).getMemberFlatNumber());
			procUserAdd.setString("Mobile",((MemberBean)userBean.getUserMemberBean().get(0)).getMemberMobile());
			procUserAdd.setString("Phone",((MemberBean)userBean.getUserMemberBean().get(0)).getMemberPhone());
			procUserAdd.setInt("GenderId",((MemberBean)userBean.getUserMemberBean().get(0)).getMemberGender());
			procUserAdd.setString("RoleId","1");
			
			System.out.println("Before Resultset");
		    ResultSet rs = procUserAdd.executeQuery();
		    
		    System.out.println("Result Set = " + rs);
/*		    
		    System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
			System.out.println("SocietyId--> " + 1);
			System.out.println("Email--> " + userBean.getUserEmail());
			System.out.println("Password--> " + userBean.getUserPassword());
			System.out.println("UserTypeId--> " + DataConstants.USER_TYPE_APT_MEMBER);
			System.out.println("IsOwner--> " + userBean.getUserIsOwner());
			System.out.println("JoinDate--> " + new java.sql.Date((DateUtility.getDateFromString(userBean.getUserJoinDate()).getTime())));
			System.out.println("InterCom--> " + userBean.getUserInterCom());
			System.out.println("IsStayingHere--> " + userBean.getUserIsStayingHere());
			System.out.println("Name--> " + ((MemberBean)userBean.getUserMemberBean().get(0)).getMemberName());
			System.out.println("DOB--> " + new java.sql.Date((DateUtility.getDateFromString(((MemberBean)userBean.getUserMemberBean().get(0)).getMemberDOB()).getTime())));
			System.out.println("BadgeNumber--> " + ((MemberBean)userBean.getUserMemberBean().get(0)).getMemberBadgeNumber());
			System.out.println("Wing--> " + ((MemberBean)userBean.getUserMemberBean().get(0)).getMemberWing());
			System.out.println("FlatNumber--> " + ((MemberBean)userBean.getUserMemberBean().get(0)).getMemberFlatNumber());
			System.out.println("Mobile--> " + ((MemberBean)userBean.getUserMemberBean().get(0)).getMemberMobile());
			System.out.println("Phone--> " + ((MemberBean)userBean.getUserMemberBean().get(0)).getMemberPhone());
			System.out.println("GenderId--> " + ((MemberBean)userBean.getUserMemberBean().get(0)).getMemberGender());
			System.out.println("RoleId--> " + "1");
			System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
*/		    
		    //System.out.println(userBean.getUserEmail());
		    
		    while (rs.next())
		    {
		    	System.out.println("Status "+ rs.getInt("Status"));
		    	returnStatus=rs.getInt("Status");
		    }
		} 
		catch (SQLException ex) 
		{
			ex.printStackTrace();
			System.out.println("Exception in MyNumbersHandler  = "+ex);
        	logger.error("Exception in MyNumbersHandler  = " + ex);
        	throw new UserRegistrationFailedException();
		}
		catch (Exception e)
		{
			 System.out.println("Exception = " + e.getMessage());
			 e.printStackTrace();
		}
		return returnStatus;
	}
	
	public int  createMember(UserBean userBean) throws MemberRegistrationFailedException
	{
		int returnStatus=0; 
		
		try 
		{
			//String encryptedPassword = encrypter.encrypt(password);
			//String activationKey = createRandomString();
			
			Connection con = DatabaseConnection.getConnection();	
			CallableStatement procMemberAdd=null;
			
			procMemberAdd = con.prepareCall("{ call uspAddMembers(?,?,?,?,?,?,?,?,?,?,?,?)}");
		    
			procMemberAdd.setInt("UserId",1);
			procMemberAdd.setInt("SocietyId",1);
			procMemberAdd.setInt("RelationId",1);
			procMemberAdd.setString("Name",((MemberBean)userBean.getUserMemberBean().get(0)).getMemberName());
			
			//procMemberAdd.setDate("DOB",new java.sql.Date(((MemberBean)userBean.getUserMemberBean().get(0)).getMemberDOB().getTime()));
			procMemberAdd.setDate("DOB",new java.sql.Date((DateUtility.getDateFromString(((MemberBean)userBean.getUserMemberBean().get(0)).getMemberDOB()).getTime())));			
			
			procMemberAdd.setInt("GenderId",((MemberBean)userBean.getUserMemberBean().get(0)).getMemberGender());
			procMemberAdd.setInt("BadgeNumber",((MemberBean)userBean.getUserMemberBean().get(0)).getMemberBadgeNumber());
			procMemberAdd.setString("Wing",((MemberBean)userBean.getUserMemberBean().get(0)).getMemberWing());
			procMemberAdd.setInt("FlatNumber",((MemberBean)userBean.getUserMemberBean().get(0)).getMemberFlatNumber());
			procMemberAdd.setString("Mobile",((MemberBean)userBean.getUserMemberBean().get(0)).getMemberMobile());
			procMemberAdd.setString("Phone",((MemberBean)userBean.getUserMemberBean().get(0)).getMemberPhone());
			procMemberAdd.setString("Email",((MemberBean)userBean.getUserMemberBean().get(0)).getMemberEmail());
			
			System.out.println("Before Resultset");
		    ResultSet rs = procMemberAdd.executeQuery();
		    
		    System.out.println("Result Set = " + rs);
		    
		    //System.out.println(userBean.getUserEmail());
		    
		    while (rs.next())
		    {
		    	System.out.println("Status "+ rs.getInt("Status"));
		    	returnStatus=rs.getInt("Status");
		    }
		} 
		catch (SQLException ex) 
		{
			ex.printStackTrace();
			System.out.println("Exception in MyNumbersHandler  = "+ex);
        	logger.error("Exception in MyNumbersHandler  = " + ex);
        	throw new MemberRegistrationFailedException();
		}
		catch (Exception e)
		{
			 System.out.println("Exception = " + e.getMessage());
			 e.printStackTrace();
		}
		return returnStatus;
	}
	
	public ArrayList getCurrentMembers(String userId,String apartmentId){
							ArrayList memberList = new ArrayList();
		
		String sql = "SELECT ID, NAME, WING, MOBILE, CREATEDDATE,IsActive FROM MemberInformation " ;
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
				//System.out.println("Description  = " + rs.getString("Description") );
				MemberBean memberBean = new MemberBean(rs.getInt("Id"),rs.getString("Name"),rs.getString("Wing"),rs.getString("Mobile"),rs.getDate("CreatedDate"), rs.getBoolean("IsActive"));
				memberList.add(memberBean);
				count ++; 
			}
			
			rs.close();
			con.close();
			
		} 
		catch (SQLException e) 
		{
			System.out.println("SQLException" + e.toString() );
			e.printStackTrace();
		}
		return memberList ;
	}
}

