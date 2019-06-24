package com.beijing.geek.cms.fusheng.domain.server;

import com.beijing.geek.cms.sys.domain.common.ListQueryPojo;

public class MaintenanceQueryParam
        extends ListQueryPojo {
    private String cName;//客户名称
    private Integer cId;//客户Id
    private String serviceEngineer;
    private Integer eId;//设备ID
    private String deviceKey;///设备关键字

    public String getcName() {
        return cName;
    }

    public void setcName(String sName) {
        this.cName = sName;
    }

    public Integer getcId() {
        return cId;
    }

    public void setcId(Integer nId) {
        this.cId = nId;
    }

    public String getServiceEngineer() {
        return serviceEngineer;
    }

    public void setServiceEngineer(String sEngineer) {
        this.serviceEngineer = sEngineer;
    }

    public String getDeviceKey() {
        return deviceKey;
    }

    public void setDeviceKey(String sKey) {
        this.deviceKey = sKey;
    }

    public Integer geteId() {
        return eId;
    }

    public void seteId(Integer eId) {
        this.eId = eId;
    }
}
