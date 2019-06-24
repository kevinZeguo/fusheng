package com.beijing.geek.cms.fusheng.domain.server;

import java.util.Date;
import java.util.List;

/**
 * Created by mazeguo on 2017/8/20.
 */
public class TbServePolling {
    private String userKey;
    private Integer id;
    private String code;
    private Integer customerId;
    //客户信息
    private String cCode;
    private String cName;
    private String contact;
    private String payAcct;
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
    private Integer creator;
    private Date created;
    private String createdStr;
    private Integer modifier;
    private Date modified;
    private Integer deleted;

    private String serviceEngineerName;

    private String envTemperature;//环境温度
    private String exhaustTemperature;//排气温度
    private String MPa;//冷却水压
    private String hoursToStream;//运转时数;//
    private String operatingPressure;//运转气压;//
    private String operatingOilPressure;//运转油压
    private String RSPressure;//RS
    private String RTPressure;//RT;//
    private String STPressure;//ST
    private String RElectric;//R线;//
    private String SElectric;//S线;//
    private String TElectric;//T线
    private Integer isFastening;//电控盘及电视机大线螺丝是否紧固
    private Integer isTerminalNormal;//接触器接线柱颜色、动作是否正常
    private Integer isOilBarrelsNormal;//油气桶在停一段时间后是否经常放水
    private Integer isFactory;//配件来源是否正厂
    private Integer isThermalNormal;//热控阀动作是否正常;//;//
    private Integer isTemperatureNormal;//冷却水温是否正常;//
    private Integer isMotorNormal;//电机、主机是否正常;//
    private Integer isRadiatorNormal;//散热器是否定期修理;//
    private Integer isPipelinesNormal;//各管路是否漏油现象;//
    private Integer isMaintenanceNormal;//压力维持阀是否开启正常;//;//
    private Integer isOilColorNormal;//油品颜色是否正常;//
    private Integer isTightnessNormal;//皮带松紧度是否正常;//
    private Integer isThreeFilterNormal;//三滤压差开关是否正常;//
    private Integer isPulleyNormal;//电机皮带轮是否与主机;//
    private Integer isCabinetNormal;//机柜各过滤网是否定期清理;//
    private Integer isPipeFilterNormal;//管路过滤器是否正常排水;//
    private Integer isDoorsNormal;//机器各门是否关闭运行;//
    private Integer isAutomaticNormal;//自动排污阀是否经常排污;//
    private Integer isUseEnvNormal;//使用环境是否良好;//
    private Integer isVolumeNormal;//容调点是否合适;//
    private Integer isMRegularlyNormal;//机器是否定期保养;//
    private Integer isMotorRegularlyNormal;//电机是否定期检查、保养、加油
    private String engineerSuggest;//服务人员建议
    private String feedback;//客户意见;//
    private String serviceEngineer;//服务工程师
    private Integer attitude;//满意度
    private String serviceDate;//服务日期
    private List<String> attachmentList;
    private String fileIds;//文件列表，多个以逗号分割

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public Integer getEqId() {
        return eqId;
    }

    public void setEqId(Integer eqId) {
        this.eqId = eqId;
    }

    public String getEnvTemperature() {
        return envTemperature;
    }

    public void setEnvTemperature(String envTemperature) {
        this.envTemperature = envTemperature;
    }

    public String getExhaustTemperature() {
        return exhaustTemperature;
    }

    public void setExhaustTemperature(String exhaustTemperature) {
        this.exhaustTemperature = exhaustTemperature;
    }

    public String getMPa() {
        return MPa;
    }

    public void setMPa(String MPa) {
        this.MPa = MPa;
    }

    public String getHoursToStream() {
        return hoursToStream;
    }

    public void setHoursToStream(String hoursToStream) {
        this.hoursToStream = hoursToStream;
    }

    public String getOperatingPressure() {
        return operatingPressure;
    }

    public void setOperatingPressure(String operatingPressure) {
        this.operatingPressure = operatingPressure;
    }

    public String getOperatingOilPressure() {
        return operatingOilPressure;
    }

    public void setOperatingOilPressure(String operatingOilPressure) {
        this.operatingOilPressure = operatingOilPressure;
    }

    public String getRSPressure() {
        return RSPressure;
    }

    public void setRSPressure(String RSPressure) {
        this.RSPressure = RSPressure;
    }

    public String getRTPressure() {
        return RTPressure;
    }

    public void setRTPressure(String RTPressure) {
        this.RTPressure = RTPressure;
    }

    public String getSTPressure() {
        return STPressure;
    }

    public void setSTPressure(String STPressure) {
        this.STPressure = STPressure;
    }

    public String getRElectric() {
        return RElectric;
    }

    public void setRElectric(String RElectric) {
        this.RElectric = RElectric;
    }

    public String getSElectric() {
        return SElectric;
    }

    public void setSElectric(String SElectric) {
        this.SElectric = SElectric;
    }

    public String getTElectric() {
        return TElectric;
    }

    public void setTElectric(String TElectric) {
        this.TElectric = TElectric;
    }

    public Integer getIsFastening() {
        return isFastening;
    }

    public void setIsFastening(Integer isFastening) {
        this.isFastening = isFastening;
    }

    public Integer getIsTerminalNormal() {
        return isTerminalNormal;
    }

