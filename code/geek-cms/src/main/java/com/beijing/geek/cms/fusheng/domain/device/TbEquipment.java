package com.beijing.geek.cms.fusheng.domain.device;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

public class TbEquipment implements Serializable {
    private Integer eId;
    private String eCode;
    private String eName;
    private Integer customerId;
    //客户信息
    private String cCode;//客户编码
    private String contact;//联系方式
    private String serviceEngineer;//服务工程师
    private String serviceEngineerName;//服务工程师姓名
    private String postCode;//邮编
    private String address;//联系地址
    private String phone;//联系电话
    private String taxNum;//税号
    private String makeDate;//制造日期
    private String eModel;
    private String motorBrand;
    private String makeNum;
    private String elecPanModel;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date motorMakeDate;
    private String formatDate;
    private String formatDebugDate;
    private String hostNum;
    private String note;
    private Integer creator;
    private Date created;
    private String createdStr;
    private Integer modifier;
    private Date modified;
    private Integer deleted = 0;
    private String cName;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date debugDate;
    private Integer regularCheck;
    private Integer checkMonths;
    private String oldHostNum;
    private String ePicIds;
    private List<String> ePicUrlList;
    private String motorModel;//电机型号
    private String machineryNumber;//电机出厂编号
    private static final long serialVersionUID = 1L;
    private String fileIds;

    public Integer geteId() {
        return eId;
    }

    public void seteId(Integer eId) {
        this.eId = eId;
    }

    public String getFormatDebugDate() {
        return formatDebugDate;
    }

    public void setFormatDebugDate(String formatDebugDate) {
        this.formatDebugDate = formatDebugDate;
    }

    public Integer getRegularCheck() {
        return regularCheck;
    }

    public void setRegularCheck(Integer regularCheck) {
        this.regularCheck = regularCheck;
    }

    public Integer getCheckMonths() {
        return checkMonths;
    }

    public void setCheckMonths(Integer checkMonths) {
        this.checkMonths = checkMonths;
    }

    public String getOldHostNum() {
        return oldHostNum;
    }

    public void setOldHostNum(String oldHostNum) {
        this.oldHostNum = oldHostNum;
    }

    public Date getDebugDate() {
        return debugDate;
    }

    public void setDebugDate(Date debugDate) {
        this.debugDate = debugDate;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getFormatDate() {
        return formatDate;
    }

    public void setFormatDate(String formatDate) {
        this.formatDate = formatDate;
    }

    public String getHostNum() {
        return hostNum;
    }

    public void setHostNum(String hostNum) {
        this.hostNum = hostNum;
    }

    public String geteCode() {
        return eCode;
    }

    public void seteCode(String eCode) {
        this.eCode = eCode == null ? null : eCode.trim();
    }

    public String geteName() {
        return eName;
    }

    public void seteName(String eName) {
        this.eName = eName == null ? null : eName.trim();
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public String geteModel() {
        return eModel;
    }

    public void seteModel(String eModel) {
        this.eModel = eModel == null ? null : eModel.trim();
    }

    public String getMotorBrand() {
        return motorBrand;
    }

    public void setMotorBrand(String motorBrand) {
        this.motorBrand = motorBrand == null ? null : motorBrand.trim();
    }

    public String getMakeNum() {
        return makeNum;
    }

    public void setMakeNum(String makeNum) {
        this.makeNum = makeNum == null ? null : makeNum.trim();
    }

    public String getElecPanModel() {
        return elecPanModel;
    }

    public void setElecPanModel(String elecPanModel) {
        this.elecPanModel = elecPanModel == null ? null : elecPanModel.trim();
    }

    public Date getMotorMakeDate() {
        return motorMakeDate;
    }

    public void setMotorMakeDate(Date motorMakeDate) {
        this.motorMakeDate = motorMakeDate;
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

    public String getcCode() {
        return cCode;
    }

    public void setcCode(String cCode) {
        this.cCode = cCode;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
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

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public String getServiceEngineerName() {
        return serviceEngineerName;
    }

    public void setServiceEngineerName(String serviceEngineerName) {
        this.serviceEngineerName = serviceEngineerName;
    }

    public String getePicIds() {
        return ePicIds;
    }

    public void setePicIds(String ePicIds) {
        this.ePicIds = ePicIds;
    }

    public String getMakeDate() {
        return makeDate;
    }

    public void setMakeDate(String makeDate) {
        this.makeDate = makeDate;
    }

    public String getCreatedStr() {
        return createdStr;
    }

    public void setCreatedStr(String createdStr) {
        this.createdStr = createdStr;
    }

    public List<String> getEPicUrlList() {
        return ePicUrlList;
    }

    public void setEPicUrlList(List<String> ePicUrlList) {
        this.ePicUrlList = ePicUrlList;
    }

    public List<String> getePicUrlList() {
        return ePicUrlList;
    }

    public void setePicUrlList(List<String> ePicUrlList) {
        this.ePicUrlList = ePicUrlList;
    }

    public String getMotorModel() {
        return motorModel;
    }

    public void setMotorModel(String motorModel) {
        this.motorModel = motorModel;
    }

    public String getMachineryNumber() {
        return machineryNumber;
    }

    public void setMachineryNumber(String machineryNumber) {
        this.machineryNumber = machineryNumber;
    }

    public String getFileIds() {
        return fileIds;
    }

    public void setFileIds(String fileIds) {
        this.fileIds = fileIds;
    }
}