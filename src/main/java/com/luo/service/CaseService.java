package com.luo.service;

import com.luo.domain.CaseInfo;

import java.util.List;

public interface CaseService {
    /**
     * 查找所有的用例
     * @return
     */
    List<CaseInfo> findAllCase();

    /**
     * 保存用例
     * @param caseInfo
     */
    void saveCase(CaseInfo caseInfo);

    /**
     * 根据caseid去查找case
     * @param caseid
     * @return
     */
    CaseInfo findCaseByCaseid(String caseid);

    /**
     * 根据projectId来查询projectName
     * @param projectName
     * @return
     */
    String findProjectIdByName(String projectName);

    /**
     * 查找指定的用例
     * @param projectId
     * @return
     */
    List<CaseInfo> findAppointCase(String projectId);

    /**
     * 根据用例name查找用例
     * @param caseName
     * @return
     */
    CaseInfo findCaseByCaseName(String caseName);

    /**
     * 分页查询用例
     * @param page
     * @param size
     * @return
     */
    List<CaseInfo> findAllCasePage(int page,int size);

    /**
     * 分页查询指定项目的用例
     * @param page
     * @parm projectName
     * @param size
     * @return
     */
    List<CaseInfo> findAllSelectCasePage(String projectName,int page, int size);


    /**
     * 根据用例id删除用例
     * @param caseid
     * @return
     */
    boolean delSelectCase(String caseid);

    /**
     * 根据用例id查找用例
     * @param caseid
     * @return
     */
    CaseInfo findCaseById(String caseid);

    /**
     * 更新用例
     * @param caseInfo
     * @return
     */
    boolean editCase(CaseInfo caseInfo);

    /**
     * 根据id获取project名字
     * @param caseid
     * @return
     */
    String findProjectById(String caseid);

    /**
     * 根据id查找用例，返回list
     * @param caseid
     * @return
     */
    List<CaseInfo> findCaseByIdReturnJson(String caseid);
}
