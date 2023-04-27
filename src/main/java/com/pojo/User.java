package com.pojo;

import java.util.Date;

public class User {
    private String id;
    private String username;
    private String password;
    private String status;
    private String cpName;
    private String cpPhone;
    private String companyName;
    private String companyAddr;
    private String userVer;
    private Date createdate;
    private String onlineLimit;
    private String allowMobile;
    private Date loginDate;

    public Date getLoginDate() {
        return loginDate;
    }

    public void setLoginDate(Date loginDate) {
        this.loginDate = loginDate;
    }

    public String getOnlineLimit() {
        return onlineLimit;
    }

    public void setOnlineLimit(String onlineLimit) {
        this.onlineLimit = onlineLimit;
    }

    public String getAllowMobile() {
        return allowMobile;
    }

    public void setAllowMobile(String allowMobile) {
        this.allowMobile = allowMobile;
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() { return username; }

    public void setUsername(String username) { this.username = username; }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCpName() {
        return cpName;
    }

    public void setCpName(String cpName) {
        this.cpName = cpName;
    }

    public String getCpPhone() {
        return cpPhone;
    }

    public void setCpPhone(String cpPhone) {
        this.cpPhone = cpPhone;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getCompanyAddr() {
        return companyAddr;
    }

    public void setCompanyAddr(String companyAddr) {
        this.companyAddr = companyAddr;
    }

    public String getUserVer() {
        return userVer;
    }

    public void setUserVer(String userVer) {
        this.userVer = userVer;
    }
}
