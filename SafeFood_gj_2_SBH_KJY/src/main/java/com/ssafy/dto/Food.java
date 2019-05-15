package com.ssafy.dto;

import java.util.Date;

public class Food {
	private Integer code;
	private String name;
	private Double supportpereat;
	private Double calory;
	private Double carbo;
	private Double protein;
	private Double fat;
	private Double sugar;
	private Double natrium;
	private Double chole;
	private Double fattyacid;
	private Double transfat;
	private String maker;
	private String material;
	private String img;
	private Integer bestCount;
	private String intakeDate;
	
	public Food() {
		super();
	}

	public Food(Integer code, String name, Double supportpereat, Double calory, Double carbo, Double protein,
			Double fat, Double sugar, Double natrium, Double chole, Double fattyacid, Double transfat, String maker,
			String material, String img, Integer bestCount) {
		super();
		this.code = code;
		this.name = name;
		this.supportpereat = supportpereat;
		this.calory = calory;
		this.carbo = carbo;
		this.protein = protein;
		this.fat = fat;
		this.sugar = sugar;
		this.natrium = natrium;
		this.chole = chole;
		this.fattyacid = fattyacid;
		this.transfat = transfat;
		this.maker = maker;
		this.material = material;
		this.img = img;
		this.bestCount = bestCount;
	}

	public String getIntakeDate() {
		return intakeDate;
	}

	public void setIntakeDate(String intakeDate) {
		this.intakeDate = intakeDate;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Double getSupportpereat() {
		return supportpereat;
	}

	public void setSupportpereat(Double supportpereat) {
		this.supportpereat = supportpereat;
	}

	public Double getCalory() {
		return calory;
	}

	public void setCalory(Double calory) {
		this.calory = calory;
	}

	public Double getCarbo() {
		return carbo;
	}

	public void setCarbo(Double carbo) {
		this.carbo = carbo;
	}

	public Double getProtein() {
		return protein;
	}

	public void setProtein(Double protein) {
		this.protein = protein;
	}

	public Double getFat() {
		return fat;
	}

	public void setFat(Double fat) {
		this.fat = fat;
	}

	public Double getSugar() {
		return sugar;
	}

	public void setSugar(Double sugar) {
		this.sugar = sugar;
	}

	public Double getNatrium() {
		return natrium;
	}

	public void setNatrium(Double natrium) {
		this.natrium = natrium;
	}

	public Double getChole() {
		return chole;
	}

	public void setChole(Double chole) {
		this.chole = chole;
	}

	public Double getFattyacid() {
		return fattyacid;
	}

	public void setFattyacid(Double fattyacid) {
		this.fattyacid = fattyacid;
	}

	public Double getTransfat() {
		return transfat;
	}

	public void setTransfat(Double transfat) {
		this.transfat = transfat;
	}

	public String getMaker() {
		return maker;
	}

	public void setMaker(String maker) {
		this.maker = maker;
	}

	public String getMaterial() {
		return material;
	}

	public void setMaterial(String material) {
		this.material = material;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Integer getBestCount() {
		return bestCount;
	}

	public void setBestCount(Integer bestCount) {
		this.bestCount = bestCount;
	}

	@Override
	public String toString() {
		return "Food [code=" + code + ", name=" + name + ", supportpereat=" + supportpereat + ", calory=" + calory
				+ ", carbo=" + carbo + ", protein=" + protein + ", fat=" + fat + ", sugar=" + sugar + ", natrium="
				+ natrium + ", chole=" + chole + ", fattyacid=" + fattyacid + ", transfat=" + transfat + ", maker="
				+ maker + ", material=" + material + ", img=" + img + ", bestCount=" + bestCount + "]";
	}
	
}
