package com.rpm.am.util;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.StringTokenizer;

import com.rpm.am.constants.DataConstants;

public class NumericUtil {
	

	public static final String  FORMAT_SEPARATOR_COMMA_DECIMAL_TWO = "#,###,###.00";
	public static final String  FORMAT_SEPARATOR_COMMA_DECIMAL_ONE = "#,###,###.0";
	public static final String  FORMAT_SEPARATOR_COMMA_DECIMAL_ZERO = "#,###,###";
	
	public static int convertStringToInt(String strToConvert){
		
		try{
		return (new Integer(strToConvert).intValue());
		}catch(Exception ex){
			return -1;
		}
		
	}
	
	public static double roundTwoDecimals(double d) {
    	DecimalFormat twoDForm = new DecimalFormat("#.##");
    	return Double.valueOf(twoDForm.format(d)).doubleValue();
}

	
	public static double convertStringToDouble(String strToConvert){
		//System.out.println("## com.mbl.portal.util = "+ strToConvert + "------------" + Double.parseDouble(strToConvert));
		return  Double.parseDouble(strToConvert);
		
	}
	
	

	/**
	 * Returns 2 character string for DD and MM value in date
	 * @param number
	 * @return
	 */
	public static String getDoubleCharNumber(int number){		
		if(number<=9){			
			return "0"+number;
		}else{			
			return ""+number;
		}	
	}
	
	/**
	 * Returns 2 character string for DD and MM value in date
	 * @param number
	 * @return
	 */
	public static String getDoubleCharString(String number){	
		
		if(number.length()<2){			
			return "0"+number;
		}else{			
			return ""+number;
		}	
	}
	
	/**
	 * Returns 2 character string for DD and MM value in date
	 * @param number
	 * @return
	 */
	public static String getDoubleCharNumber(String number){		
		if(number.length()<1){			
			return "00";
		}else if(number.length()<2){			
			return "0"+number;
		}else{			
			return ""+number;
		}	
	}
	
	  
	
	public static double roundToDecimals(double d, int c) {
		int temp=(int)((d*Math.pow(10,c)));
		return (((double)temp)/Math.pow(10,c));
	}

