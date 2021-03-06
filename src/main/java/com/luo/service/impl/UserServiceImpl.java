package com.luo.service.impl;

import com.github.pagehelper.PageHelper;
import com.luo.dao.UserDao;
import com.luo.domain.RoleInfo;
import com.luo.domain.UserInfo;
import com.luo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service("user")
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        UserInfo userInfo = null;
        try{
            userInfo = userDao.findByUsername(s);
            System.out.println(userInfo);
        }catch (Exception e){
            e.printStackTrace();
        }
        User user = null;
        try{
            user = new User(userInfo.getUsername(),"{noop}"+userInfo.getPassword(),userInfo.getStatus()==0?false:true,true,true,true,getAuthority(userInfo.getRoles()));
        }catch (Exception e){
            e.printStackTrace();
        }
        return user;
    }

    public List<SimpleGrantedAuthority> getAuthority(List<RoleInfo> roles) throws Exception {
        List<SimpleGrantedAuthority> list = new ArrayList<>();
        for (RoleInfo role:roles){
            list.add(new SimpleGrantedAuthority("ROLE_"+role.getRoleName()));
        //list.add(new SimpleGrantedAuthority("ROLE_USER"));
        }
        System.out.println("用户角色list："+list);
        return list;
    }
    @Override
    public List<UserInfo> findAllUser() {
        return userDao.findAllUser();
    }

    @Override
    public UserInfo findUserByName(String username) {
        return null;
    }

    @Override
    public List<UserInfo> findAllUserPage(int page, int size) {
        PageHelper.startPage(page,size);
        return userDao.findAllUser();
    }

    @Override
    public List<UserInfo> findUserDel(int page, int size) {
        PageHelper.startPage(page, size);
        return userDao.findDelUser();
    }

    @Override
    public String getUserCount() {
        return userDao.getUserCount();
    }

    @Override
    public String getProjectCount() {
        return userDao.getProjectCount();
    }

    @Override
    public String getCaseCount() {
        return userDao.getCaseCount();
    }
}
