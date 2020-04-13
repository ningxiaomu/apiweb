package com.luo.controller;

import com.github.pagehelper.PageInfo;
import com.luo.domain.CaseInfo;
import com.luo.domain.UserInfo;
import com.luo.service.UserService;
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
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    /**
     * 查找所有用户
     * @return
     */
    @RequestMapping("/findAllUserPage")
    @ResponseBody
    public ModelAndView findAllUser(@RequestParam(name="page",required = true,defaultValue = "1") int page,@RequestParam(name="size",required = true,defaultValue = "10") int size){
        List<UserInfo> list = new ArrayList<>();
        list = userService.findAllUserPage(page, size);
        PageInfo pageInfo = new PageInfo(list);
        Map<String,Object> mp = new HashMap<>();
        mp.put("obj",pageInfo);
        Map<String,Object> map = new HashMap<>();
        map.put("result",list);
        map.putAll(mp);
        return new ModelAndView(new MappingJackson2JsonView(),map);
    }


}
