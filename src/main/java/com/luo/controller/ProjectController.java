package com.luo.controller;

import com.luo.domain.ProjectInfo;
import com.luo.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/project")
public class ProjectController {
    @Autowired
    private ProjectService projectService;

    /**
     * 查找所有项目list
     * @return
     */
    @RequestMapping("/findAllProject")
    @ResponseBody
    public ModelAndView findAllProject(){
        List<ProjectInfo> list = new ArrayList<>();
        list = projectService.findAllProject();
        Map<String,List<ProjectInfo>> map = new HashMap<>();
        map.put("result",list);
        System.out.println("项目的List:"+list);
        return new ModelAndView(new MappingJackson2JsonView(),map);
    }

    /**
     * 获取所有项目的名称
     * @return
     */
    @RequestMapping("/getProjectList")
    @ResponseBody
    public List<String> getAllProjectName(){
        List<String> list = projectService.findAllProjectName();
        return list;
    }

    @RequestMapping("/saveProject")
    @ResponseBody
    public ModelAndView saveProject(@RequestBody ProjectInfo projectInfo){
        String projectname=projectInfo.getProjectName();
        projectService.saveProject(projectInfo);
        boolean flag=true;

        ProjectInfo project = projectService.findProjectByName(projectname);
        if(project==null){
            flag = false;
        }else {
            flag = true;
        }
        Map<String,Boolean> map = new HashMap<>();
        map.put("result",flag);
        return new ModelAndView(new MappingJackson2JsonView(),map);
    }
}
