package com.honey.common;

import java.io.Serializable;

public class Paging implements Serializable {
	private int pageNo;
	private int pageSize;
	private int point;
	private int totCount;
	private int pageCount;
	private int first;
	private int last;
	
	public Paging(int pageNo, int pageSize, int totCount) {
		this.pageSize = pageSize;
    	if(pageSize == 0)
    		this.pageSize = 10;
    	this.pageNo = pageNo;
    	if(pageNo == 0)
    		this.pageNo = 1;
    	this.totCount = totCount;
    	this.pageCount = (int) Math.ceil((double)this.totCount/this.pageSize);
    	this.first = 1;
    	this.last = pageCount;
    	this.point = (this.pageNo - 1) * this.pageSize;
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
	public int getTotCount() {
		return totCount;
	}
	public void setTotCount(int totCount) {
		this.totCount = totCount;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getFirst() {
		return first;
	}
	public void setFirst(int first) {
		this.first = first;
	}
	public int getLast() {
		return last;
	}
	public void setLast(int last) {
		this.last = last;
	}
	@Override
	public String toString() {
		return "Paging [pageNo=" + pageNo + ", pageSize=" + pageSize + ", point=" + point + ", totCount=" + totCount
				+ ", pageCount=" + pageCount + ", first=" + first + ", last=" + last + "]";
	}
}
