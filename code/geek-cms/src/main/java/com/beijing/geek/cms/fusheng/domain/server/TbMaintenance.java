package com.beijing.geek.cms.fusheng.domain.server;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

public class TbMaintenance {
    private String userKey;
    private Integer id;///
    private String mCode;///单据编码
    private Integer cId;///客户ID
    private String cCode;///客户编码
    private String cName;///客户名称
    private String cPhone;///客户电话
    private String cContact;///客户联系人
    private String cAddress;///客户地址
    private String cView;///客户意见
    private String repairContent;///报修内容
    private String faultReason;///故障原因    
    private String eModel;///设备型号
    private String hostNum;///主机编号
    private String oldHostNum;///旧主机编号
    private String makeNum;///制造号码
    private String makeDate;///制造日期
    private String motorBrand;///电机厂牌
    private String formatMotorMakeDate;///电机制造日期
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date motorMakeDate;///电机制造日期
    private Double workTimes;///运行时数
    private Double gearSpeed;///齿轮速比
    private Double exhaustPressure;///排气压力
    private Double exhaustTemperature;///排气温度
    private Double envTemperature;///环境温度
    private Double oilPressure;///油压
    private Double runningVoltage;///运转电压
    private Double runningElec;///运转电流

    private String serviceEngineer;//服务工程师
    private String serviceEngineerName;//服务工程师姓名  serviceEngineerName
    private String formatServiceDate;///服务日期
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date serviceDate;///服务日期
    private String serviceContent;///服务内容
    private String serviceContentDesc;///服务内容
    private String serviceOtherContent;//其他服务内容
    private String engineerSuggest;///服务员建议
    private Double serviceFees;///服务费用
    private String note;///备注
    private Integer creator;

    private Date created;

    private Integer modifier;

    private Date modified;

    private Integer deleted;

    private Integer eId;

    private String picIds;
    private List<String> attachmentList;//附件
    private String fileIds;//文件列表，多个以逗号分割


    public Integer getId() {
        return id;
    }

    public void setId(Integer nId) {
        this.id = nId;
    }

    public String getmCode() {
        return mCode;
    }

    public void setmCode(String sCode) {
        this.mCode = sCode;
    }

    public Integer getCustomerId() {
        return cId;
    }

    public void setCustomerId(Integer cId) {
        this.cId = cId;
    }

    public String getcCode() {
        return cCode;
    }

    public void setcCode(String sCode) {
        this.cCode = sCode;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String sName) {
        this.cName = sName;
    }

    public String getcPhone() {
        return cPhone;
    }

    public void setcPhone(String sPhone) {
        this.cPhone = sPhone;
    }

    public String getcContact() {
        return cContact;
    }

    public void setcContact(String sContact) {
        this.cContact = sContact;
    }

    public String getcAddress() {
        return cAddress;
    }

    public void setcAddress(String sAddress) {
        this.cAddress = sAddress;
    }

    public String getcView() {
        return cView;
    }

    public void setcView(String sView) {
        this.cView = sView;
    }

    public String getRepairContent() {
        return repairContent;
    }

    public void setRepairContent(String sRepair) {
        this.repairContent = sRepair;
    }

    public String getFaultReason() {
        return faultReason;
    }

    public void setFaultReason(String sFaultReason) {
        this.faultReason = sFaultReason;
    }

    public String geteModel() {
        return eModel;
    }

    public void seteModel(String sEmodel) {
        this.eModel = sEmodel;
    }

    public String getHostNum() {
        return hostNum;
    }

    public void setHostNum(String sHostNum) {
        this.hostNum = sHostNum;
    }

    public String getOldHostNum() {
        return oldHostNum;
    }

    public void setOldHostNum(String sOldHostNum) {
        this.oldHostNum = sOldHostNum;
    }

    public String getMakeNum() {
        return makeNum;
    }

    public void setMakeNum(String sMakeNum) {
        this.makeNum = sMakeNum;
    }

    public String getMakeDate() {
        return makeDate;
    }

    public void setMakeDate(String sMakeDate) {
        this.makeDate = sMakeDate;
    }

    public String getMotorBrand() {
        return motorBrand;
    }

    public void setMotorBrand(String sMotorBrand) {
        this.motorBrand = sMotorBrand;
    }

    public String getFormatMotorMakeDate() {
        return formatMotorMakeDate;
    }

    public void setFormatMotorMakeDate(String sMotorMakeDate) {
        this.formatMotorMakeDate = sMotorMakeDate;
    }

    public Date getMotorMakeDate() {
        return motorMakeDate;
    }

    public void setMotorMakeDate(Date motorMakeDate) {
        this.motorMakeDate = motorMakeDate;
    }

    public Double getWorkTimes() {
        return workTimes;
    }

