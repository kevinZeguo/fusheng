package com.beijing.geek.cms.fusheng.domain.part;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by zhangyongquan on 2017/07/06.
 */
public class TbPart {
    private Integer pId;
    private String pCode;
    private String pName;
    private Double pPrice;
    private String pPic;
    private String pPicFile;
    private String note;
    private Integer stockNum;
    private Integer creator;
    private Date created;
    private Integer modifier;
    private Date modified;
    private Integer deleted;
    private String createdStr;
    private Integer leftCount;
    private String fileIds;
    private String creatorName;
    private String formatCreated;

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

    public Double getpPrice() {
        return pPrice;
    }

    public void setpPrice(Double pPrice) {
        this.pPrice = pPrice;
    }

    public String getpPic() {
        return pPic;
    }

    public void setpPic(String pPic) {
        this.pPic = pPic;
    }

    public String getpPicFile() {
        return pPicFile;
    }

    public void setpPicFile(String pPicFile) {
        this.pPicFile = pPicFile;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String sNote) {
        this.note = sNote;
    }

    public Integer getStockNum() {
        return stockNum;
    }

    public void setStockNum(Integer stockNum) {
        this.stockNum = stockNum;
    }

    public Integer getCreator() {
        return creator;
    }

    public void setCreator(Integer iCreator) {
        this.creator = iCreator;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date deCreated) {
        this.created = deCreated;
    }

    public Integer getModifier() {
        return modifier;
    }

    public void setModifier(Integer iModifier) {
        this.modifier = iModifier;
    }

    public Date getModified() {
        return modified;
    }

    public void setModified(Date deModified) {
        this.modified = deModified;
    }

    public Integer getDeleted() {
        return deleted;
    }

    public void setDeleted(Integer iDeleted) {
        this.deleted = iDeleted;
    }

    public String getCreatedStr() {
        return createdStr;
    }

    public void setCreatedStr(String createdStr) {
        this.createdStr = createdStr;
    }

    public Integer getLeftCount() {
        return leftCount;
    }

    public void setLeftCount(Integer leftCount) {
        this.leftCount = leftCount;
    }

    public String getFileIds() {
        return fileIds;
    }

    public void setFileIds(String fileIds) {
        this.fileIds = fileIds;
    }

    public String getCreatorName() {
        return creatorName;
    }

    public void setCreatorName(String creatorName) {
        this.creatorName = creatorName;
    }

    public String getFormatCreated() {
        if (created != null) {
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            return df.format(created);
        }
        return formatCreated;
    }

    public void setFormatCreated(String formatCreated) {
        this.formatCreated = formatCreated;
    }
}
