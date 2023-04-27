package com.pojo;

import java.util.Date;

public class Dict {
    private String id;
    private String typeCode;
    private String dicCode;
    private String dicValue;
    private String disable;
    private String sortNum;
    private String isGb;
    private String creator;
    private Date creationDate;
    private String modifier;
    private Date modifiedDate;
    private String parCode;
    private String dicCodeMapping;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTypeCode() {
        return typeCode;
    }

    public void setTypeCode(String typeCode) {
        this.typeCode = typeCode;
    }

    public String getDicCode() {
        return dicCode;
    }

    public void setDicCode(String dicCode) {
        this.dicCode = dicCode;
    }

    public String getDicValue() {
        return dicValue;
    }

    public void setDicValue(String dicValue) {
        this.dicValue = dicValue;
    }

    public String getDisable() {
        return disable;
    }

    public void setDisable(String disable) {
        this.disable = disable;
    }

    public String getSortNum() {
        return sortNum;
    }

    public void setSortNum(String sortNum) {
        this.sortNum = sortNum;
    }

    public String getIsGb() {
        return isGb;
    }

    public void setIsGb(String isGb) {
        this.isGb = isGb;
    }

    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public String getModifier() {
        return modifier;
    }

    public void setModifier(String modifier) {
        this.modifier = modifier;
    }

    public Date getModifiedDate() {
        return modifiedDate;
    }

    public void setModifiedDate(Date modifiedDate) {
        this.modifiedDate = modifiedDate;
    }

    public String getParCode() {
        return parCode;
    }

    public void setParCode(String parCode) {
        this.parCode = parCode;
    }

    public String getDicCodeMapping() {
        return dicCodeMapping;
    }

    public void setDicCodeMapping(String dicCodeMapping) {
        this.dicCodeMapping = dicCodeMapping;
    }
}
