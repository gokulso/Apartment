package com.rpm.am.formbeans;

import java.util.ArrayList;

public class ApartmentRegisterBean {

	String displayMessage = "" ;	
	boolean isSuccess = false ;
	ArrayList registeredApartmentList = new ArrayList();
	
	
	
	
	/**
	 * @return the displayMessage
	 */
	public String getDisplayMessage() {
		return displayMessage;
	}
	/**
	 * @param displayMessage the displayMessage to set
	 */
	public void setDisplayMessage(String displayMessage) {
		this.displayMessage = displayMessage;
	}
	/**
	 * @return the isSuccess
	 */
	public boolean isSuccess() {
		return isSuccess;
	}
	/**
	 * @param isSuccess the isSuccess to set
	 */
	public void setSuccess(boolean isSuccess) {
		this.isSuccess = isSuccess;
	}
	/**
	 * @return the registeredApartmentList
	 */
	public ArrayList getRegisteredApartmentList() {
		return registeredApartmentList;
	}
	/**
	 * @param registeredApartmentList the registeredApartmentList to set
	 */
	public void setRegisteredApartmentList(ArrayList registeredApartmentList) {
		this.registeredApartmentList = registeredApartmentList;
	}
	
	
	
	
}
