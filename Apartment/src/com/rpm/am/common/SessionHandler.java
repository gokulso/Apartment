package com.rpm.am.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;


public class SessionHandler {
	
	final static Logger logger = Logger.getLogger(SessionHandler.class);
	
	
	/**
	 * Check is user session is active or not
	 * Check for userId attribute is session
	 * @param request
	 * @param response
	 * @return boolean
	 */
	public static boolean isActiveSession(HttpServletRequest request, HttpServletResponse response){
		
		boolean result = false ;
		HttpSession userSession = null ;
		userSession = request.getSession();
		
		if(userSession!=null){		
			if(userSession.getAttribute("s_userId")!= null ){				
				result = true;
				
				System.out.println("Session active for user  = " + userSession.getAttribute("s_userId").toString());
				logger.info("Session active for user  = " + userSession.getAttribute("s_userId").toString());
				
			}else{
				result = false;
				System.out.println("No Active Session");
				logger.info("No Active Session");				
			}			
		}		
		return result;
	}
	

}
