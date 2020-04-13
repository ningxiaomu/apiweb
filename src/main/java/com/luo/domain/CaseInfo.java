package com.luo.domain;

public class CaseInfo {

    private String caseid;
    private String caseName;
    private String project;
    private String domain;
    private String requestAddress;
    private String method;
    private String contentType;
    private String parameter;
    private String exResult;
    private Integer status;
    private String statusStr;

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

    public String getCaseid() {
        return caseid;
    }

    public void setCaseid(String caseid) {
        this.caseid = caseid;
    }

    public String getCaseName() {
        return caseName;
    }

    public void setCaseName(String caseName) {
        this.caseName = caseName;
    }

    public String getProject() {
        return project;
    }

    public void setProject(String project) {
        this.project = project;
    }

    public String getDomain() {
        return domain;
    }

    public void setDomain(String domain) {
        this.domain = domain;
    }

    public String getRequestAddress() {
        return requestAddress;
    }

    public void setRequestAddress(String requestAddress) {
        this.requestAddress = requestAddress;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getContentType() {
        return contentType;
    }

    public void setContentType(String contentType) {
        this.contentType = contentType;
    }

    public String getParameter() {
        return parameter;
    }

    public void setParameter(String parameter) {
        this.parameter = parameter;
    }

    public String getExResult() {
        return exResult;
    }

    public void setExResult(String exResult) {
        this.exResult = exResult;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "CaseInfo{" +
                "caseid='" + caseid + '\'' +
                ", caseName='" + caseName + '\'' +
                ", project='" + project + '\'' +
                ", domain='" + domain + '\'' +
                ", requestAddress='" + requestAddress + '\'' +
                ", method='" + method + '\'' +
                ", contentType='" + contentType + '\'' +
                ", parameter='" + parameter + '\'' +
                ", exResult='" + exResult + '\'' +
                ", status=" + status +
                '}';
    }
}
