package com.beijing.geek.cms.fusheng.domain.device;

import com.beijing.geek.cms.fusheng.domain.part.TbPart;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TbEquPart extends TbPart {
    private Integer id;
    private Integer eId;
    private String eName;
    private String eCode;
    private Integer pId;
    private String pCode;
    private String pName;
    private String note;
    private String fileIds;
    private Integer creator;
    private String creatorName;
    private Date created;
    private String formatCreated;
    private Integer modifier;
    private Date modifed;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer geteId() {
        return eId;
    }

    public void seteId(Integer eId) {
        this.eId = eId;
    }

    public String geteName() {
        return eName;
    }

    public void seteName(String eName) {
        this.eName = eName;
    }

    public String geteCode() {
        return eCode;
    }

    public void seteCode(String eCode) {
        this.eCode = eCode;
    }

    @Override
    public Integer getCreator() {
        return creator;
    }

    @Override
    public void setCreator(Integer creator) {
        this.creator = creator;
    }

    @Override
    public Date getCreated() {
        return created;
    }

    @Override
    public void setCreated(Date created) {
        this.created = created;
    }

    @Override
    public Integer getModifier() {
        return modifier;
    }

    @Override
    public void setModifier(Integer modifier) {
        this.modifier = modifier;
    }

    public Date getModifed() {
        return modifed;
    }

    public void setModifed(Date modifed) {
        this.modifed = modifed;
    }

    @Override
    public Integer getpId() {
        return pId;
    }

    @Override
    public void setpId(Integer pId) {
        this.pId = pId;
    }

    @Override
    public String getpCode() {
        return pCode;
    }

    @Override
    public void setpCode(String pCode) {
        this.pCode = pCode;
    }

    @Override
    public String getpName() {
        return pName;
    }

    @Override
    public void setpName(String pName) {
        this.pName = pName;
    }

    @Override
    public String getNote() {
        return note;
    }

    @Override
    public void setNote(String note) {
        this.note = note;
    }

    @Override
    public String getFileIds() {
        return fileIds;
    }

    @Override
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
        if(created != null){
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            return df.format(created);
        }
        return formatCreated;
    }

    public void setFormatCreated(String formatCreated) {
        this.formatCreated = formatCreated;
    }
}
