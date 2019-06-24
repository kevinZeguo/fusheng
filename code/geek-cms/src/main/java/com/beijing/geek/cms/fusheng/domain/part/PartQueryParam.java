package com.beijing.geek.cms.fusheng.domain.part;

import com.beijing.geek.cms.sys.domain.common.ListQueryPojo;

/**
 * Created by zhangyongquan on 2017/07/06.
 */
public class PartQueryParam extends ListQueryPojo {
    private String pCode = "";
    private String pName = "";
    private Double pPrice = 0.0;
    private String keyword;
    private String storageId;
    private Integer inEId;
    private Integer outEId;

    public String getpCode() {
        return pCode;
    }

    public void setpCode(String pCode) {
        this.pCode = pCode;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public Double getpPrice() {
        return pPrice;
    }

    public void setpPrice(Double pPrice) {
        this.pPrice = pPrice;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getStorageId() {
        return storageId;
    }

    public void setStorageId(String storageId) {
        this.storageId = storageId;
    }

    public Integer getInEId() {
        return inEId;
    }

    public void setInEId(Integer inEId) {
        this.inEId = inEId;
    }

    public Integer getOutEId() {
        return outEId;
    }

    public void setOutEId(Integer outEId) {
        this.outEId = outEId;
    }
}
