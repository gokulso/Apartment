package com.rpm.am.user;

/**
 * UserHandler
 * Handles all user activities like login, registration, password reset
 * @author Pravin
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

import org.apache.log4j.Logger;

import com.rpm.am.constants.PageNameConstants;
import com.rpm.am.constants.ParameterConstants;
import com.rpm.am.formbeans.MemberBean;
import com.rpm.am.formbeans.NoticeBean;
import com.rpm.am.util.DatabaseConnection;
import com.rpm.am.util.DateUtility;
import com.rpm.am.util.StringEncrypter;

public class NoticeHandler extends HttpServlet
{
	private static String PAGE_DEFAULT = PageNameConstants.PAGE_NOTICE_DASHBOARD;	
	private static String ERROR_MESSAGE = "errorMessage";
	
	final static Logger logger = Logger.getLogger(UserHandler.class);
	static final String encryptionScheme = StringEncrypter.DESEDE_ENCRYPTION_SCHEME;;
	static final String encryptionKey = "123456789012345678901234567890";
	static StringEncrypter  encrypter = null;
	static SecureRandom prng =null;


	
	public NoticeHandler()
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
		
		String action = "";
		String redirectPage = PAGE_DEFAULT; 

		NoticeBean noticeBean =  new NoticeBean(request);
		 
		
		action = noticeBean.getOperation() ; 
		//Check user session
		
		//Validate request
		
		//Check if user has permission to create notice
		
		boolean isAllowed = isNoticeCreationAllowed(noticeBean.getCreatedById(),noticeBean.getSocietyId());
		
		 if(action==null || action.equalsIgnoreCase(""))
		{			
			action="view";
		}
		
		System.out.println("Operation = " + action);
		logger.info("Operation = " + action);
		 
		//perform the operation
		if(!isAllowed){
			System.out.println("User not allowed to create notice");
			request.setAttribute(ERROR_MESSAGE, "You are not allowed to create notice");			
			
			redirectPage = PAGE_DEFAULT;		
			
		} else if(action.equalsIgnoreCase("view"))
		{	
			System.out.println("Inside View Notice");
			noticeBean = viewNotice(noticeBean);
			System.out.println("###########################  " + noticeBean.getHeading());
			request.setAttribute("viewNotice", noticeBean);			
			System.out.println("After View Notice");			
			redirectPage = PageNameConstants.PAGE_NOTICE_VIEW;
		}			
		else if(action.equalsIgnoreCase("create"))
		{
			System.out.println("Before Create Notice");
			int status = createNotice(noticeBean);
			System.out.println("After Create Notice");			
			redirectPage = PAGE_DEFAULT ;
		}
		else if(action.equalsIgnoreCase("update"))
		{
			System.out.println("Before UPDATE Notice");
			int status = updateNotice(noticeBean);
			System.out.println("After UPDATE Notice");			
			redirectPage = PAGE_DEFAULT ;
		}	else if(action.equalsIgnoreCase("updatePopulate"))
		{
			noticeBean = viewNotice(noticeBean);
			System.out.println("###########################  updatePopulate" + noticeBean.getHeading());
			request.setAttribute("viewNotice", noticeBean);			
			System.out.println("After updatePopulate Notice");				
			redirectPage = PageNameConstants.PAGE_NOTICE_EDIT ;
		}		
		else if(action.equalsIgnoreCase("delete"))
		{
			System.out.println("Before delete Notice");
			int status = deleteNotice(noticeBean);
			System.out.println("After delete Notice");			
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

	
	private NoticeBean viewNotice(NoticeBean noticeBean)
	{
		ArrayList noticeList = new ArrayList();
		
		String sql = "SELECT * FROM NoticeBoard where id=" + noticeBean.getId()  ;
		Connection con = DatabaseConnection.getConnection();	
		System.out.println("SQL = " + sql );
		
		try
		{
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			int count = 1 ;
		
			while(rs.next())
			{ 
				System.out.println("@@@@@@@@@@@@@ Notice  = " + rs.getString("Description") );
				noticeBean = new NoticeBean();
				noticeBean.setCategoryId(rs.getInt("NoticeTypeId"));
				noticeBean.setHeading( rs.getString("Heading"));
				noticeBean.setDescription(rs.getString("Description"));
				noticeBean.setDate(DateUtility.getDateAsStringInSqlFormat(rs.getDate(("Date")))); 
				noticeBean.setExpiryDate(DateUtility.getDateAsStringInSqlFormat(rs.getDate(("Expiry")))); 
				System.out.println("@@@@@@@@@@@@@ Notice Desc = " + rs.getString("Description") );
				
			}
			
			rs.close();
			con.close();
			
		} 
		catch (SQLException e) 
		{
			System.out.println("SQLException" + e.toString() );
			e.printStackTrace();
		}
		return noticeBean ;
	}

	/**
	 * Check if user is allowed to create notice
	 * @param createdById
	 * @param societyId
	 * @return
	 */
	private boolean isNoticeCreationAllowed(int createdById, int societyId) 
	{
		// TODO Auto-generated method stub
		return true;
	}

	/**
	 * createUser() - A simpler way of inserting an user into the database.
	 *
	 * Creates a new user with just the username, password, and email. For a more
	 * detail creation of a user, use wp_insert_user() to specify more infomation.
	 *
	 * @since 2.0.0
	 * @see wp_insert_user() More complete way to create a new user
	 * @uses $wpdb Escapes $username and $email parameters
	 *
	 * @param string $username The user's username.
	 * @param string $password The user's password.
	 * @param string $email The user's email (optional).
	 * @return int The new user's ID.
	 */
	public int  createNotice(NoticeBean noticeBean) 
	{
		int returnStatus=0;

		try 
		{
			Connection con = DatabaseConnection.getConnection();	
			CallableStatement procInsert=null;
			 
		 
			//Create prepared statement
			 	procInsert = con.prepareCall("{ call uspInsertNoticeBoard(?,?,?,?,?,?,?,?,?,?) }");
		    
		/*	 	@SocietyId Int,
				@UserId int,
				@Notice varchar(7000),
				@Expiry datetime,
				@FrequencyId int,
				@ExecuteOn	varchar(64),
				@IsPublic bit,
				@IsActive bit
		*/
				
		 	procInsert.setInt("SocietyId",noticeBean.getSocietyId());
			procInsert.setInt("UserId",noticeBean.getCreatedById());
			procInsert.setInt("NoticeTypeId",noticeBean.getCategoryId());
			procInsert.setString("Heading",noticeBean.getHeading());
			procInsert.setString("Description",noticeBean.getDescription());
			procInsert.setDate("Expiry",new java.sql.Date((DateUtility.getDateFromString(noticeBean.getExpiryDate()).getTime())));
			procInsert.setInt("FrequencyId",1);
			procInsert.setDate("ExecuteOn",new java.sql.Date((DateUtility.getDateFromString(noticeBean.getDate()).getTime())));
			procInsert.setInt("IsPublic",noticeBean.getCategoryId());
			procInsert.setInt("IsActive",1);
		       
		    
			//logger.info("Society Registration DSQL : " + insertSql);
		   procInsert.executeUpdate();
		      
		} 
		catch (SQLException e)
		{
			 System.out.println("Exception = " + e.getMessage());
			 e.printStackTrace();
		}
		catch (Exception e)
		{
			 System.out.println("Exception = " + e.getMessage());
			 e.printStackTrace();
		}
		return 1;
	}
	
	
	public int updateNotice(NoticeBean noticeBean)
	{
		int returnStatus=0;
		
		try 
		{
			Connection con = DatabaseConnection.getConnection();	
			CallableStatement procUpdate=null;
			
			procUpdate=con.prepareCall("{ call uspUpdateNoticeBoard(?,?,?,?,?,?,?,?,?,?) }");
		    
/*	 	
	@NoticeId Int,
	@UserId int,
	@NoticeTypeId int,
	@Heading varchar(255),
	@Description varchar(7000),
	@Expiry datetime,
	@FrequencyId int,
	@ExecuteOn varchar(64),
	@IsPublic bit,
	@IsActive bit

*/	
				procUpdate.setInt("NoticeId",noticeBean.getId());
				procUpdate.setInt("UserId",1);
				procUpdate.setInt("NoticeTypeId", noticeBean.getId());
				procUpdate.setString("Heading", noticeBean.getHeading());
				procUpdate.setString("Description", noticeBean.getDescription());
				procUpdate.setDate("Expiry",new java.sql.Date((DateUtility.getDateFromString(noticeBean.getDate()).getTime())));
				procUpdate.setInt("FrequencyId",1);
				procUpdate.setInt("ExecuteOn",1);
				procUpdate.setInt("IsPublic",1);
				procUpdate.setInt("IsActive",1);
			    
				//logger.info("Society Registration DSQL : " + insertSql);
				procUpdate.executeUpdate();

			String s = "call uspUpdateNoticeBoard @NoticeId = " + noticeBean.getId() + "," + 
			"@UserId = " + noticeBean.getId() + "," + 
			"@NoticeTypeId = " + noticeBean.getId() + "," + 
			"@Heading = '" + noticeBean.getHeading() + "'," +
			"@Description = '" + noticeBean.getDescription() + "'," +
			"@Expiry = '" + new java.sql.Date((DateUtility.getDateFromString(noticeBean.getDate()).getTime())) + "'," +
			"@FrequencyId = " + 1 + "," + 
			"@ExecuteOn = " + 1 + "," + 
			"@IsPublic = " + 1 + "," +
			"IsActive = " + 1;  
			
			System.out.println(s);
			      
		}
		catch (SQLException e)
		{
			 System.out.println("Exception = " + e.getMessage());
			 e.printStackTrace();
		}
		catch (Exception e)
		{
			 System.out.println("Exception = " + e.getMessage());
			 e.printStackTrace();
		}
		return 1;
	}
	
	public int  deleteNotice(NoticeBean noticeBean) 
	{
		int returnStatus=0;
	
		try 
		{
			Connection con = DatabaseConnection.getConnection();	
			CallableStatement procDelete=null;
			 
		 
			//Create prepared statement
			procDelete = con.prepareCall("{ call uspDeleteNoticeBoard(?) }");
		    
		 	
			procDelete.setInt("NoticeId",noticeBean.getId());
		
		    
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


	public ArrayList getCurrentNotice(String userId,String apartmentId)
	{
		ArrayList noticeList = new ArrayList();
		
		String sql = "SELECT * FROM NoticeBoard" ;
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
				System.out.println("Description  = " + rs.getString("Description") );
				NoticeBean bean = new NoticeBean(rs.getInt("Id"),rs.getString("Description"),rs.getString("Description"),rs.getString("Date") );
				noticeList.add(bean);
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
		return noticeList ;
	}
}

