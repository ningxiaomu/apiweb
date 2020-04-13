package com.luo.domain;

import java.util.Date;
import java.util.List;

//用户信息
public class UserInfo {
    private String userid;
    private String username;
    private String password;
    private String email;
    private String phoneNum;
    private Date joinTime;
    private Integer status;
    private String statusStr;
    private List<RoleInfo> UserRoleInfos;
    private List<RoleInfo> roles;

    public Date getJoinTime() {
        return joinTime;
    }

    public void setJoinTime(Date joinTime) {
        this.joinTime = joinTime;
    }

    public List<RoleInfo> getRoles() {
        return roles;
    }

    public void setRoles(List<RoleInfo> roles) {
        this.roles = roles;
    }

    public List<RoleInfo> getUserRoleInfos() {
        return UserRoleInfos;
    }

    public void setUserRoleInfos(List<RoleInfo> userRoleInfos) {
        UserRoleInfos = userRoleInfos;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getStatusStr() {
        if(status==0){
            statusStr="停用";
        }else if(status==1){
            statusStr="启用";
        }else {
            statusStr="错误";
        }
        return statusStr;
    }

    public void setStatusStr(String statusStr) {
        this.statusStr = statusStr;
    }

    @Override
    public String toString() {
        return "UserInfo{" +
                "userid='" + userid + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", phoneNum='" + phoneNum + '\'' +
                ", joinTime=" + joinTime +
                ", status=" + status +
                ", statusStr='" + statusStr + '\'' +
                ", UserRoleInfos=" + UserRoleInfos +
                ", roles=" + roles +
                '}';
    }
}
