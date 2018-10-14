package com.rpm.am.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Utility functions for Date and Time
 * 
 * @author Pravin
 *
 */
public class DateUtility {
	

	
	/**
	 * Date format EEE, MMM dd yyyy, hh:mm:ss  
	 * Example : Sun, Sep 06 2009, 08:32:51 
	 */
	public static final DateFormat Format_EEE_MMM_dd_yyyy_comma= new SimpleDateFormat("EEE, MMM dd yyyy");
	
	
	
	/**
	 * Date format dd-MM-yyyy
	 * Example : 30-12-2006
	 */
	public static final DateFormat Format_ddMMyyyy_dash = new SimpleDateFormat("dd-MM-yyyy");
	public static final DateFormat Format_ddMMyyyy_slash = new SimpleDateFormat("dd/MM/yyyy"); 
	
	/**
	 * Date format: yyyy-MM-dd
	 * Example : 30-12-2006
	 * Uses : Util date format
	 */
	public static final DateFormat Format_utilDate_ddMMyyyy = new SimpleDateFormat("dd-MM-yyyy");
	
	/**
	 * Date format: yyyy-MM-dd
	 * Example : 30-December-2009
	 * Uses : Blog url format
	 */
	public static final DateFormat Format_utilDate_ddMMMMyyyy_dash = new SimpleDateFormat("dd-MMMMM-yyyy");
	
	/**
	 * Date format: yyyy-MM-dd
	 * Example : 30 December, 2009
	 * Uses : Blog title format
	 */
	public static final DateFormat Format_utilDate_ddMMMMyyyy_comma = new SimpleDateFormat("dd MMMMM, yyyy");
	
	public static final DateFormat Format_ddMMMyyyy_dash = new SimpleDateFormat("dd-MMM-yyyy");
	public static final DateFormat Format_ddMMMyyyy_slash = new SimpleDateFormat("dd/MMM/yyyy");
	 
	/**
	 * Date format: yyyy-MM-dd
	 * Example : 2006-12-30
	 * Uses : SQL date format
	 */
	public static final DateFormat Format_yyyyMMdd_dash = new SimpleDateFormat("yyyy-MM-dd");	
	public static final DateFormat Format_sqlDate_yyyyMMdd = new SimpleDateFormat("yyyy-MM-dd");

	/**
	 * Date format : yyyy/MM/dd
	 * Example : 2006/12/30
	 * Uses : Format used in South Africa Powerball feed
	 */
	public static final DateFormat Format_yyyyMMdd_slash = new SimpleDateFormat("yyyy/MM/dd");
	
	
	/**
	 * Date format : MM/dd/yyyy
	 * Example : 2006/12/30
	 * Uses : Mega Millions RSS feed
	 */
	public static final DateFormat Format_MMddyyyy_slash = new SimpleDateFormat("MM/dd/yyyy");
	
	
	/**
	 * Date format : MM/dd/yyyy
	 * Example : 2006/12/30
	 * Uses : Mega Millions RSS feed
	 */
	public static final DateFormat Format_Mdyyyy_slash = new SimpleDateFormat("M/d/yyyy");
	
	/**
	 * Date format : yyyyMMdd
	 * Example : 20061230
	 * Uses : Malaysia Lottery Results
	 */
	public static final DateFormat Format_yyyyMMdd_Numeric = new SimpleDateFormat("yyyyMMdd");
	
	
	/**
	 * Creates date object using the input date format and string
	 * @param sDate
	 * @param dateFormat
	 * @return java.util.Date
	 * @throws ParseException
	 */
	public static java.util.Date getDateFromString(String sDate, DateFormat dateFormat) throws ParseException
	{
		return (java.util.Date)dateFormat.parse(sDate);
	}
	

	/**
	 * Creates date object using the input date format and string
	 * @param sDate
	 * @param dateFormat
	 * @return java.util.Date
	 * @throws ParseException
	 */
	public static java.util.Date getDateFromString(String sDate) throws ParseException
	{
		return (java.util.Date)Format_yyyyMMdd_dash.parse(sDate);
	}
	
	
	
	/**
	 * Returns date as String in the sql format (yyyy-MM-dd)
	 * @param input
	 * @return
	 */
	public static String getDateAsStringInSqlFormat(java.util.Date dDate){			
			return Format_sqlDate_yyyyMMdd.format( dDate );
			
	}
	
	
	/**
	 * Returns date as String in the sql format (yyyy-MM-dd)
	 * @param input
	 * @return
	 */
	public static String getDateAsStringInUtilFormat(java.util.Date dDate){			
			return Format_utilDate_ddMMyyyy.format( dDate );
			
	}
	
	/**
	 * Returns date as String in the input format
	 * @param input
	 * @return String 
	 */
	public static String getDateAsString(java.util.Date dDate, DateFormat dateFormat){			
			return dateFormat.format( dDate );
			
	}
	
	/**
	 * Returns date as String in the input format
	 * @param input
	 * @return String 
	 * @throws ParseException 
	 */
	public static String getSqlDateAsString(String sDate) {			
		
			try {
				return getDateAsStringInSqlFormat(Format_MMddyyyy_slash.parse(sDate));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "";
			}
			
	}
	
	/**
	 * Convert SQL Date to Util format
	 * @param input
	 * @return String 
	 * @throws ParseException 
	 */
	public static String covertSqlDateToUtilDate(String sDate) throws ParseException{	
			return Format_utilDate_ddMMyyyy.format( (java.util.Date)Format_sqlDate_yyyyMMdd.parse(sDate))  ;			
	}
	
