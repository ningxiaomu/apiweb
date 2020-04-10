package com.luo.dao;

import com.luo.domain.CaseInfo;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CaseDao {
    /**
     * 查找所有的用例
     * @return
     */
    @Select("select * from mycase")
    List<CaseInfo> findAllCase();

    /**
     * 保存用例
     * @param caseInfo
     */
    @Insert("insert mycase(caseid,caseName,project,domain,requestAddress,method,contentType,parameter,exResult,status) values(replace(uuid(),'-',''),#{caseName},#{project},#{domain},#{requestAddress},#{method},#{contentType},#{parameter},#{exResult},#{status})")
    void saveCase(CaseInfo caseInfo);

    /**
     * 根据用例id去查找用例
     * @param caseid
     * @return
     */
    @Select("select * from mycase where caseid=#{caseid}")
    CaseInfo findCaseByCaseid(String caseid);

    /**
     * 根据projectName来查询projectId
     * @param projectName
     * @return
     */
    @Select("select projectId from project where projectName=#{projectName}")
    String findProjectIdByName(String projectName);

    /**
     * 根据projectID查询指定的用例
     * @param projectId
     * @return
     */
    @Select("select * from mycase where caseid in (select caseid from project_mycase where projectid=#{projectid})")
    List<CaseInfo> findAppointCase(String projectId);


    /**
     * 根据用例name查找指定的用例
     * @param caseName
     * @return
     */
    @Select("select * from mycase where caseName=#{caseName}")
    CaseInfo findCaseByCaseName(String caseName);

    /**
     * 查询指定用例的项目
     * @param projectName
     * @return
     */
    @Select("select * from mycase where project=#{projectName}")
    List<CaseInfo> findAllSelectCase(String projectName);
}
