package com.ssafy.dto;

import java.util.Date;

public class Myintake {
	private Integer itno;
	private String id;
	private Date intakeDate;
	private Integer code;
	
	public Myintake() {
		super();
	}

	public Myintake(String id, Integer code) {
		super();
		this.id = id;
		this.code = code;
	}
	
	public Myintake(String id, Date intakeDate, Integer code) {
		super();
		this.id = id;
		this.intakeDate = intakeDate;
		this.code = code;
	}

	public Integer getItno() {
		return itno;
	}

	public void setItno(Integer itno) {
		this.itno = itno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getIntakeDate() {
		return intakeDate;
	}

	public void setIntakeDate(Date intakeDate) {
		this.intakeDate = intakeDate;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	@Override
	public String toString() {
		return "Myintake [itno=" + itno + ", Id=" + id + ", intakeDate=" + intakeDate + ", code="
				+ code + "]";
	}
	

}
