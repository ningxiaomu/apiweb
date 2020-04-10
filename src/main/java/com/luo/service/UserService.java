package com.luo.service;

import com.luo.domain.UserInfo;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface UserService extends UserDetailsService {
    //查找所有用户-》返回userInfo集合
    List<UserInfo> findAllUser();
    //根据用户名去查找用户 -》返回一个userInfo
    UserInfo findUserByName(String username);

}
