package com.safefood.dto;

import java.util.Arrays;

public class Member {
	private String id;
	private String password;
	private String name;
	private String address;
	private String phone;
	private Integer authority;
	private Integer age;
	private Integer weight;
	private Integer kidney;
	private String gender;
	private Double level;
	private String[] allergy;
	
	public Member() {
		super();
	}

	public Member(String id, String password, String name, String address, String phone) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.address = address;
		this.phone = phone;
	}

	public Member(String id, String password, String name, String address, String phone, Integer authority, Integer age,
			Integer weight, Integer kidney, String gender, Double level, String[] allergy) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.authority = authority;
		this.age = age;
		this.weight = weight;
		this.kidney = kidney;
		this.gender = gender;
		this.level = level;
		this.allergy = allergy;
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

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public Integer getWeight() {
		return weight;
	}

	public void setWeight(Integer weight) {
		this.weight = weight;
	}

	public Integer getKidney() {
		return kidney;
	}

	public void setKidney(Integer kidney) {
		this.kidney = kidney;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Double getLevel() {
		return level;
	}

	public void setLevel(Double level) {
		this.level = level;
	}

	public String[] getAllergy() {
		return allergy;
	}

	public void setAllergy(String[] allergy) {
		this.allergy = allergy;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", password=" + password + ", name=" + name + ", address=" + address + ", phone="
				+ phone + ", authority=" + authority + ", age=" + age + ", weight=" + weight + ", kidney=" + kidney
				+ ", gender=" + gender + ", level=" + level + ", allergy=" + Arrays.toString(allergy) + "]";
	}



}
