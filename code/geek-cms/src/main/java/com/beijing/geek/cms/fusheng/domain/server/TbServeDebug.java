package com.beijing.geek.cms.fusheng.domain.server;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

/**
 * Created by mazeguo on 2017/8/13.
 */
public class TbServeDebug {
    private String userKey;
    private Integer id;
    private String code;
    private Integer customerId;
    //客户信息
    private String cCode;
    private String cName;
    private String contact;
    private String payAcct;
    private String serviceEngineer;
    private String postCode;
    private String address;
    private String phone;
    private String taxNum;
    private String fax;

    //设备信息
    private Integer eqId;
    private String eCode;
    private String eName;
    private String makeDate;//制造日期
    private String eModel;
    private String motorBrand;
    private String makeNum;
    private String elecPanModel;
    private Date motorMakeDate;
    private String formatDate;
    private String formatDebugDate;
    private String hostNum;
    private String note;

    private String debugDate;//调试日期
    private Integer creator;
    private Date created;
    private String createdStr;
    private Integer modifier;
    private Date modified;
    private Integer deleted;

    private String serviceEngineerName;
    private String picIds;//文件Id

    private List<String> attachmentList;
    private String fileIds;//文件列表，多个以逗号分割


    public List<String> getAttachmentList() {
        return attachmentList;
    }

    public void setAttachmentList(List<String> attachmentList) {
        this.attachmentList = attachmentList;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public String getcCode() {
        return cCode;
    }

    public void setcCode(String cCode) {
        this.cCode = cCode;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getPayAcct() {
        return payAcct;
    }

    public void setPayAcct(String payAcct) {
        this.payAcct = payAcct;
    }

    public String getServiceEngineer() {
        return serviceEngineer;
    }

    public void setServiceEngineer(String serviceEngineer) {
        this.serviceEngineer = serviceEngineer;
    }

    public String getPostCode() {
        return postCode;
    }

    public void setPostCode(String postCode) {
        this.postCode = postCode;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getTaxNum() {
        return taxNum;
    }

    public void setTaxNum(String taxNum) {
        this.taxNum = taxNum;
    }

    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    public Integer getEqId() {
        return eqId;
    }

    public void setEqId(Integer eqId) {
        this.eqId = eqId;
    }

    public String geteCode() {
        return eCode;
    }

    public void seteCode(String eCode) {
        this.eCode = eCode;
    }

    public String geteName() {
        return eName;
    }

    public void seteName(String eName) {
        this.eName = eName;
    }

    public String getMakeDate() {
        return makeDate;
    }

    public void setMakeDate(String makeDate) {
        this.makeDate = makeDate;
    }

    public String geteModel() {
        return eModel;
    }

    public void seteModel(String eModel) {
        this.eModel = eModel;
    }

    public String getMotorBrand() {
        return motorBrand;
    }

    public void setMotorBrand(String motorBrand) {
        this.motorBrand = motorBrand;
    }

    public String getMakeNum() {
        return makeNum;
    }

    public void setMakeNum(String makeNum) {
        this.makeNum = makeNum;
    }

    public String getElecPanModel() {
        return elecPanModel;
    }

    public void setElecPanModel(String elecPanModel) {
        this.elecPanModel = elecPanModel;
    }

    public Date getMotorMakeDate() {
        return motorMakeDate;
    }

    public void setMotorMakeDate(Date motorMakeDate) {
        this.motorMakeDate = motorMakeDate;
    }

    public String getFormatDate() {
        return formatDate;
    }

    public void setFormatDate(String formatDate) {
        this.formatDate = formatDate;
    }

    public String getFormatDebugDate() {
        return formatDebugDate;
    }

    public void setFormatDebugDate(String formatDebugDate) {
        this.formatDebugDate = formatDebugDate;
    }

    public String getHostNum() {
        return hostNum;
    }

    public void setHostNum(String hostNum) {
        this.hostNum = hostNum;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Integer getCreator() {
        return creator;
    }

    public void setCreator(Integer creator) {
        this.creator = creator;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public String getCreatedStr() {
        return createdStr;
    }

    public void setCreatedStr(String createdStr) {
        this.createdStr = createdStr;
    }

    public Integer getModifier() {
        return modifier;
    }

    public void setModifier(Integer modifier) {
        this.modifier = modifier;
    }

    public Date getModified() {
        return modified;
    }

    public void setModified(Date modified) {
        this.modified = modified;
    }

    public Integer getDeleted() {
        return deleted;
    }

    public void setDeleted(Integer deleted) {
        this.deleted = deleted;
    }

    public String getDebugDate() {
        return debugDate;
    }

    public void setDebugDate(String debugDate) {
        this.debugDate = debugDate;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getPicIds() {
        return picIds;
    }

    public void setPicIds(String picIds) {
        this.picIds = picIds;
    }

    public String getServiceEngineerName() {
        return serviceEngineerName;
    }

    public void setServiceEngineerName(String serviceEngineerName) {
        this.serviceEngineerName = serviceEngineerName;
    }

    public String getUserKey() {
        return userKey;
    }

    public void setUserKey(String userKey) {
        this.userKey = userKey;
    }

    public String getFileIds() {
        return fileIds;
    }

    public void setFileIds(String fileIds) {
        this.fileIds = fileIds;
    }
}
