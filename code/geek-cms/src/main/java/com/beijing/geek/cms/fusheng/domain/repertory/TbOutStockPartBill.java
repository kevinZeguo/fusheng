package com.beijing.geek.cms.fusheng.domain.repertory;

import java.util.Date;

/**
 * Created by mazeguo on 2017/7/9.
 */
public class TbOutStockPartBill {
    private Integer id;//11) NOT NULL AUTO_INCREMENT COMMENT '出库配件单ID',
    private Integer osbId;//11) DEFAULT NULL COMMENT '出库单ID',
    private Integer pId;//11) DEFAULT NULL COMMENT '配件ID',
    private String pCode;//(500) DEFAULT NULL COMMENT '配件编号',
    private String pName;//(128) NOT NULL COMMENT '配件名称',
    private String supplier;//(100) DEFAULT NULL COMMENT '供货商',
    private Double price;// double DEFAULT NULL COMMENT '配件价格',
    private Double num;// double DEFAULT NULL COMMENT '入库数',
    private Integer unit;// Int('') DEFAULT NULL COMMENT '单位',
    private Double taxAmt;// double DEFAULT NULL COMMENT '含税金额:价格的17%自动计算',
    private Double totalAmt;// double DEFAULT NULL COMMENT '总价',
    private String note;//(500) DEFAULT NULL COMMENT '备注',
    private String creator;//11) DEFAULT NULL COMMENT '创建人',
    private Date created;//datetime DEFAULTNULL COMMENT'创建时间',
    private String createdStr;//datetime DEFAULTNULL COMMENT'创建时间',
    private String modifier;//11) DEFAULT NULL COMMENT '修改人',
    private Date modified;//datetime DEFAULTNULL COMMENT'修改时间',
    private Integer deleted;//2) DEFAULT NULL COMMENT '删除标示',

    private Integer coId;//合同编号Id
    private String coACode;//系统合同编号
    private String coBCode;//用户合同编号

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOsbId() {
        return osbId;
    }

    public void setOsbId(Integer osbId) {
        this.osbId = osbId;
    }

    public Integer getpId() {
        return pId;
    }

    public void setpId(Integer pId) {
        this.pId = pId;
    }

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

    public String getSupplier() {
        return supplier;
    }

    public void setSupplier(String supplier) {
        this.supplier = supplier;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Double getNum() {
        return num;
    }

    public void setNum(Double num) {
        this.num = num;
    }

    public Integer getUnit() {
        return unit;
    }

    public void setUnit(Integer unit) {
        this.unit = unit;
    }

    public Double getTaxAmt() {
        return taxAmt;
    }

    public void setTaxAmt(Double taxAmt) {
        this.taxAmt = taxAmt;
    }

    public Double getTotalAmt() {
        return totalAmt;
    }

    public void setTotalAmt(Double totalAmt) {
        this.totalAmt = totalAmt;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public String getModifier() {
        return modifier;
    }

    public void setModifier(String modifier) {
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

    public Integer getCoId() {
        return coId;
    }

    public void setCoId(Integer coId) {
        this.coId = coId;
    }

    public String getCoACode() {
        return coACode;
    }

    public void setCoACode(String coACode) {
        this.coACode = coACode;
    }

    public String getCoBCode() {
        return coBCode;
    }

    public void setCoBCode(String coBCode) {
        this.coBCode = coBCode;
    }

    public String getCreatedStr() {
        return createdStr;
    }

    public void setCreatedStr(String createdStr) {
        this.createdStr = createdStr;
    }
}
