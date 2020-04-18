package com.luo.controller;

import com.github.pagehelper.PageInfo;
import com.luo.domain.SysLog;
import com.luo.domain.UserInfo;
import com.luo.service.SysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
@RequestMapping("/sysLog")
public class SysLogController {

    @Autowired
    private SysLogService sysLogService;

    @RequestMapping("/findAllLog")
    @ResponseBody
    public ModelAndView findAllLog(@RequestParam(name="page",required = true,defaultValue = "1")Integer page,@RequestParam(name="size",required = true,defaultValue = "100") Integer size){
        List<SysLog> list = new ArrayList<>();
        list = sysLogService.findAllLog(page, size);
        PageInfo pageInfo = new PageInfo(list);
        Map<String,Object> mp = new HashMap<>();
        mp.put("obj",pageInfo);
        Map<String,Object> map = new HashMap<>();
        map.put("result",list);
        map.putAll(mp);
        return new ModelAndView(new MappingJackson2JsonView(),map);
    }

}
