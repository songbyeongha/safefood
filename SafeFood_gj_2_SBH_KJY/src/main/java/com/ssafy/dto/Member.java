package com.ssafy.dto;

import java.util.List;

public class Member {
	private String id;
	private String password;
	private String name;
	private String address;
	private String phone;
	private Integer authority;
	private List<String> allergy;
	
	public Member() {
		super();
	}

	public Member(String id, String password, String name, String address, String phone, Integer authority) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.authority = authority;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Integer getAuthority() {
		return authority;
	}

	public void setAuthority(Integer authority) {
		this.authority = authority;
	}

	public List<String> getAllergy() {
		return allergy;
	}

	public void setAllergy(List<String> allergy) {
		this.allergy = allergy;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", password=" + password + ", name=" + name + ", address=" + address + ", phone="
				+ phone + ", authority=" + authority + "]";
	}
	
}
