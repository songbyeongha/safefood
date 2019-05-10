package com.ssafy.dto;

import java.sql.Date;

public class Myintake {
	private Integer itno;
	private String userinfoId;
	private Date intakeDate;
	private Integer foodCode;
	
	public Myintake() {
		super();
	}

	public Myintake(Integer itno, String userinfoId, Date intakeDate, Integer foodCode) {
		super();
		this.itno = itno;
		this.userinfoId = userinfoId;
		this.intakeDate = intakeDate;
		this.foodCode = foodCode;
	}

	public Integer getItno() {
		return itno;
	}

	public void setItno(Integer itno) {
		this.itno = itno;
	}

	public String getUserinfoId() {
		return userinfoId;
	}

	public void setUserinfoId(String userinfoId) {
		this.userinfoId = userinfoId;
	}

	public Date getIntakeDate() {
		return intakeDate;
	}

	public void setIntakeDate(Date intakeDate) {
		this.intakeDate = intakeDate;
	}

	public Integer getFoodCode() {
		return foodCode;
	}

	public void setFoodCode(Integer foodCode) {
		this.foodCode = foodCode;
	}

	@Override
	public String toString() {
		return "Myintake [itno=" + itno + ", userinfoId=" + userinfoId + ", intakeDate=" + intakeDate + ", foodCode="
				+ foodCode + "]";
	}
	

}
