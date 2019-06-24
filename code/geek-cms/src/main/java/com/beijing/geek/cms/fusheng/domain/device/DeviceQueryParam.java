package com.beijing.geek.cms.fusheng.domain.device;

import com.beijing.geek.cms.sys.domain.common.ListQueryPojo;

import java.util.List;

/**
 * Created by mazeguo on 2017/6/12.
 */
public class DeviceQueryParam extends ListQueryPojo {
    private String eModel;//机型
    private String makeNum;//制造号码
    private String hostNum;//主机编码
    private String cName;//客户名称
    private Integer cId;//客户Id
    private String serviceEngineer;
    private Integer eId;//设备Id
    private String pIds;//配件Id
    private List<Integer> pIdList;//配件Id列表
    private List<Integer> serviceEngineerList;
    private String keyword;//关键字

    public String geteModel() {
        return eModel;
    }

    public void seteModel(String eModel) {
        this.eModel = eModel;
    }

    public String getMakeNum() {
        return makeNum;
    }

    public void setMakeNum(String makeNum) {
        this.makeNum = makeNum;
    }

    public String getHostNum() {
        return hostNum;
    }

    public void setHostNum(String hostNum) {
        this.hostNum = hostNum;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }

    public Integer getcId() {
        return cId;
    }

    public void setcId(Integer cId) {
        this.cId = cId;
    }

    public String getServiceEngineer() {
        return serviceEngineer;
    }

    public void setServiceEngineer(String serviceEngineer) {
        this.serviceEngineer = serviceEngineer;
    }

    public Integer geteId() {
        return eId;
    }

    public void seteId(Integer eId) {
        this.eId = eId;
    }

    public List<Integer> getServiceEngineerList() {
        return serviceEngineerList;
    }

    public void setServiceEngineerList(List<Integer> serviceEngineerList) {
        this.serviceEngineerList = serviceEngineerList;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getpIds() {
        return pIds;
    }

    public void setpIds(String pIds) {
        this.pIds = pIds;
    }

    public List<Integer> getpIdList() {
        return pIdList;
    }

    public void setpIdList(List<Integer> pIdList) {
        this.pIdList = pIdList;
    }
}
