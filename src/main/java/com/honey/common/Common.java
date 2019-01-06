package com.honey.common;

import java.io.Serializable;

public class Common implements Serializable {
	private String creationDate;
	private int createdBy;
	private String createdByName;
	private String modifiedDate;
	private int modifiedBy;
	private String modifiedByName;
	
	private String deleteStatus;
	
	private String beginCreationDate;
	private String endCreationDate;
	private String orderBy;
	private int pageNo;
	private int pageSize;
	private int point;
	
	public String getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(String creationDate) {
		this.creationDate = creationDate;
	}
	public int getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}
	public String getCreatedByName() {
		return createdByName;
	}
	public void setCreatedByName(String createdByName) {
		this.createdByName = createdByName;
	}
	public String getModifiedDate() {
		return modifiedDate;
	}
	public void setModifiedDate(String modifiedDate) {
		this.modifiedDate = modifiedDate;
	}
	public int getModifiedBy() {
		return modifiedBy;
	}
	public void setModifiedBy(int modifiedBy) {
		this.modifiedBy = modifiedBy;
	}
	public String getModifiedByName() {
		return modifiedByName;
	}
	public void setModifiedByName(String modifiedByName) {
		this.modifiedByName = modifiedByName;
	}
	public String getDeleteStatus() {
		return deleteStatus;
	}
	public void setDeleteStatus(String deleteStatus) {
		this.deleteStatus = deleteStatus;
	}
	public String getBeginCreationDate() {
		return beginCreationDate;
	}
	public void setBeginCreationDate(String beginCreationDate) {
		this.beginCreationDate = beginCreationDate;
	}
	public String getEndCreationDate() {
		return endCreationDate;
	}
	public void setEndCreationDate(String endCreationDate) {
		this.endCreationDate = endCreationDate;
	}
	public String getOrderBy() {
		return orderBy;
	}
	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	
	@Override
	public String toString() {
		return "Common [creationDate=" + creationDate + ", createdBy=" + createdBy + ", createdByName=" + createdByName
				+ ", modifiedDate=" + modifiedDate + ", modifiedBy=" + modifiedBy + ", modifiedByName=" + modifiedByName
				+ ", deleteStatus=" + deleteStatus + ", beginCreationDate=" + beginCreationDate + ", endCreationDate="
				+ endCreationDate + ", orderBy=" + orderBy + ", pageNo=" + pageNo + ", pageSize=" + pageSize
				+ ", point=" + point + "]";
	}
}
