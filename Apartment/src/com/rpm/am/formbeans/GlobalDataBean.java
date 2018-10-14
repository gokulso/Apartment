package com.rpm.am.formbeans;

import javax.servlet.http.HttpServletRequest;

import com.rpm.am.constants.ParameterConstants;
import com.rpm.am.util.NumericUtil;

public class GlobalDataBean 
{
	public String action = "" ;
	public String operation = "" ;
	
	public GlobalDataBean( )
	{
		 
	}

	public GlobalDataBean(String action) 
	{
		super();
		this.action = action;
	}

	public GlobalDataBean(HttpServletRequest request) 
	{
		
		if(request.getAttribute(ParameterConstants.PAGE_ACTION) !=null)
		{
			this.action  =  request.getAttribute(ParameterConstants.PAGE_ACTION).toString() ;
		}
		else if(request.getParameter(ParameterConstants.PAGE_ACTION) !=null)
		{
			 this.action  =  request.getParameter(ParameterConstants.PAGE_ACTION).toString() ;
		}
		
		if(request.getAttribute(ParameterConstants.PAGE_OPERATION) !=null)
		{			
			this.operation  =  request.getAttribute(ParameterConstants.PAGE_OPERATION).toString() ;
		}
		else if(request.getParameter(ParameterConstants.PAGE_OPERATION) !=null)
		{
			 this.operation  =  request.getParameter(ParameterConstants.PAGE_OPERATION).toString() ;
		}
		 
		 System.out.println("### ACTION = " + action );
	}


	/**
	 * @return the action
	 */
	public String getAction() {
		return action;
	}

	/**
	 * @param action the action to set
	 */
	public void setAction(String action) {
		this.action = action;
	}


	/**
	 * @return the operation
	 */
	public String getOperation() {
		return operation;
	}


	/**
	 * @param operation the operation to set
	 */
	public void setOperation(String operation) {
		this.operation = operation;
	}

}
