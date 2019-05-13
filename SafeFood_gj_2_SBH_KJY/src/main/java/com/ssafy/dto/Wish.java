package com.ssafy.dto;

public class Wish {
	private String id;
	private Integer code;
	
	public Wish() {
		super();
	}
	
	public Wish(String id, Integer code) {
		super();
		this.id = id;
		this.code = code;
	}

	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "Wish [code=" + code + ", id=" + id + "]";
	}
		
}
