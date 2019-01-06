package com.honey.common;

import java.io.Serializable;

public class Result implements Serializable{
	private Paging paging; // data for paging returned
	private Object list; // data for a list returned
	private Object object; // data for an object returned
	private boolean success; // "true" is success, "false" is failure
	public Paging getPaging() {
		return paging;
	}
	public void setPaging(Paging paging) {
		this.paging = paging;
	}
	public Object getList() {
		return list;
	}
	public void setList(Object list) {
		this.list = list;
	}
	public Object getObject() {
		return object;
	}
	public void setObject(Object object) {
		this.object = object;
	}
	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	@Override
	public String toString() {
		return "Result [paging=" + paging + ", list=" + list + ", object=" + object + ", success=" + success + "]";
	}
	
}
