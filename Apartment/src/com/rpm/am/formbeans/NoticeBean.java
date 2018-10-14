package com.rpm.am.formbeans;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.rpm.am.constants.ParameterConstants;
import com.rpm.am.util.NumericUtil;

public class NoticeBean extends GlobalDataBean
{
	private int id = 0;
	private int createdById = 0;
	private int societyId = 0;
	
	private String notice = "";
	private String frequencyId = "";
	private String executeOn = "";

	private int categoryId = 0;
	private String heading = "";
	private String description = "";
	private String date = "";
	private String expiryDate = "";
	
	
	public NoticeBean()
	{	
		
	}
	
	
	public NoticeBean(int noticeId, String heading, String description, String date)
	{
		super();
		this.id = noticeId;
		this.heading = heading;
		this.description = description;
		this.date = date;
	}
	
	
	public NoticeBean(int createdById, String heading, String description, String expiryDate, int categoryId)
	{
		super();
		this.createdById = createdById;
		this.heading = heading;
		this.description = description;
		this.expiryDate = expiryDate;
		this.categoryId = categoryId;
	}
	
	public NoticeBean(HttpServletRequest request)
	{
		super(request);

		try
		{
			 HttpSession session = request.getSession();
			 
			 this.createdById = NumericUtil.convertStringToInt(session.getAttribute(ParameterConstants.SEESION_USER_ID).toString());
			 this.societyId = NumericUtil.convertStringToInt(session.getAttribute(ParameterConstants.SEESION_SOCIETY_ID).toString());

			 this.heading = request.getParameter("heading");
			 this.description = request.getParameter("description");
			 this.date = (String) (request.getParameter("date"));
			 this.expiryDate = (String)(request.getParameter("expirydate"));
			 
			 if(request.getParameter("category")!=null)
			 {
				 this.categoryId =  NumericUtil.convertStringToInt(request.getParameter("category"));
			 }

			 if(request.getParameter("id")!=null)
			 {
				 this.id =  NumericUtil.convertStringToInt(request.getParameter("id"));
			 }
			 
			 this.id =  NumericUtil.convertStringToInt(request.getParameter("id"));
			 
		}
		catch (Exception e)
		{
			 System.out.println("Exception while parsing request "+ e.toString()); 
			 e.printStackTrace();
		}
	}

	public int getId() 
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	/**
	 * @return the createdById
	 */
	public int getCreatedById() {
		return createdById;
	}
	/**
	 * @param createdById the createdById to set
	 */
	public void setCreatedById(int createdById) {
		this.createdById = createdById;
	}
	/**
	 * @return the headline
	 */
	public String getHeading() {
		return heading;
	}
	/**
	 * @param headline the headline to set
	 */
	public void setHeading(String heading) {
		this.heading = heading;
	}
	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}
	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}
	/**
	 * @return the expiryDate
	 */
	public String getExpiryDate() 
	{
		return expiryDate;
	}
	/**
	 * @param expiryDate the expiryDate to set
	 */
	public void setExpiryDate(String expiryDate)
	{
		this.expiryDate = expiryDate;
	}
	
	
	
	/**
	 * @return the date
	 */
	public String getDate() {
		return date;
	}


	/**
	 * @param date the date to set
	 */
	public void setDate(String date) {
		this.date = date;
	}


	/**
	 * @return the categoryId
	 */
	public int getCategoryId()
	{
		return categoryId;
	}
	/**
	 * @param categoryId the categoryId to set
	 */
	public void setCategoryId(int categoryId)
	{
		this.categoryId = categoryId;
	}


	public int getSocietyId() {
		return societyId;
	}


	public void setSocietyId(int societyId) {
		this.societyId = societyId;
	}
}
