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
}
