package com.rpm.am.vendor;

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

import com.rpm.am.exceptions.VendorRegistrationFailedException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.rpm.am.constants.DataConstants;
import com.rpm.am.constants.PageNameConstants;
import com.rpm.am.formbeans.MemberBean;
import com.rpm.am.formbeans.SocietyBean;
import com.rpm.am.formbeans.UserBean;
import com.rpm.am.formbeans.VendorBean;
import com.rpm.am.util.ApartmentUtil;
 
import com.rpm.am.util.DatabaseConnection;
import com.rpm.am.util.EmailSender;
import com.rpm.am.util.StringEncrypter;
import com.rpm.am.util.StringEncrypter.EncryptionException;
import java.util.*;
import java.sql.Date;

public class VendorHandler extends HttpServlet
{
	private static String PAGE_DEFAULT = "../vendor/index.jsp";	
	private static String ERROR_MESSAGE = "errorMessage";
	
	final static Logger logger = Logger.getLogger(VendorHandler.class);
	static final String encryptionScheme = StringEncrypter.DESEDE_ENCRYPTION_SCHEME;;
	static final String encryptionKey = "123456789012345678901234567890";
	static StringEncrypter  encrypter = null;
	static SecureRandom prng =null;
	
	

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
	
	public VendorHandler()
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

		VendorBean vendorBean = new VendorBean(request);
		
		//Check user session
		
		//Validate request
		
		if(action==null || action.equalsIgnoreCase(""))
		{			
			action="login";
		}
		
		System.out.println("Operation = " + action);
		logger.info("Operation = " + action);
				
		if(action.equalsIgnoreCase("registerVendor"))
		{
			
			try
			{
				//int status = 
				createVendor(vendorBean);
				
				//logger.info("Satus :  "+status);
				/*
				if(status==0)
				{
					//Send confirmation email
					//sendConfirmationEmail(userData.getUserName(),userData.getUserEmail(),activationKey);
					request.setAttribute(ERROR_MESSAGE, "Please check your email and click on the activation link to complete the registration.");	
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
				*/
			}
			catch(Exception e)
			{}
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

	public void  createVendor(VendorBean vendorBean) throws VendorRegistrationFailedException
	{
		//int returnStatus=0; 
		
		try 
		{
			
			//String encryptedPassword = encrypter.encrypt(password);
			//String activationKey = createRandomString();
			
			Connection con = DatabaseConnection.getConnection();	
			CallableStatement procVendorAdd = null;
			
			procVendorAdd = con.prepareCall("{ call uspAddVendor(?,?,?,?,?,?,?,?,?,?)}");
		    
			procVendorAdd.setInt("SocietyId",ApartmentUtil.getSocietyId());
			procVendorAdd.setString("Name",vendorBean.getVendorName());
			procVendorAdd.setInt("GenderId",vendorBean.getVendorGender());
			procVendorAdd.setInt("BadgeNumber",vendorBean.getVendorBadgenumber());
			procVendorAdd.setString("Wing",vendorBean.getVendorWing());
			procVendorAdd.setInt("ShopNumber",vendorBean.getVendorShopnumber());
			procVendorAdd.setString("Mobile",vendorBean.getVendorMobile());
			procVendorAdd.setString("Phone",vendorBean.getVendorPhone());
			procVendorAdd.setString("Email",vendorBean.getVendorEmail());
			procVendorAdd.setInt("VendorTypeId",vendorBean.getVendorTypeId());
			//procVendorAdd.setDate("CreatedDate",new java.sql.Date(vendorBean.getVendorCreateddate().getTime()));
			
			System.out.println("Before Resultset");
			
			System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
			System.out.println("SocietyId--> " + ApartmentUtil.getSocietyId());
			System.out.println("Name--> " + vendorBean.getVendorName());
			System.out.println("GenderId--> " + vendorBean.getVendorGender());
			System.out.println("BadgeNumber--> " + vendorBean.getVendorBadgenumber());
			System.out.println("Wing--> " + vendorBean.getVendorWing());
			System.out.println("ShopNumber--> " + vendorBean.getVendorShopnumber());
			System.out.println("Mobile--> " + vendorBean.getVendorMobile());
			System.out.println("Phone--> " + vendorBean.getVendorPhone());
			System.out.println("Email--> " + vendorBean.getVendorEmail());
			System.out.println("VendorTypeId--> " + vendorBean.getVendorTypeId());
			System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
			
			
		    //ResultSet rs;
			
		    procVendorAdd.execute();
		    
		    //System.out.println("Result Set = " + rs);
		    
		    //System.out.println(userBean.getUserEmail());
		    
		    /*
		    while (rs.next())
		    {
		    	System.out.println("Status "+ rs.getInt("Status"));
		    	returnStatus=rs.getInt("Status");
		    }
			*/
			 
		} 
		catch (SQLException ex) 
		{
			ex.printStackTrace();
			System.out.println("Exception in MyNumbersHandler  = "+ex);
        	logger.error("Exception in MyNumbersHandler  = " + ex);
        	throw new VendorRegistrationFailedException();
		}
	      
		//return returnStatus;
	}

}

