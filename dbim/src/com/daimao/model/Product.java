package com.daimao.model;

import java.util.Date;

public class Product {
	private String id;
	private String name;
	private String familyType;
	private float length;
	private float width;
	private float height;
	private Date publishDate;
	private float edition;
	private String discription;
	private String link;
	
	private String installInstruction;
	private String certification;
	private String document;
	private String video;
	private String code;
	private String mainMaterial;
	private String secMaterial;
	private String design;
	private String production;
	private float weight;
	
	private String similarProduct;
	private String attachment;
	private String sccClass;
	private String IFCType;
	private String manufacturerID;
	private String thumbDir;
	private String downloadDir;
	private String buildingType;
	private String function;
	private String manufacturer;
	private int downloads;
	
	public int getDownloads() {
		return downloads;
	}
	public void setDownloads(int downloads) {
		this.downloads = downloads;
	}
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFamilyType() {
		return familyType;
	}
	public void setFamilyType(String familyType) {
		this.familyType = familyType;
	}
	public float getLength() {
		return length;
	}
	public void setLength(float length) {
		this.length = length;
	}
	public float getWidth() {
		return width;
	}
	public void setWidth(float width) {
		this.width = width;
	}
	public float getHeight() {
		return height;
	}
	public void setHeight(float height) {
		this.height = height;
	}
	
	public Date getPublishDate() {
		return publishDate;
	}
	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}
	public float getEdition() {
		return edition;
	}
	public void setEdition(float edition) {
		this.edition = edition;
	}
	public String getDiscription() {
		return discription;
	}
	public void setDiscription(String discription) {
		this.discription = discription;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getInstallInstruction() {
		return installInstruction;
	}
	public void setInstallInstruction(String installInstruction) {
		this.installInstruction = installInstruction;
	}
	public String getCertification() {
		return certification;
	}
	public void setCertification(String certification) {
		this.certification = certification;
	}
	public String getDocument() {
		return document;
	}
	public void setDocument(String document) {
		this.document = document;
	}
	public String getVideo() {
		return video;
	}
	public void setVideo(String video) {
		this.video = video;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getMainMaterial() {
		return mainMaterial;
	}
	public void setMainMaterial(String mainMaterial) {
		this.mainMaterial = mainMaterial;
	}
	public String getSecMaterial() {
		return secMaterial;
	}
	public void setSecMaterial(String secMaterial) {
		this.secMaterial = secMaterial;
	}
	public String getDesign() {
		return design;
	}
	public void setDesign(String design) {
		this.design = design;
	}
	public String getProduction() {
		return production;
	}
	public void setProduction(String production) {
		this.production = production;
	}
	public float getWeight() {
		return weight;
	}
	public void setWeight(float weight) {
		this.weight = weight;
	}
	public String getSimilarProduct() {
		return similarProduct;
	}
	public void setSimilarProduct(String similarProduct) {
		this.similarProduct = similarProduct;
	}
	public String getAttachment() {
		return attachment;
	}
	public void setAttachment(String attachment) {
		this.attachment = attachment;
	}
	public String getSccClass() {
		return sccClass;
	}
	public void setSccClass(String sccClass) {
		this.sccClass = sccClass;
	}
	public String getIFCType() {
		return IFCType;
	}
	public void setIFCType(String iFCType) {
		IFCType = iFCType;
	}
	public String getThumbDir() {
		return thumbDir;
	}
	public void setThumbDir(String thumbDir) {
		this.thumbDir = thumbDir;
	}
	public String getDownloadDir() {
		return downloadDir;
	}
	public void setDownloadDir(String downloadDir) {
		this.downloadDir = downloadDir;
	}
	public String getManufacturerID() {
		return manufacturerID;
	}
	public void setManufacturerID(String manufacturerID) {
		this.manufacturerID = manufacturerID;
	}
	public String getBuildingType() {
		return buildingType;
	}
	public void setBuildingType(String buildingType) {
		this.buildingType = buildingType;
	}
	public String getFunction() {
		return function;
	}
	public void setFunction(String function) {
		this.function = function;
	}
}
