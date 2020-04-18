package com.luo.service;

import com.luo.domain.UserInfo;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface UserService extends UserDetailsService {
    //查找所有用户-》返回userInfo集合
    List<UserInfo> findAllUser();
    //根据用户名去查找用户 -》返回一个userInfo
    UserInfo findUserByName(String username);

    /**
     * 分页查询用户
     * @param page
     * @param size
     * @return
     */
    List<UserInfo> findAllUserPage(int page, int size);

    /**
     * 查询status=0的用户
     * @param page
     * @param size
     * @return
     */
    List<UserInfo> findUserDel(int page, int size);

    /**
     * 获取用户数量
     * @return
     */
    String getUserCount();

    /**
     * 获取项目数量
     * @return
     */
    String getProjectCount();

    /**
     * 获取用户数量
     * @return
     */
    String getCaseCount();
}
