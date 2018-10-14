package com.rpm.am.formbeans;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

public class SocietyBean extends UserBean 
{
	private	int society_id =0;	
	private	String society_name	="";
	private	String society_address1	="";
	private	String society_address2	="";
	private	int society_cityid	=0;
	private	String society_mobile	="";
	private	String society_phone	="";
	private	String society_email	="";
	private	String society_website	="";
	private	boolean society_isactive	= false;
	
	//private ArrayList memberBean = new ArrayList();
	
	
	public SocietyBean(HttpServletRequest request)
	{
		//super(request);
		
		if (request.getParameter("society_id") !=null)
			this.society_id =Integer.parseInt(request.getParameter("society_id"));
		
		this.society_name=request.getParameter("society_name");
		this.society_address1	=request.getParameter("society_address1");
		this.society_address2	=request.getParameter("society_address2");
		
		if (request.getParameter("society_cityid") !=null)
			this.society_cityid	=Integer.parseInt(request.getParameter("society_cityid"));
		
		this.society_mobile	=request.getParameter("society_mobile");
		this.society_phone	=request.getParameter("society_phone");
		this.society_email	=request.getParameter("society_email");
		this.society_website	=request.getParameter("society_website");
		
		this.society_isactive	=Boolean.parseBoolean(request.getParameter("society_isactive"));
		
		//MemberBean member = new MemberBean(request);
		//this.memberBean.add(member);
	}
	
	
	public SocietyBean() 
	{
		super();
	}


	/**
	 * @return the apartment_Id
	 */
	public int getSocietyId() {
		return society_id;
	}


	/**
	 * @param apartment_Id the apartment_Id to set
	 */
	public void setSocietyId(int society_id) {
		society_id = society_id;
	}


	/**
	 * @return the apartment_Name
	 */
	public String getSocietyName() {
		return society_name;
	}


	/**
	 * @param apartment_Name the apartment_Name to set
	 */
	public void setSocietyName(String society_name) {
		society_name = society_name;
	}


	/**
	 * @return the apartment_Address1
	 */
	public String getSocietyAddress1() {
		return society_address1;
	}


	/**
	 * @param apartment_Address1 the apartment_Address1 to set
	 */
	public void setSocietyAddress1(String society_address1) {
		society_address1 = society_address1;
	}


	/**
	 * @return the apartment_Address2
	 */
	public String getSocietyAddress2() {
		return society_address2;
	}


	/**
	 * @param apartment_Address2 the apartment_Address2 to set
	 */
	public void setSocietyAddress2(String society_address2) {
		society_address2 = society_address2;
	}


	/**
	 * @return the apartment_CityId
	 */
	public int getSocietyCityId() {
		return society_cityid;
	}


	/**
	 * @param apartment_CityId the apartment_CityId to set
	 */
	public void setSocietyCityId(int society_cityid) {
		society_cityid = society_cityid;
	}


	/**
	 * @return the apartment_Mobile
	 */
	public String getSocietyMobile() {
		return society_mobile;
	}


	/**
	 * @param apartment_Mobile the apartment_Mobile to set
	 */
	public void setSocietyMobile(String society_mobile) {
		society_mobile = society_mobile;
	}


	/**
	 * @return the apartment_Phone
	 */
	public String getSocietyPhone() {
		return society_phone;
	}


	/**
	 * @param apartment_Phone the apartment_Phone to set
	 */
	public void setSocietyPhone(String society_phone) {
		society_phone = society_phone;
	}


	/**
	 * @return the apartment_Email
	 */
	public String getSocietyEmail() {
		return society_email;
	}


	/**
	 * @param apartment_Email the apartment_Email to set
	 */
	public void setSocietyEmail(String society_email) {
		society_email = society_email;
	}


	/**
	 * @return the apartment_Website
	 */
	public String getSocietyWebsite() {
		return society_website;
	}


	/**
	 * @param apartment_Website the apartment_Website to set
	 */
	public void setSocietyWebsite(String society_website) {
		society_website = society_website;
	}


	/**
	 * @return the apartment_IsActive
	 */
	public boolean isSocietyIsActive() {
		return society_isactive;
	}


	/**
	 * @param apartment_IsActive the apartment_IsActive to set
	 */
	public void setSocietyIsActive(boolean society_isactive) {
		society_isactive = society_isactive;
	}
	
	/**
	 * @return the user_MemberBean
	 */
	//public ArrayList getUserMemberBean() {
	//	return memberBean;
	//}
	/**
	 * @param user_MemberBean the user_MemberBean to set
	 */
	//public void setUserMemberBean(ArrayList memberBean) {
	//	this.memberBean = memberBean;
	//}
	

 	
	
}