    public void setIsTerminalNormal(Integer isTerminalNormal) {
        this.isTerminalNormal = isTerminalNormal;
    }

    public Integer getIsOilBarrelsNormal() {
        return isOilBarrelsNormal;
    }

    public void setIsOilBarrelsNormal(Integer isOilBarrelsNormal) {
        this.isOilBarrelsNormal = isOilBarrelsNormal;
    }

    public Integer getIsFactory() {
        return isFactory;
    }

    public void setIsFactory(Integer isFactory) {
        this.isFactory = isFactory;
    }

    public Integer getIsThermalNormal() {
        return isThermalNormal;
    }

    public void setIsThermalNormal(Integer isThermalNormal) {
        this.isThermalNormal = isThermalNormal;
    }

    public Integer getIsTemperatureNormal() {
        return isTemperatureNormal;
    }

    public void setIsTemperatureNormal(Integer isTemperatureNormal) {
        this.isTemperatureNormal = isTemperatureNormal;
    }

    public Integer getIsMotorNormal() {
        return isMotorNormal;
    }

    public void setIsMotorNormal(Integer isMotorNormal) {
        this.isMotorNormal = isMotorNormal;
    }

    public Integer getIsRadiatorNormal() {
        return isRadiatorNormal;
    }

    public void setIsRadiatorNormal(Integer isRadiatorNormal) {
        this.isRadiatorNormal = isRadiatorNormal;
    }

    public Integer getIsPipelinesNormal() {
        return isPipelinesNormal;
    }

    public void setIsPipelinesNormal(Integer isPipelinesNormal) {
        this.isPipelinesNormal = isPipelinesNormal;
    }

    public Integer getIsMaintenanceNormal() {
        return isMaintenanceNormal;
    }

    public void setIsMaintenanceNormal(Integer isMaintenanceNormal) {
        this.isMaintenanceNormal = isMaintenanceNormal;
    }

    public Integer getIsOilColorNormal() {
        return isOilColorNormal;
    }

    public void setIsOilColorNormal(Integer isOilColorNormal) {
        this.isOilColorNormal = isOilColorNormal;
    }

    public Integer getIsTightnessNormal() {
        return isTightnessNormal;
    }

    public void setIsTightnessNormal(Integer isTightnessNormal) {
        this.isTightnessNormal = isTightnessNormal;
    }

    public Integer getIsThreeFilterNormal() {
        return isThreeFilterNormal;
    }

    public void setIsThreeFilterNormal(Integer isThreeFilterNormal) {
        this.isThreeFilterNormal = isThreeFilterNormal;
    }

    public Integer getIsPulleyNormal() {
        return isPulleyNormal;
    }

    public void setIsPulleyNormal(Integer isPulleyNormal) {
        this.isPulleyNormal = isPulleyNormal;
    }

    public Integer getIsCabinetNormal() {
        return isCabinetNormal;
    }

    public void setIsCabinetNormal(Integer isCabinetNormal) {
        this.isCabinetNormal = isCabinetNormal;
    }

    public Integer getIsPipeFilterNormal() {
        return isPipeFilterNormal;
    }

    public void setIsPipeFilterNormal(Integer isPipeFilterNormal) {
        this.isPipeFilterNormal = isPipeFilterNormal;
    }

    public Integer getIsDoorsNormal() {
        return isDoorsNormal;
    }

    public void setIsDoorsNormal(Integer isDoorsNormal) {
        this.isDoorsNormal = isDoorsNormal;
    }

    public Integer getIsAutomaticNormal() {
        return isAutomaticNormal;
    }

    public void setIsAutomaticNormal(Integer isAutomaticNormal) {
        this.isAutomaticNormal = isAutomaticNormal;
    }

    public Integer getIsUseEnvNormal() {
        return isUseEnvNormal;
    }

    public void setIsUseEnvNormal(Integer isUseEnvNormal) {
        this.isUseEnvNormal = isUseEnvNormal;
    }

    public Integer getIsVolumeNormal() {
        return isVolumeNormal;
    }

    public void setIsVolumeNormal(Integer isVolumeNormal) {
        this.isVolumeNormal = isVolumeNormal;
    }

    public Integer getIsMRegularlyNormal() {
        return isMRegularlyNormal;
    }

    public void setIsMRegularlyNormal(Integer isMRegularlyNormal) {
        this.isMRegularlyNormal = isMRegularlyNormal;
    }

    public Integer getIsMotorRegularlyNormal() {
        return isMotorRegularlyNormal;
    }

    public void setIsMotorRegularlyNormal(Integer isMotorRegularlyNormal) {
        this.isMotorRegularlyNormal = isMotorRegularlyNormal;
    }

    public String getEngineerSuggest() {
        return engineerSuggest;
    }

    public void setEngineerSuggest(String engineerSuggest) {
        this.engineerSuggest = engineerSuggest;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    public String getServiceEngineer() {
        return serviceEngineer;
    }

    public void setServiceEngineer(String serviceEngineer) {
        this.serviceEngineer = serviceEngineer;
    }

    public Integer getAttitude() {
        return attitude;
    }

    public void setAttitude(Integer attitude) {
        this.attitude = attitude;
    }

    public String getServiceDate() {
        return serviceDate;
    }

    public void setServiceDate(String serviceDate) {
        this.serviceDate = serviceDate;
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
}
