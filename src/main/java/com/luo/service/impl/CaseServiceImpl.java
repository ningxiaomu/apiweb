package com.luo.service.impl;


import com.github.pagehelper.PageHelper;
import com.luo.dao.CaseDao;
import com.luo.domain.CaseInfo;
import com.luo.service.CaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
@Service("caseService")
@Transactional
public class CaseServiceImpl implements CaseService {
    @Autowired
    private CaseDao caseDao;
    @Override
    public List<CaseInfo> findAllCase() {
        return caseDao.findAllCase();
    }

    @Override
    public void saveCase(CaseInfo caseInfo) {
        caseDao.saveCase(caseInfo);
    }

    @Override
    public CaseInfo findCaseByCaseid(String caseid) {
        return caseDao.findCaseByCaseid(caseid);
    }

    @Override
    public String findProjectIdByName(String projectName) {
        return caseDao.findProjectIdByName(projectName);
    }

    @Override
    public List<CaseInfo> findAppointCase(String projectId) {
        return caseDao.findAppointCase(projectId);
    }

    @Override
    public CaseInfo findCaseByCaseName(String caseName) {
        return caseDao.findCaseByCaseName(caseName);
    }

    @Override
    public List<CaseInfo> findAllCasePage(int page, int size) {
        PageHelper.startPage(page,size);
        return caseDao.findAllCase();
    }

    @Override
    public List<CaseInfo> findAllSelectCasePage(String projectName, int page, int size) {
        List<CaseInfo> list = new ArrayList<>();
        if(projectName.equals("请选择项目")){
            PageHelper.startPage(page,size);
            list = caseDao.findAllCase();
        }
        else {
            PageHelper.startPage(page,size);
            list = caseDao.findAllSelectCase(projectName);
        }
        return list;

    }

    @Override
    public boolean delSelectCase(String caseid) {
        boolean flag;
        caseDao.delSelectCase(caseid);
        CaseInfo caseInfo=caseDao.findCaseByCaseid(caseid);
        System.out.println("CaseService里的caseinfo:"+caseInfo);
        if(caseInfo==null){
            //删除成功
            flag = true;
        }else {
            flag = false;
        }

        return flag;
    }

    @Override
    public CaseInfo findCaseById(String caseid) {
        return null;
    }

    @Override
    public boolean editCase(CaseInfo caseInfo) {
        boolean flag;
        String caseid=caseInfo.getCaseid();
        System.out.println("caseInfoBefore"+caseInfo);
        caseDao.editCase(caseInfo);
        CaseInfo caseInfoAfter = null;
        try{
            caseInfoAfter = caseDao.findCaseByCaseid(caseid);
        }catch (Exception e){
            e.printStackTrace();
        }
        System.out.println("caseInfoAfter:"+caseInfoAfter);
        if(caseInfo.getCaseName().equals(caseInfoAfter.getCaseName())&caseInfo.getProject().equals(caseInfoAfter.getProject())&caseInfo.getDomain().equals(caseInfoAfter.getDomain())&caseInfo.getContentType().equals(caseInfoAfter.getContentType())&caseInfo.getRequestAddress().equals(caseInfoAfter.getRequestAddress())&caseInfo.getMethod().equals(caseInfoAfter.getMethod())&caseInfo.getParameter().equals(caseInfoAfter.getParameter())&caseInfo.getStatus().equals(caseInfoAfter.getStatus())&caseInfo.getExResult().equals(caseInfoAfter.getExResult())){
            flag = true;
        }else{
            flag = false;
        }
        return flag;
    }

    @Override
    public String findProjectById(String caseid) {
        return caseDao.findProjectById(caseid);
    }


}