	public static double roundTStringToDecimals(String d, int c) {
		
		double d1 =  Double.parseDouble(d);
		int temp=(int)((d1*Math.pow(10,c)));
		return (((double)temp)/Math.pow(10,c));
	}
	  
public static String getDayFromDateString(String utilDate){		
		SimpleDateFormat sdfInput =  
	        new SimpleDateFormat (  "yyyy-MM-dd"  ) ;  
	  
	     java.util.Date inputDate = null;
		try {
			inputDate = sdfInput.parse (  utilDate  );
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();		}  
	     
	     SimpleDateFormat sdfOutput =  
		        new SimpleDateFormat  (  "dd"  ) ;  	     
	  
		return sdfOutput.format (  inputDate  )  ;

	}
public static String getMonthFromDateString(String utilDate){		
	SimpleDateFormat sdfInput =  
        new SimpleDateFormat (  "yyyy-MM-dd"  ) ;  
  
     java.util.Date inputDate = null;
	try {
		inputDate = sdfInput.parse (  utilDate  );
	} catch (ParseException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();		}  
     
     SimpleDateFormat sdfOutput =  
	        new SimpleDateFormat  (  "MMMM"  ) ;  	     
  
	return sdfOutput.format (  inputDate  )  ;

}
public static String getYearFromDate(String utilDate){		
	SimpleDateFormat sdfInput =  
        new SimpleDateFormat (  "yyyy-MM-dd"  ) ;  
  
     java.util.Date inputDate = null;
	try {
		inputDate = sdfInput.parse (  utilDate  );
	} catch (ParseException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();		}  
     
     SimpleDateFormat sdfOutput =  
	        new SimpleDateFormat  (  "yyyy"  ) ;  	     
  
	return sdfOutput.format (  inputDate  )  ;

}

/**
 * Returns 2 character string for DD and MM value in date
 * @param number
 * @return
 */
public static String formatNumber(String number){		
	double s = Double.valueOf(number).longValue();
	// The , symbol is used to group numbers
	 NumberFormat formatter = new DecimalFormat("#,###,###");
     String result  = formatter.format(s);         // -1,235 
	return result;
}



/**
 * Formats the string using the format supplied
 * @param number
 * @return
 */
public static String formatNumber(String numberToFormat, String format){
	double s = Double.valueOf(numberToFormat).doubleValue();
 	 NumberFormat formatter = new DecimalFormat(format);	 	 
	 String result = formatter.format(s);  // -001235	 
	 return result;
}


/**
 * Formats the string using the format supplied
 * @param number
 * @return
 */
public static String formatNumber(double numberToFormat, String format){
 	 NumberFormat formatter = new DecimalFormat(format);	 	 
	 String result = formatter.format(numberToFormat);  // -001235	 
	 return result;
}



public static String formatDecimalNumber(String number ){		
	double s = Double.valueOf(number).doubleValue();
	// The , symbol is used to group numbers
	 NumberFormat formatter = new DecimalFormat("#,###,##0.0");
     String result  = formatter.format(s);         // -1,235 
	return result;
}


public static String formatDecimalNumber2(String number ){		
	double s = Double.valueOf(number).doubleValue();
	// The , symbol is used to group numbers
	 NumberFormat formatter = new DecimalFormat("#,###,##0.000");
	

     String result  = formatter.format(s);         // -1,235 
 	//System.out.println("s = " + s + "...." + result);
	return result;
}


/**
 * Returns 2 character string for DD and MM value in date
 * @param number
 * @return
 */
public static String getMapLebelString(String number){	
	
	
	int upperUnit = 0;
	int upperLimit = 0;
	String result = "|0|";
	int multiplier = 5000;
	int multiplierFactor = 5;
		
	int input = Integer.valueOf(number).intValue();
	
	upperUnit = (input/multiplier);
	
	if(upperUnit <= 7){
		 multiplier = 2000;	
		 multiplierFactor= 2;
		 upperUnit = (input/multiplier);		 
	}
	
	upperLimit = multiplier * (upperUnit+1);
	
	for(int i=1;i<=upperUnit+1;i++){
		result = result + (i*multiplierFactor) + "K|";
	}
	
	//System.out.println("Lebel = " + result);
	//System.out.println("upperLimit = " + upperLimit);
	return result + "#" +upperLimit ;
	
	
}

public static String getFdicCostMapLebelString(String maxNum){	
	
	double s = Double.valueOf(maxNum).longValue();
	// The , symbol is used to group numbers
	 NumberFormat formatter = new DecimalFormat("#######");
     String number  = formatter.format(s);         // 
	int upperUnit = 0;
	int upperLimit = 0;
	String result = "|0|";
	int multiplier = 2000;
	int multiplierFactor = 5;

	try{
		int input = Integer.valueOf(number).intValue();
	 
		upperUnit = (input/multiplier);
		
		if(upperUnit <= 7){
			 multiplier = 2000;	
			 multiplierFactor= 2;
			 upperUnit = (input/multiplier);		 
		}
	
	upperLimit = multiplier * (upperUnit+1);
	
	for(int i=1;i<=upperUnit+1;i++){
		result = result + (i*multiplierFactor) + ",000 M|";
	}
	}catch(Exception ex){
		System.out.println("Exception = " + ex);
	}
	//System.out.println("Lebel = " + result);
	//System.out.println("upperLimit = " + upperLimit);
	return result + "#" +upperLimit ;
	
	
}

public static String getFreqMapLebelString(String number){	
	
	
	int upperUnit = 0;
	int upperLimit = 0;
	String result = "|0|";
	int multiplier = 5;
	int multiplierFactor = 5;
		
	int input = Integer.valueOf(number).intValue();
	
	upperUnit = (input/multiplier);
	
	if(upperUnit <= 7){
		 multiplier = 2;	
		 multiplierFactor= 2;
		 upperUnit = (input/multiplier);		 
	}
	
	upperLimit = multiplier * (upperUnit+1);
	
	for(int i=1;i<=upperUnit+1;i++){
		result = result + (i*multiplierFactor) + "|";
	}
	
	//System.out.println("Lebel = " + result);
	//System.out.println("upperLimit = " + upperLimit);
	return result + "#" +upperLimit ;
	
	
}
}
