
package com.rpm.am.formbeans;

import java.text.DateFormat;
//import java.util.Date;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

public class VendorBean 
{
	private  String vendor_name	= "";
	private int vendor_gender	=0;
	private  int vendor_badgenumber	=0;
	private  String vendor_wing	= "";
	private  int vendor_shopnumber	=0;
	private  String vendor_mobile	="";
	private  String vendor_phone= "";
	private  String vendor_email	= "";
	private int vendor_typeid	= 0;
	private java.util.Date vendor_createddate = null;
	private boolean vendor_isactive	=false;
	
	public VendorBean()
	{
	}
	
	public VendorBean(HttpServletRequest request)
	{
		try
		{
			this.vendor_name=request.getParameter("vendor_name");
			this.vendor_gender =  Integer.parseInt(request.getParameter("vendor_gender"));
			
			if(request.getParameter("vendor_badgenumber")!=null)
				 this.vendor_badgenumber=Integer.parseInt(request.getParameter("vendor_badgenumber"));
			 
			this.vendor_wing=request.getParameter("vendor_wing");
			
			if(request.getParameter("vendor_shopnumber")!=null)
				 this.vendor_shopnumber=Integer.parseInt(request.getParameter("vendor_shopnumber"));
			
			this.vendor_mobile	=request.getParameter("vendor_mobile");
			this.vendor_phone=request.getParameter("vendor_phone");
			this.vendor_email=request.getParameter("vendor_email");
			
			if(request.getParameter("vendor_typeid")!=null)
				this.vendor_typeid	=Integer.parseInt(request.getParameter("vendor_typeid"));
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		 		this.vendor_createddate		= sdf.parse((String)(request.getParameter("vendor_createddate")));
		 	
   		    this.vendor_isactive = Boolean.parseBoolean(request.getParameter("vendor_isactive"));
			
		}
		catch(Exception e)
		{
			System.out.println("Exception while parsing request "+ e.toString()); 
			e.printStackTrace();
		}
	}

	public String getVendorName() {
		return vendor_name;
	}

	public void setVendorName(String vendor_name) {
		this.vendor_name = vendor_name;
	}

	public int getVendorGender() {
		return vendor_gender;
	}

	public void setVendorGender(int vendor_gender) {
		this.vendor_gender = vendor_gender;
	}

	public int getVendorBadgenumber() {
		return vendor_badgenumber;
	}

	public void setVendorBadgenumber(int vendor_badgenumber) {
		this.vendor_badgenumber = vendor_badgenumber;
	}

	public String getVendorWing() {
		return vendor_wing;
	}

	public void setVendorWing(String vendor_wing) {
		this.vendor_wing = vendor_wing;
	}

	public int getVendorShopnumber() {
		return vendor_shopnumber;
	}

	public void setVendorShopnumber(int vendor_shopnumber) {
		this.vendor_shopnumber = vendor_shopnumber;
	}

	public String getVendorMobile() {
		return vendor_mobile;
	}

	public void setVendorMobile(String vendor_mobile) {
		this.vendor_mobile = vendor_mobile;
	}

	public String getVendorPhone() {
		return vendor_phone;
	}

	public void setVendorPhone(String vendor_phone) {
		this.vendor_phone = vendor_phone;
	}

	public String getVendorEmail() {
		return vendor_email;
	}

	public void setVendorEmail(String vendor_email) {
		this.vendor_email = vendor_email;
	}

	public int getVendorTypeId() {
		return vendor_typeid;
	}

	public void setVendorTypeId(int vendor_typeid) {
		this.vendor_typeid = vendor_typeid;
	}

	public java.util.Date getVendorCreateddate() {
		return vendor_createddate;
	}

	public void setVendorCreateddate(java.util.Date vendor_createddate) {
		this.vendor_createddate = vendor_createddate;
	}

	public boolean isVendorIsactive() {
		return vendor_isactive;
	}

	public void setVendorIsactive(boolean vendor_isactive) {
		this.vendor_isactive = vendor_isactive;
	}

}
