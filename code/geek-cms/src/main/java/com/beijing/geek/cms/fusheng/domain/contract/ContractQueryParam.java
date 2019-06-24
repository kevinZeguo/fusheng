package com.beijing.geek.cms.fusheng.domain.contract;

import com.beijing.geek.cms.sys.domain.common.ListQueryPojo;

/**
 * Created by zhangyongquan on 2017/6/12.
 */
public class ContractQueryParam extends ListQueryPojo {
    private String contractCode = "";
    private String customerName = "";
    private Integer cId;
    private int isOpenInvoice = -1;
    private int isSendGoods = -1;
    private int isCashBack = -1;
    private int queryContractType = -1;

    public String getContractCode() {
        return contractCode;
    }

    public void setContractCode(String sContCode) {
        this.contractCode = sContCode;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String sCustName) {
        this.customerName = sCustName;
    }

    public int getIsOpenInvoice() {
        return isOpenInvoice;
    }

    public void setIsOpenInvoice(int nIsOpenInvoice) {
        this.isOpenInvoice = nIsOpenInvoice;
    }

    public int getIsSendGoods() {
        return isSendGoods;
    }

    public void setIsSendGoods(int nIsSendGoods) {
        this.isSendGoods = nIsSendGoods;
    }

    public int getIsCashBack() {
        return isCashBack;
    }

    public void setIsCashBack(int nIsCashBack) {
        this.isCashBack = nIsCashBack;
    }

    public int getQueryContractType() {
        return queryContractType;
    }

    public void setQueryContractType(int nContractType) {
        this.queryContractType = nContractType;
    }

    public Integer getcId() {
        return cId;
    }

    public void setcId(Integer cId) {
        this.cId = cId;
    }

}
