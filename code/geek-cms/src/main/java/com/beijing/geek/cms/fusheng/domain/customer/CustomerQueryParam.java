package com.beijing.geek.cms.fusheng.domain.customer;

import com.beijing.geek.cms.sys.domain.common.ListQueryPojo;

import java.util.List;

/**
 * Created by mazeguo on 2017/6/12.
 */
public class CustomerQueryParam extends ListQueryPojo {
    private Integer cId;
    private String cName;
    private String address;
    private String contact;
    private String serviceEngineer;
    private List<Integer> serviceEngineerList;
    private String keyword;

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public Integer getcId() {
        return cId;
    }

    public void setcId(Integer cId) {
        this.cId = cId;
    }

    public List<Integer> getServiceEngineerList() {
        return serviceEngineerList;
    }

    public void setServiceEngineerList(List<Integer> serviceEngineerList) {
        this.serviceEngineerList = serviceEngineerList;
    }
}