    public void setWorkTimes(Double dWorkTimes) {
        this.workTimes = dWorkTimes;
    }

    public Double getGearSpeed() {
        return gearSpeed;
    }

    public void setGearSpeed(Double dGearSpeed) {
        this.gearSpeed = dGearSpeed;
    }

    public Double getExhaustPressure() {
        return exhaustPressure;
    }

    public void setExhaustPressure(Double dExPressure) {
        this.exhaustPressure = dExPressure;
    }

    public Double getExhaustTemperature() {
        return exhaustTemperature;
    }

    public void setExhaustTemperature(Double dExhaustTemp) {
        this.exhaustTemperature = dExhaustTemp;
    }

    public Double getEnvTemperature() {
        return envTemperature;
    }

    public void setEnvTemperature(Double dEnvTemp) {
        this.envTemperature = dEnvTemp;
    }

    public Double getOilPressure() {
        return oilPressure;
    }

    public void setOilPressure(Double dOilPressure) {
        this.oilPressure = dOilPressure;
    }

    public Double getRunningVoltage() {
        return runningVoltage;
    }

    public void setRunningVoltage(Double dVoltage) {
        this.runningVoltage = dVoltage;
    }

    public Double getRunningElec() {
        return runningElec;
    }

    public void setRunningElec(Double dRunningElec) {
        this.runningElec = dRunningElec;
    }

    public String getServiceEngineer() {
        return serviceEngineer;
    }

    public void setServiceEngineer(String sServiceEngineer) {
        this.serviceEngineer = sServiceEngineer;
    }

    public String getServiceEngineerName() {
        return serviceEngineerName;
    }

    public void setServiceEngineerName(String sName) {
        this.serviceEngineerName = sName;
    }

    public String getFormatServiceDate() {
        return formatServiceDate;
    }

    public void setFormatServiceDate(String sServiceDate) {
        this.formatServiceDate = sServiceDate;
    }

    public Date getServiceDate() {
        return serviceDate;
    }

    public void setServiceDate(Date dServiceDate) {
        this.serviceDate = dServiceDate;
    }

    public String getServiceCotent() {
        return serviceContent;
    }

    public void setServiceContent(String sServiceContent) {
        this.serviceContent = sServiceContent;
    }

    public String getServiceSuggest() {
        return engineerSuggest;
    }

    public void setServiceSuggest(String sSuggest) {
        this.engineerSuggest = sSuggest;
    }

    public Double getServiceFees() {
        return serviceFees;
    }

    public void setServiceFees(Double dFees) {
        this.serviceFees = dFees;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String sNote) {
        this.note = sNote;
    }

    public Integer getCreator() {
        return creator;
    }

    public void setCreator(Integer nCreator) {
        this.creator = nCreator;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date dCreated) {
        this.created = dCreated;
    }

    public Integer getModifier() {
        return modifier;
    }

    public void setModifier(Integer nModifier) {
        this.modifier = nModifier;
    }

    public Date getModified() {
        return modified;
    }

    public void setModified(Date dModified) {
        this.modified = dModified;
    }

    public Integer getDeleted() {
        return deleted;
    }

    public void setDeleted(Integer nDel) {
        this.deleted = nDel;
    }

    public Integer getDeviceId() {
        return eId;
    }

    public void setDeviceId(Integer eId) {
        this.eId = eId;
    }

    public String getPicIds() {
        return picIds;
    }

    public void setPicIds(String sPicIds) {
        this.picIds = sPicIds;
    }

    public Integer getcId() {
        return cId;
    }

    public void setcId(Integer cId) {
        this.cId = cId;
    }

    public String getServiceContent() {
        return serviceContent;
    }

    public String getEngineerSuggest() {
        return engineerSuggest;
    }

    public void setEngineerSuggest(String engineerSuggest) {
        this.engineerSuggest = engineerSuggest;
    }

    public Integer geteId() {
        return eId;
    }

    public void seteId(Integer eId) {
        this.eId = eId;
    }

    public String getUserKey() {
        return userKey;
    }

    public void setUserKey(String userKey) {
        this.userKey = userKey;
    }

    public String getServiceOtherContent() {
        return serviceOtherContent;
    }

    public void setServiceOtherContent(String serviceOtherContent) {
        this.serviceOtherContent = serviceOtherContent;
    }

    public List<String> getAttachmentList() {
        return attachmentList;
    }

    public void setAttachmentList(List<String> attachmentList) {
        this.attachmentList = attachmentList;
    }

    public String getFileIds() {
        return fileIds;
    }

    public void setFileIds(String fileIds) {
        this.fileIds = fileIds;
    }

    public String getServiceContentDesc() {
        return serviceContentDesc;
    }

    public void setServiceContentDesc(String serviceContentDesc) {
        this.serviceContentDesc = serviceContentDesc;
    }
}
