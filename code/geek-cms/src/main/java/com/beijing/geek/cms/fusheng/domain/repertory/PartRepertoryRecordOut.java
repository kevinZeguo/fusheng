package com.beijing.geek.cms.fusheng.domain.repertory;

import java.util.Date;

public class PartRepertoryRecordOut extends PartRepertoryRecord {
    private Integer id;

    private Integer repertoryRecordId;

    private Integer customerId;

    private Integer contractId;

    private Integer sendType;

    private String linkman;

    private String telSign;

    private String fax;

    private String verifier;

    private String postcode;

    private String receiverAddress;

    private Integer creator;

    private Date created;

    private Integer modifier;

    private Date modified;

    private Integer deleted;
    private String sender;//发货人
    private String customerName;
    private String contractCode;
    private String operatorName;
    private String createdStr;
    private Integer totalNum;

    public Integer getTotalNum() {
        return totalNum;
    }

    public void setTotalNum(Integer totalNum) {
        this.totalNum = totalNum;
    }

    @Override
    public Integer getId() {
        return id;
    }

    @Override
    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRepertoryRecordId() {
        return repertoryRecordId;
    }

    public void setRepertoryRecordId(Integer repertoryRecordId) {
        this.repertoryRecordId = repertoryRecordId;
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public Integer getContractId() {
        return contractId;
    }

    public void setContractId(Integer contractId) {
        this.contractId = contractId;
    }

    public Integer getSendType() {
        return sendType;
    }

    public void setSendType(Integer sendType) {
        this.sendType = sendType;
    }

    public String getLinkman() {
        return linkman;
    }

    public void setLinkman(String linkman) {
        this.linkman = linkman;
    }

    public String getTelSign() {
        return telSign;
    }

    public void setTelSign(String telSign) {
        this.telSign = telSign;
    }

    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    public String getVerifier() {
        return verifier;
    }

    public void setVerifier(String verifier) {
        this.verifier = verifier;
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public String getReceiverAddress() {
        return receiverAddress;
    }

    public void setReceiverAddress(String receiverAddress) {
        this.receiverAddress = receiverAddress;
    }

    @Override
    public Integer getCreator() {
        return creator;
    }

    @Override
    public void setCreator(Integer creator) {
        this.creator = creator;
    }

    @Override
    public Date getCreated() {
        return created;
    }

    @Override
    public void setCreated(Date created) {
        this.created = created;
    }

    @Override
    public Integer getModifier() {
        return modifier;
    }

    @Override
    public void setModifier(Integer modifier) {
        this.modifier = modifier;
    }

    @Override
    public Date getModified() {
        return modified;
    }

    @Override
    public void setModified(Date modified) {
        this.modified = modified;
    }

    @Override
    public Integer getDeleted() {
        return deleted;
    }

    @Override
    public void setDeleted(Integer deleted) {
        this.deleted = deleted;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getContractCode() {
        return contractCode;
    }

    public void setContractCode(String contractCode) {
        this.contractCode = contractCode;
    }

    public String getOperatorName() {
        return operatorName;
    }

    public void setOperatorName(String operatorName) {
        this.operatorName = operatorName;
    }

    public String getCreatedStr() {
        return createdStr;
    }

    public void setCreatedStr(String createdStr) {
        this.createdStr = createdStr;
    }


}