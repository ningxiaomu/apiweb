package com.luo.controller;

import com.github.pagehelper.PageInfo;
import com.luo.domain.CaseInfo;
import com.luo.service.CaseService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.junit.runners.Parameterized;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/case")
public class CaseController {
    @Autowired
    private CaseService caseService;

    /**
     * 查找所有的用例
     * @return
     */
    @RequestMapping("/findAllCase")
    @ResponseBody
    public ModelAndView findAllCase(){
        List<CaseInfo> list = new ArrayList<>();
        list = caseService.findAllCase();
        Map<String,List<CaseInfo>> map = new HashMap<>();
        map.put("result",list);
        System.out.println("list:"+list);
        return new ModelAndView(new MappingJackson2JsonView(),map);
    }

    /**
     * 保存用例
     * @param caseInfo
     * @return
     */
    @RequestMapping("/saveCase")
    @ResponseBody
    public ModelAndView saveCase(@RequestBody CaseInfo caseInfo){
        //根据caseid去查询是否插入用例成功
        String caseName = caseInfo.getCaseName();
        caseService.saveCase(caseInfo);
//        CaseInfo caseInfo1 = caseService.findCaseByCaseName(caseName);
        boolean flag = true;
//        if(caseInfo1==null){
//            flag = false;
//        }else{
//            flag= true;
//        }
        Map<String,Boolean> map = new HashMap<>();
        map.put("result",flag);
        return new ModelAndView(new MappingJackson2JsonView(),map);
    }

    @RequestMapping("/findAllSelectCase")
    @ResponseBody
    public ModelAndView findAllSelectCase(String projectName,@RequestParam(name = "page",required = true,defaultValue = "1") Integer page,@RequestParam(name="size",required = true,defaultValue = "10") Integer size){
        List<CaseInfo> list = new ArrayList<>();
        list = caseService.findAllSelectCasePage(projectName,page, size);
        PageInfo pageInfo = new PageInfo(list);
        Map<String,Object> caseInfoMap = new HashMap<>();
        Map<String,Object> pageInfoMap = new HashMap<>();
        caseInfoMap.put("result",list);
        pageInfoMap.put("obj",pageInfo);
        caseInfoMap.putAll(pageInfoMap);
        return new ModelAndView(new MappingJackson2JsonView(),caseInfoMap);
    }

    @RequestMapping("/findAllSelectCaseAfterEdit")
    @ResponseBody
    public ModelAndView findAllSelectCaseAfterEdit(String projectName,@RequestParam(name = "page",required = true,defaultValue = "1") Integer page,@RequestParam(name="size",required = true,defaultValue = "10") Integer size){
        ModelAndView modelAndView = new ModelAndView();
        List<CaseInfo> list = new ArrayList<>();
        list = caseService.findAllSelectCasePage(projectName,page, size);
        System.out.println("编辑过后的list:"+list);
        PageInfo pageInfo = new PageInfo(list);
        System.out.println("pageInfo:"+pageInfo);
        modelAndView.addObject("pageInfo",pageInfo);
        modelAndView.addObject("caselist",list);

        modelAndView.setViewName("case-list-edit");
        return modelAndView;

    }

    @RequestMapping("/findAllSelectCaseAfterAdd")
    public ModelAndView findAllSelectCaseAfterAdd(String projectName,@RequestParam(name = "page",required = true,defaultValue = "1") Integer page,@RequestParam(name="size",required = true,defaultValue = "10") Integer size){
        ModelAndView modelAndView = new ModelAndView();
        List<CaseInfo> list = new ArrayList<>();
        list = caseService.findAllSelectCasePage(projectName,page, size);
        PageInfo pageInfo = new PageInfo(list);
        System.out.println("pageInfo:"+pageInfo);
        modelAndView.addObject("pageInfo",pageInfo);
        modelAndView.addObject("caselist",list);
        modelAndView.setViewName("case-list-add");
        return modelAndView;
    }

    @RequestMapping("/findAllCasePage")
    @ResponseBody
//    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public ModelAndView findAllCasePage(@RequestParam(name="page",required = true,defaultValue = "1") Integer page, @RequestParam(name="size",required = true,defaultValue = "10") Integer size){
        List<CaseInfo> list = new ArrayList<>();
        list = caseService.findAllCasePage(page, size);
        PageInfo pageInfo = new PageInfo(list);
        Map<String,Object> mp = new HashMap<>();
        mp.put("obj",pageInfo);
        System.out.println("pageInfo:"+mp);
        Map<String,Object> map = new HashMap<>();
        map.put("result",list);
        System.out.println("list:"+list);
        map.putAll(mp);
        System.out.println("最后的map"+map);
        return new ModelAndView(new MappingJackson2JsonView(),map);
    }

    /**
     * 删除用例
     * @param caseid
     * @return
     */
    @RequestMapping("/delSelectCase")
    @ResponseBody
    public ModelAndView delSelectCase(@RequestParam(value = "caseid",required = true) String caseid){
        System.out.println("传过来的caseid:"+caseid);
        boolean result=caseService.delSelectCase(caseid);
        System.out.println("CaseController里的result:"+result);
        Map<String,Boolean> map = new HashMap<>();
        map.put("result",result);
        return new ModelAndView(new MappingJackson2JsonView(),map);
    }

    /**
     * 根据caseid去查找case,不是返回json
     *  @param caseid
     * @return
     */
    @RequestMapping("/findCaseById")
    public ModelAndView findCaseById(@RequestParam(value ="caseid" ,required = true) String caseid){
        ModelAndView modelAndView = new ModelAndView();
        CaseInfo caseInfo = caseService.findCaseByCaseid(caseid);
        modelAndView.addObject("caseInfo",caseInfo);
        modelAndView.setViewName("case-edit");
        System.out.println("caseInfo:"+caseInfo);
        return modelAndView;
    }

    @RequestMapping("findCaseByIdReturnJson")
    public ModelAndView findCaseByIdReturnJson(@RequestParam(value ="caseid" ,required = true) String caseid){
        List<CaseInfo> list = new ArrayList<>();
        list=caseService.findCaseByIdReturnJson(caseid);
        Map<String,List<CaseInfo>> map = new HashMap<>();
        map.put("result",list);
        return new ModelAndView(new MappingJackson2JsonView(),map);
    }

    /**
     * 更新用例
     * @param caseInfo
     * @return
     */
    @RequestMapping("/editCase")
    @ResponseBody
    public ModelAndView editCaseById(@RequestBody CaseInfo caseInfo){
        System.out.println("controller里的caseinfo:"+caseInfo);
        boolean result = caseService.editCase(caseInfo);
        Map<String,Boolean> map = new HashMap<>();
        map.put("result",result);
        return new ModelAndView(new MappingJackson2JsonView(),map);

    }

    @RequestMapping("/getProjectById")
    public String getProjectById(String caseid){
        String project = caseService.findProjectById(caseid);
        return project;
    }
}
