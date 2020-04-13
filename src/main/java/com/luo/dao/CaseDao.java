package com.luo.dao;

import com.luo.domain.CaseInfo;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
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

    /**
     * 根据用例id去删除用例
     * @param caseid
     */
    @Delete("delete from mycase where caseid=#{caseid}")
    void delSelectCase(String caseid);

    /**
     * 更新用例
     * @param caseInfo
     */
    @Update("update  mycase set caseName=#{caseName},project=#{project},domain=#{domain},requestAddress=#{requestAddress},method=#{method},contentType=#{contentType},parameter=#{parameter},exResult=#{exResult},status=#{status} where caseid=#{caseid}")
    void editCase(CaseInfo caseInfo);

    /**
     *
     * @param caseid
     * @return
     */
    @Select("select project from mycase where caseid=#{caseid}")
    String findProjectById(String caseid);
}
