package com.rpm.am.formbeans;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.rpm.am.constants.ParameterConstants;
import com.rpm.am.util.NumericUtil;

public class ComplaintBean 
{
	
	private int createdById =0;
	private int societyId = 0;
	
	private int id = 0;
	private String subject = "";
	private String description = "";
	private String vendorTypeId = "";
	private String createdDate = "";
	
	public ComplaintBean()
	{
		
	}
	
	public ComplaintBean(HttpServletRequest request)
	{
		try
		{
			HttpSession session = request.getSession();
			
			this.subject = request.getParameter("subject");
			this.description = request.getParameter("description");
			this.vendorTypeId = request.getParameter("vendorTypeId");
			this.id = NumericUtil.convertStringToInt(request.getParameter("id"));
			
		}
		catch (Exception e)
		{
			 System.out.println("Exception while parsing request "+ e.toString()); 
			 e.printStackTrace();
		}
	}
	
	public ComplaintBean(String subject,String description, String vendorTypeId)
	{
		this.subject = subject;
		this.description = description;
		this.vendorTypeId = vendorTypeId;
	}
	
	public ComplaintBean(int id,String subject, String createdDate)
	{
		this.id = id;
		this.subject = subject;
		this.createdDate = createdDate;
	}

	
	public int getCreatedById() {
		return createdById;
	}


	public void setCreatedById(int createdById) {
		this.createdById = createdById;
	}


	public int getSocietyId() {
		return societyId;
	}


	public void setSocietyId(int societyId) {
		this.societyId = societyId;
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getVendorTypeId() {
		return vendorTypeId;
	}

	public void setVendorTypeId(String vendorTypeId) {
		this.vendorTypeId = vendorTypeId;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	
}
