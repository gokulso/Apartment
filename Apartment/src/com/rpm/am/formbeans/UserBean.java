
package com.rpm.am.formbeans;
import java.text.DateFormat;


import java.text.SimpleDateFormat;
import java.util.ArrayList;


//import java.util.Date;

//import java.sql.Date;

import javax.servlet.http.HttpServletRequest;

public class UserBean 
{
 
	private int user_id = 0;
	
	private String user_email = "";
	private String user_password = "";
	private String user_newpassword = "";

	private int user_typeid	= 0;
	private boolean user_isowner = false;
	//private java.util.Date user_joindate = null;
	private String user_joindate = "";
	private int user_intercom = 0;
	private boolean user_isstayinghere = false;
	private boolean user_isactive = false;
	
	private int rememberme = 0; 
	
	
	
	private ArrayList user_MemberBean = new ArrayList();

	public UserBean()
	{
	}
	
	public UserBean(HttpServletRequest request)
	{
		 try
		 {
			 if(request.getParameter("user_id")!=null)
				this.user_id = Integer.parseInt(request.getParameter("user_id"));
			 
			 this.user_email = request.getParameter("user_email");
			 this.user_password	= request.getParameter("user_password");
			 this.user_newpassword=request.getParameter("user_newpassword");
			 
			 if(request.getParameter("user_typeid")!=null)
				this.user_typeid = Integer.parseInt(request.getParameter("user_typeid"));
			 
			 this.user_isowner = Boolean.parseBoolean(request.getParameter("user_isowner"));
			 
			 //SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			 	//this.user_joindate = sdf.parse((String)(request.getParameter("user_joindate")));	 
			 this.user_joindate = (String)(request.getParameter("user_joindate"));
			
			 if(request.getParameter("user_intercom")!=null)
				this.user_intercom	=Integer.parseInt(request.getParameter("user_intercom"));

			 this.user_isstayinghere = Boolean.parseBoolean(request.getParameter("user_isstayinghere"));
			 this.user_isactive = Boolean.parseBoolean(request.getParameter("user_isactive"));
			 
			 
			 
			 
			 
			 MemberBean user_member = new MemberBean(request);
			 	this.user_MemberBean.add(user_member);
		 
		 }
		 catch (Exception e)
		 {
			 System.out.println("Exception while parsing request "+ e.toString()); 
			 e.printStackTrace();
		 }
	}
/*
	 	java.util.Date utilDate = new java.util.Date();
	 
	 	java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
	    
	     System.out.println("utilDate:" + utilDate);
	     System.out.println("sqlDate:" + sqlDate);
	 
*/

	/**
	 * @return the user_id
	 */
	public int getUserId() {
		return user_id;
	}



	/**
	 * @param user_id the user_id to set
	 */
	public void setUserId(int user_id)
	{
		this.user_id = user_id;
	}



	/**
	 * @return the user_email
	 */
	public String getUserEmail() {
		return user_email;
	}



	/**
	 * @param user_email the user_email to set
	 */
	public void setUserEmail(String user_email) {
		this.user_email = user_email;
	}



	/**
	 * @return the user_password
	 */
	public String getUserPassword() {
		return user_password;
	}



	/**
	 * @param user_password the user_password to set
	 */
	public void setUserPassword(String user_password) {
		this.user_password = user_password;
	}



	/**
	 * @return the user_newpassword
	 */
	public String getUserNewPassword() {
		return user_newpassword;
	}
	/**
	 * @param user_newpassword the user_newpassword to set
	 */
	public void setUserNewPassword(String user_newpassword) {
		this.user_newpassword = user_newpassword;
	}
	/**
	 * @return the user_typeid
	 */
	public int getUserUserTypeId() {
		return user_typeid;
	}



	/**
	 * @param user_typeid the user_typeid to set
	 */
	public void setUserUserTypeId(int user_typeid) {
		this.user_typeid = user_typeid;
	}



	/**
	 * @return the user_isowner
	 */
	public boolean getUserIsOwner() {
		return user_isowner;
	}



	/**
	 * @param user_isowner the user_isowner to set
	 */
	public void setUserIsOwner(boolean user_isowner) {
		this.user_isowner = user_isowner;
	}

 
	/**
	 * @return the user_joindate
	 */
	public String getUserJoinDate() {
		return user_joindate;
	}



	/**
	 * @param user_joindate the user_joindate to set
	 */
	public void setUserJoinDate(String user_joindate) {
		this.user_joindate = user_joindate;
	}



	/**
	 * @return the user_intercom
	 */
	public int getUserInterCom() {
		return user_intercom;
	}



	/**
	 * @param user_intercom the user_intercom to set
	 */
	public void setUserInterCom(int user_intercom) {
		this.user_intercom = user_intercom;
	}



	/**
	 * @return the user_isstayinghere
	 */
	public boolean getUserIsStayingHere() {
		return user_isstayinghere;
	}



	/**
	 * @param user_isstayinghere the user_isstayinghere to set
	 */
	public void setUserIsStayingHere(boolean user_isstayinghere) {
		this.user_isstayinghere = user_isstayinghere;
	}



	/**
	 * @return the user_isactive
	 */
	public boolean getUserIsActive() {
		return user_isactive;
	}

	/**
	 * @param user_isactive the user_isactive to set
	 */
	public void setUserIsActive(boolean user_isactive) {
		this.user_isactive = user_isactive;
	}
	
	/**
	 * @return the user_MemberBean
	 */
	public ArrayList getUserMemberBean() {
		return user_MemberBean;
	}
	/**
	 * @param user_MemberBean the user_MemberBean to set
	 */
	public void setUserMemberBean(ArrayList user_MemberBean) {
		this.user_MemberBean = user_MemberBean;
	}
	
	public Object getRememberMe()
	{
		return null;//TODO
	}
}