	/**
	 * Returns the Date in default (Util) format
	 * @return String
	 */
	public static String getDateAsStringToday(){
		
		Date now = new Date();
		return Format_utilDate_ddMMyyyy.format( now );
		
	}
	
	/**
	 * Returns the Date in input format
	 * @return String
	 */
	public static String getDateAsStringToday(DateFormat dateFormat){
		
		Date now = new Date();
		return dateFormat.format( now );
		
	}
 
	
	/**
	 * Compares two dates given
	 * If dates are same return true otherwise false
	 * @return boolean
	 */
	public static boolean compateDateFormat(String thisDate,DateFormat thisDateFormat,String toDate,DateFormat toDateFormat){
		
		boolean result = false ;
		
		try {
			if(((getDateFromString(thisDate,thisDateFormat)).compareTo(getDateFromString(toDate,toDateFormat)))==0){
				result = true ;
			}else{
				result = false ;
			}
		} catch (ParseException e) {
			result = false ;
			e.printStackTrace();
		}
		
		
		return result;
		
	}
	   
	/**
	 * Converts date in one format to another format and return as String
	 * If dates are same return true otherwise false
	 * @return boolean
	 * @throws ParseException 
	 */
	public static String convertStringDateFormat(String sDate,DateFormat fromDateFormat,DateFormat toDateFormat) throws ParseException{
		
		return DateUtility.getDateAsString(DateUtility.getDateFromString(sDate, fromDateFormat), toDateFormat);		
	}
	
    /**
	 * Get the date java.util.Date object for days before current date
	 *
	 * @param days
	 * @return
	 */
	 public static Date getDateBeforeDays(int days) {
	 Calendar cal = Calendar.getInstance();
	 cal.add(Calendar.DATE, -days); // -days
	 return cal.getTime();
	 }
	 
	 /**
	 * Get the date java.util.Date object for days after current date
	 *
	 * @param days
	 * @return
	 */
	 public static Date getDateAfterDays(int days) {
	 Calendar cal = Calendar.getInstance();
	 cal.add(Calendar.DATE, days); // +days
	 return cal.getTime();
	 }
	 
	 /**
	 * Get the date java.util.Date object for years after current date
	 *
	 * @param years
	 * @return
	 */
	 public static Date getDateAfterYears(int years) {
	 Calendar cal = Calendar.getInstance();
	 cal.add(Calendar.YEAR, years); // +years
	 return cal.getTime();
	 }
	 
	 /**
	 * Get the date java.util.Date object for years before current date
	 *
	 * @param years
	 * @return
	 */
	 public static Date getDateBeforeYears(int years) {
	 Calendar cal = Calendar.getInstance();
	 cal.add(Calendar.YEAR, -years); // -years
	 return cal.getTime();
	 }
	 
	 /**
	 * Get the date java.util.Date object for months after current date
	 *
	 * @param months
	 * @return
	 */
	 public static Date getDateAfterMonths(int months) {
	 Calendar cal = Calendar.getInstance();
	 cal.add(Calendar.MONTH, months); // +months
	 return cal.getTime();
	 }
	 
	 /**
	 * Get the date java.util.Date object for months before current date
	 *
	 * @param months
	 * @return
	 */
	 public static Date getDateBeforeMonths(int months) {
	 Calendar cal = Calendar.getInstance();
	 cal.add(Calendar.MONTH, -months); // -months
	 return cal.getTime();
	 }
	 
	 /**
	 * Get the date java.util.Date object for hours before current date
	 *
	 * @param hours
	 * @return
	 */
	 public static Date getDateBeforeHours(int hours) {
	 Calendar cal = Calendar.getInstance();
	 cal.add(Calendar.HOUR, -hours); // -hours
	 return cal.getTime();
	 }
	 
	 /**
	 * Get the date java.util.Date object for hours after current date
	 *
	 * @param hours
	 * @return
	 */
	 public static Date getDateAfterHours(int hours) {
	 Calendar cal = Calendar.getInstance();
	 cal.add(Calendar.HOUR, hours); // +hours
	 return cal.getTime();
	 }
	 
	 /**
	 * Get the date java.util.Date object for minutes before current date
	 *
	 * @param minutes
	 * @return
	 */
	 public static Date getDateBeforeMinutes(int minutes) {
	 Calendar cal = Calendar.getInstance();
	 cal.add(Calendar.MINUTE, -minutes); // -minutes
	 return cal.getTime();
	 }
	 
	 /**
	 * Get the date java.util.Date object for minutes after current date
	 *
	 * @param minutes
	 * @return
	 */
	 public static Date getDateAfterMinutes(int minutes) {
	 Calendar cal = Calendar.getInstance();
	 cal.add(Calendar.MINUTE, minutes); // +minutes
	 return cal.getTime();
	 }
	 
	 /**
	 * Get the date java.util.Date object for seconds before current date
	 *
	 * @param seconds
	 * @return
	 */
	 public static Date getDateBeforeSeconds(int seconds) {
	 Calendar cal = Calendar.getInstance();
	 cal.add(Calendar.SECOND, -seconds); // -seconds
	 return cal.getTime();
	 }
	 
	 /**
	 * Get the date java.util.Date object for seconds after current date
	 *
	 * @param seconds
	 * @return
	 */
	 public static Date getDateAfterSeconds(int seconds) {
	 Calendar cal = Calendar.getInstance();
	 cal.add(Calendar.SECOND, seconds); // +seconds
	 return cal.getTime();
	 }


}
