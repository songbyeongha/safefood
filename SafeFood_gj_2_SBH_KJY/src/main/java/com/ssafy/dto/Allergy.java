package com.ssafy.dto;

public class Allergy {
	private String userinfoId;
	private String name;
	
	public Allergy() {
		super();
	}

	public Allergy(String userinfoId, String name) {
		super();
		this.userinfoId = userinfoId;
		this.name = name;
	}

	public String getUserinfoId() {
		return userinfoId;
	}

	public void setUserinfoId(String userinfoId) {
		this.userinfoId = userinfoId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Allergy [userinfo_id=" + userinfoId + ", name=" + name + "]";
	}
	
}
