package com.luo.service;

import com.luo.domain.ProjectInfo;

import java.util.List;

public interface ProjectService {
    /**
     * 查找所有的project
     * @return
     */
    List<ProjectInfo> findAllProject();

    /**
     * 查找所有的项目名称
     * @return
     */
    List<String> findAllProjectName();

    /**
     * 保存项目
     * @param projectInfo
     */
    void saveProject(ProjectInfo projectInfo);

    /**
     * 根据项目名称去查找项目
     * @param projectname
     * @return
     */
    ProjectInfo findProjectByName(String projectname);
}
