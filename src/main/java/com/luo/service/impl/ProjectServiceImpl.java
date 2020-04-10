package com.luo.service.impl;

import com.luo.dao.ProjectDao;
import com.luo.domain.ProjectInfo;
import com.luo.service.ProjectService;
import org.omg.CORBA.PRIVATE_MEMBER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("projectService")
@Transactional
public class ProjectServiceImpl implements ProjectService {
    @Autowired
    private ProjectDao projectDao;
    @Override
    public List<ProjectInfo> findAllProject() {
        return projectDao.findAllProject();
    }

    @Override
    public List<String> findAllProjectName() {
        return projectDao.findAllProjectName();
    }

    @Override
    public void saveProject(ProjectInfo projectInfo) {
        projectDao.saveProject(projectInfo);
    }

    @Override
    public ProjectInfo findProjectByName(String projectname) {
        return projectDao.findProjectByName(projectname);
    }
}
