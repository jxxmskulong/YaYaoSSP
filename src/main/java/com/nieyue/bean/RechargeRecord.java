package com.nieyue.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * 充值记录
 * @author yy
 *
 */
public class RechargeRecord implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 充值记录id
	 */
	private Integer rechargeRecordId;
	
	/**
	 * 充值类型，1支付宝支付，2微信支付，3银联支付
	 */
	private Integer type;
	/**
	 * 充值金额
	 */
	private Double rechargeMoney;
	/**
	 * 赠送金币
	 */
	private Double giveMoney;
	/**
	 * 创建时间
	 */
	private Date createDate;
	/**
	 * 更新时间
	 */
	private Date updateDate;
	/**
	 * 默认为1成功，2失败
	 */
	private Integer status;
	/**
	 * 账户id,外键
	 */
	private Integer acountId;
	public RechargeRecord() {
		super();
	}
	
	public RechargeRecord(Integer rechargeRecordId, Integer type, Double rechargeMoney, Double giveMoney,
			Date createDate, Date updateDate, Integer status, Integer acountId) {
		super();
		this.rechargeRecordId = rechargeRecordId;
		this.type = type;
		this.rechargeMoney = rechargeMoney;
		this.giveMoney = giveMoney;
		this.createDate = createDate;
		this.updateDate = updateDate;
		this.status = status;
		this.acountId = acountId;
	}

	public Integer getRechargeRecordId() {
		return rechargeRecordId;
	}
	public void setRechargeRecordId(Integer rechargeRecordId) {
		this.rechargeRecordId = rechargeRecordId;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getAcountId() {
		return acountId;
	}
	public void setAcountId(Integer acountId) {
		this.acountId = acountId;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public Double getRechargeMoney() {
		return rechargeMoney;
	}
	public void setRechargeMoney(Double rechargeMoney) {
		this.rechargeMoney = rechargeMoney;
	}
	public Double getGiveMoney() {
		return giveMoney;
	}
	public void setGiveMoney(Double giveMoney) {
		this.giveMoney = giveMoney;
	}
	
}
