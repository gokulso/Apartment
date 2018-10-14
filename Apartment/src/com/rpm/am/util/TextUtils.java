package com.rpm.am.util;

import java.text.DecimalFormat;
import java.util.ArrayList;

public class TextUtils {
	
	public static String replaceSingleQuote(String temp){
		//System.out.println(" Before ="+temp);
		String result =temp;
		if((temp!= null) && (!result.equals(""))){
			result =temp.replaceAll("'", "\\\\'");
			
		} 
		
	//	System.out.println(" After ="+result);
		return result;
	}
	public static String getCommaSeparatedString(ArrayList numberList){
		
		String result = "";
		for(int i=0;i<numberList.size()-1;i++){
			result = result + numberList.get(i) + ",";
		}
		result = result + numberList.get(numberList.size()-1)  ;
		
		
		return result;
	}
	
	public static String formatNumericString(String temp){
		System.out.println("Inside formatNumericString =" + temp);
		String pattern = "###,###.### ";
		DecimalFormat myFormatter = new DecimalFormat(pattern);
		String output = myFormatter.format(temp);
		System.out.println(temp + " " + pattern + " " + output);
		
		
		return output;
		
	}
	
	public static  String insertCommas(String str)
    {
        if(str.length() < 4){
            return str;
        }
        return insertCommas(str.substring(0, str.length() - 3)) + "," + str.substring(str.length() - 3, str.length());
    }

	public static  String checkForNull(String str)
    {
	String result = "";
       if(str == null){
    	   result="0";
       }else{
    	   result = str;
       }
       
       return result;
    }

	public static  String checkNullZero(String str)
    {
	String result = "";
       if(str == null){
    	   result="0";
       }else{
    	   result = str;
       }
       
       return result;
    }
	
	public static  String checkNullSpace(String str)
    {
	String result = "";
       if(str == null){
    	   result="";
       
       }else if(str.equals("0")){
    	   result="";
       }else{
    	   result = str;
       }
       
       return result;
    }
	
	
	public static  boolean isSubStringNullZeroBlank(String str, String substr)
    { 
		
       if(substr == null || substr.equals("0") || substr.equals("")){ 
    	   return false ;       
       }else{
    	   if(str.indexOf(NumericUtil.getDoubleCharNumber(substr)  ) >= 0 ){ 
    		   return true;
    	   }
       }        
       return false;
    }
	
	
}
