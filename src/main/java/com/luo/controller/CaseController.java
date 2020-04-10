package com.luo.controller;

import com.github.pagehelper.PageInfo;
import com.luo.domain.CaseInfo;
import com.luo.service.CaseService;
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
        CaseInfo caseInfo1 = caseService.findCaseByCaseName(caseName);
        boolean flag = true;
        if(caseInfo1==null){
            flag = false;
        }else{
            flag= true;
        }
        Map<String,Boolean> map = new HashMap<>();
        map.put("result",flag);
        return new ModelAndView(new MappingJackson2JsonView(),map);
    }

    @RequestMapping("/findAllSelectCase")
    @ResponseBody
    public ModelAndView findAllSelectCase(String projectName,@RequestParam(name = "page",required = true,defaultValue = "1") int page,@RequestParam(name="size",required = true,defaultValue = "10") int size){
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

    @RequestMapping("/findAllCasePage")
    @ResponseBody
//    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public ModelAndView findAllCasePage(@RequestParam(name="page",required = true,defaultValue = "1") int page, @RequestParam(name="size",required = true,defaultValue = "10") int size){
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

}
