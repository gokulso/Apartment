package com.rpm.am.formbeans;

import java.text.SimpleDateFormat;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

public class MemberBean 
{
	private	 int member_id	= 0;
	private  int member_relationid	= 0;
	private  String member_name	= "";
	
	//private  java.util.Date member_dob = null;
	private  String member_dob = "";
	private int member_gender	=0;
	private  int member_badgenumber	=0;
	private  String member_wing	= "";
	private  int member_flatnumber	=0;
	private  String member_mobile	="";
	private  String member_phone= "";
	private  String member_email	= "";
	private  boolean member_isactive = false;
	private Date ceateDate;
	 
	public MemberBean(HttpServletRequest request)
	{
		 try
		 {
			 if(request.getParameter("member_id")!=null)
				 this.member_id	= Integer.parseInt(request.getParameter("member_id"));
			 
			 if(request.getParameter("member_relationid")!=null)
				 this.member_relationid	= Integer.parseInt(request.getParameter("member_relationid"));
			 
			 this.member_name=request.getParameter("member_name");
			
			 //SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			 	//this.member_dob = sdf.parse((String)(request.getParameter("member_dob")));
			 
			 this.member_dob = (String)(request.getParameter("member_dob"));
			 
			 if(request.getParameter("member_gender")!=null)
			 this.member_gender =  Integer.parseInt(request.getParameter("member_gender"));
			 
			 if(request.getParameter("member_badgenumber")!=null)
				 this.member_badgenumber=Integer.parseInt(request.getParameter("member_badgenumber"));
			 
			 this.member_wing=request.getParameter("member_wing");
			 
			 if(request.getParameter("member_flatnumber")!=null)
				 this.member_flatnumber	=Integer.parseInt(request.getParameter("member_flatnumber"));
			 
			 this.member_mobile	= request.getParameter("member_mobile");
			 this.member_phone = request.getParameter("member_phone");
			 this.member_email = request.getParameter("member_email");
			 this.member_isactive = Boolean.parseBoolean(request.getParameter("member_isactive"));
		 }
		 catch (Exception e)
		 {
			 System.out.println("Exception while parsing request "+ e.toString()); 
			 e.printStackTrace();
		 }
	 }

	/**
	 * Default Constructor
	 */
	public MemberBean() {
		// TODO Auto-generated constructor stub
	}
	
	/**
	 *  Constructor to setDate from MemberInformation
	 */
	public MemberBean(int id, String name,String wing, int flatno,String mobile, Date date, boolean IsActive) {
		this.member_id = id;
		this.member_name = name;
		this.member_wing = wing;
		this.member_flatnumber = flatno;
		this.member_mobile = mobile;
		this.ceateDate = date;
		this.member_isactive = IsActive;
	}
	
	

	/**
	 * @return the member_id
	 */
	public int getMemberId() 
	{
		return member_id;
	}

	/**
	 * @param member_id the member_id to set
	 */
	public void setMemberId(int member_id) {
		this.member_id = member_id;
	}

	/**
	 * @return the member_relationid
	 */
	public int getMemberRelationId() {
		return member_relationid;
	}

	/**
	 * @param member_relationid the member_relationid to set
	 */
	public void setMemberRelationId(int member_relationid) {
		this.member_relationid = member_relationid;
	}

	/**
	 * @return the member_name
	 */
	public String getMemberName() 
	{
		return member_name;
	}

	/**
	 * @param member_name the member_name to set
	 */
	public void setMemberName(String member_name) {
		this.member_name = member_name;
	}

	/**
	 * @return the member_dob
	 */
	public String getMemberDOB() {
		return member_dob;
	}

	/**
	 * @param member_dob the member_dob to set
	 */
	public void setMemberDOB(String member_dob) {
		this.member_dob = member_dob;
	}

	
	
	/**
	 * @return the member_gender
	 */
	public int getMemberGender() {
		return member_gender;
	}

	/**
	 * @param member_gender the member_gender to set
	 */
	public void setMemberGender(int member_gender) {
		this.member_gender = member_gender;
	}

	/**
	 * @return the member_badgenumber
	 */
	public int getMemberBadgeNumber() {
		return member_badgenumber;
	}

	/**
	 * @param member_badgenumber the member_badgenumber to set
	 */
	public void setMemberBadgeNumber(int member_badgenumber) {
		this.member_badgenumber = member_badgenumber;
	}

	/**
	 * @return the member_wing
	 */
	public String getMemberWing() {
		return member_wing;
	}

	/**
	 * @param member_wing the member_wing to set
	 */
	public void setMemberWing(String member_wing) {
		this.member_wing = member_wing;
	}

	/**
	 * @return the member_flatnumber
	 */
	public int getMemberFlatNumber() {
		return member_flatnumber;
	}

	/**
	 * @param member_flatnumber the member_flatnumber to set
	 */
	public void setMemberFlatNumber(int member_flatnumber) {
		this.member_flatnumber = member_flatnumber;
	}

	/**
	 * @return the member_mobile
	 */
	public String getMemberMobile() {
		return member_mobile;
	}

	/**
	 * @param member_mobile the member_mobile to set
	 */
	public void setMemberMobile(String member_mobile) {
		this.member_mobile = member_mobile;
	}

	/**
	 * @return the member_phone
	 */
	public String getMemberPhone() {
		return member_phone;
	}

	/**
	 * @param member_phone the member_phone to set
	 */
	public void setMemberPhone(String member_phone) {
		this.member_phone = member_phone;
	}

	/**
	 * @return the member_email
	 */
	public String getMemberEmail() {
		return member_email;
	}

	/**
	 * @param member_email the member_email to set
	 */
	public void setMemberEmail(String member_email) {
		this.member_email = member_email;
	}

	/**
	 * @return the member_isactive
	 */
	public boolean getMemberIsActive() {
		return member_isactive;
	}

	/**
	 * @param member_isactive the member_isactive to set
	 */
	public void setMemberIsActive(boolean member_isactive) {
		this.member_isactive = member_isactive;
	}

	public Date getCeateDate() {
		return ceateDate;
	}

	public void setCeateDate(Date ceateDate) {
		this.ceateDate = ceateDate;
	}
}
