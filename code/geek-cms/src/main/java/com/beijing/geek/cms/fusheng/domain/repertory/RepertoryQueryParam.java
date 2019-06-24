package com.beijing.geek.cms.fusheng.domain.repertory;

import com.beijing.geek.cms.sys.domain.common.ListQueryPojo;

/**
 * Created by mazeguo on 2017/7/9.
 */
public class RepertoryQueryParam extends ListQueryPojo {
    private String repertoryCode;
    private Integer recordId;
    private Integer cId; //客户Id
    private Integer pId;
    private String storageId;//仓库Id
    private Integer osbId;//订单Id
    private String inCode;//入库单号
    private String partCode;//配件编号
    private String partName;//配件名称
    private String inDate;//入库时间
    private String outDate;//出库时间
    private String startDate;//入库时间
    private String endDate;//入库时间

    private Integer repertoryType;//出入库类型 1-入库 2-出库

    private String customerKey;//客户关键字
    private String contractCode;//合同编号
    private String partKey;//配件关键字
    private String outCode;//出库编号
    private String sender;//发货人编号

    public Integer getcId() {
        return cId;
    }

    public void setcId(Integer cId) {
        this.cId = cId;
    }

    public Integer getOsbId() {
        return osbId;
    }

    public void setOsbId(Integer osbId) {
        this.osbId = osbId;
    }

    public String getInCode() {
        return inCode;
    }

    public void setInCode(String inCode) {
        this.inCode = inCode;
    }

    public String getPartCode() {
        return partCode;
    }

    public void setPartCode(String partCode) {
        this.partCode = partCode;
    }

    public String getPartName() {
        return partName;
    }

    public void setPartName(String partName) {
        this.partName = partName;
    }

    public String getInDate() {
        return inDate;
    }

    public void setInDate(String inDate) {
        this.inDate = inDate;
    }

    public String getCustomerKey() {
        return customerKey;
    }

    public void setCustomerKey(String customerKey) {
        this.customerKey = customerKey;
    }

    public String getContractCode() {
        return contractCode;
    }

    public void setContractCode(String contractCode) {
        this.contractCode = contractCode;
    }

    public String getPartKey() {
        return partKey;
    }

    public void setPartKey(String partKey) {
        this.partKey = partKey;
    }

    public String getOutCode() {
        return outCode;
    }

    public void setOutCode(String outCode) {
        this.outCode = outCode;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public Integer getpId() {
        return pId;
    }

    public void setpId(Integer pId) {
        this.pId = pId;
    }

    public String getStorageId() {
        return storageId;
    }

    public void setStorageId(String storageId) {
        this.storageId = storageId;
    }

    public Integer getRepertoryType() {
        return repertoryType;
    }

    public void setRepertoryType(Integer repertoryType) {
        this.repertoryType = repertoryType;
    }

    public String getRepertoryCode() {
        return repertoryCode;
    }

    public void setRepertoryCode(String repertoryCode) {
        this.repertoryCode = repertoryCode;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getOutDate() {
        return outDate;
    }

    public void setOutDate(String outDate) {
        this.outDate = outDate;
    }

    public Integer getRecordId() {
        return recordId;
    }

    public void setRecordId(Integer recordId) {
        this.recordId = recordId;
    }
}
