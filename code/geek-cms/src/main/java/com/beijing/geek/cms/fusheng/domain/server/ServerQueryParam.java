package com.beijing.geek.cms.fusheng.domain.server;

import com.beijing.geek.cms.sys.domain.common.ListQueryPojo;

import java.util.List;

/**
 * Created by mazeguo on 2017/8/13.
 */
public class ServerQueryParam extends ListQueryPojo {
    private Integer customerId;
    private Integer eqId;
    private String key;
    private String startDate;
    private String endDate;
    private Integer serviceEngineer;
    private Integer id;//设备保单Id
    private List<Integer> serviceEngineerList;

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

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
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

    public Integer getServiceEngineer() {
        return serviceEngineer;
    }

    public void setServiceEngineer(Integer serviceEngineer) {
        this.serviceEngineer = serviceEngineer;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public List<Integer> getServiceEngineerList() {
        return serviceEngineerList;
    }

    public void setServiceEngineerList(List<Integer> serviceEngineerList) {
        this.serviceEngineerList = serviceEngineerList;
    }
}
