/*****************************************************************************
 * Copyright (c) 2016, www.qingshixun.com
 *
 * All rights reserved
 *
*****************************************************************************/
package online.shixun.asl.core;

public class ResponseData {
	
	// 状态码
	private static final String SUCCESS_CODE = "0";
	private static final String ERROR_CODE = "-1";
	
	// 返回数据
	private Object data;
	
	// 状态
	private String status = SUCCESS_CODE;

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	/**
	 * 设置错误信息
	 * @param data
	 */
	public void setError(Object data) {
		setStatus(ERROR_CODE);
		setData(data);
	}
	
	/**
	 * 判断是否成功
	 * @return
	 */
	public Boolean isSuccess() {
		return getStatus().equals(SUCCESS_CODE);
	}

}
