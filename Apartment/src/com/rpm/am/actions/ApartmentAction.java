/**
 * 
 */
package com.rpm.am.actions;

import java.io.IOException;
import java.sql.Connection;
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

import com.rpm.am.formbeans.SocietyBean;
import com.rpm.am.society.SocietyHandler;
/*import com.rpm.am.exceptions.ApartmentRegistrationFailedException;
import com.rpm.am.formbeans.ApartmentBean;
import com.rpm.am.society.ApartmentHandler;*/
import com.rpm.am.util.DatabaseConnection;

/**
 * @author Admin
 *
 */
public class ApartmentAction extends HttpServlet {
	
	final static Logger logger = Logger.getLogger(ApartmentAction.class);
	private static String PAGE_DEFAULT = "../apartment/index.jsp";	
	private static String ERROR_MESSAGE = "errorMessage";
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		
		SocietyHandler handler = new SocietyHandler();

		String action = request.getParameter("operation");
		String redirectPage = PAGE_DEFAULT;
		boolean result = false ;
		 
		if (action == null || action.equalsIgnoreCase("")) {
			action = "apartmenrBasicInfo";
		}
		
		System.out.println("Operation = " + action);
		logger.info("Operation = " + action);
		SocietyBean apartmentBean =  new SocietyBean(request);
		
		System.out.println("Aparment Name = " + apartmentBean.getSocietyName());
		request.setAttribute(ERROR_MESSAGE, "Testing apartmentBean values" + apartmentBean.getSocietyName());	
		
		boolean actionResult = false ;
		if (action.equalsIgnoreCase("registerApt")) {

			//actionResulthandler.registerApartment(apartmentBean);

		} else if (action.equalsIgnoreCase("confirmApt")) {

			//handler.confirmApartment(apartmentBean);

		} else if (action.equalsIgnoreCase("deleteApt")) {

			//handler.deleteApartment(apartmentBean);

		}
		
		try {

			RequestDispatcher disp = request.getRequestDispatcher(redirectPage);
			disp.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
