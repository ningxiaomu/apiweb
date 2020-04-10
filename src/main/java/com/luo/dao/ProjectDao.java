package com.luo.dao;

import com.luo.domain.ProjectInfo;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProjectDao {
    /**
     * 查找所有的项目
     * @return
     */
    @Select("select * from project")
    List<ProjectInfo> findAllProject();

    /**
     * 查找所有项目的名字
     * @return
     */
    @Select("select projectName from project")
    List<String> findAllProjectName();

    /**
     * 添加项目 insert `case`.`project`(`projectid`,`projectName`,`domain`,`projectDesc`,`status`) values('1','2','3','4',1);
     * @param projectInfo
     */
    @Insert("insert into project (projectid,projectName,domain,projectDesc,status) values (replace(uuid(),'-',''),#{projectName},#{domain},#{projectDesc},#{status})")
    void saveProject(ProjectInfo projectInfo);

    /**
     * 更具项目名称查找项目
     * @param projectname
     * @return
     */
    @Select("select * from project where projectName=#{projectName}")
    ProjectInfo findProjectByName(String projectname);

}
