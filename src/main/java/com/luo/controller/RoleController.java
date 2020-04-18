package com.luo.controller;

import com.luo.domain.RoleInfo;
import com.luo.service.RoleService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/role")
public class RoleController {
    @Autowired
    private RoleService roleService;

    @RequestMapping("/findAllRole")
    @ResponseBody
    public ModelAndView findAllRole(){
        List<RoleInfo> list = new ArrayList<>();
        try{
            list = roleService.findAllRole();
        }
        catch (Exception e){
            e.printStackTrace();
        }
        Map<String,List<RoleInfo>> map = new HashMap<>();
        map.put("result",list);
        return new ModelAndView(new MappingJackson2JsonView(),map);
    }
}
