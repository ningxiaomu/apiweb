package com.luo.service.impl;

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
        return null;
    }

    @Override
    public UserInfo findUserByName(String username) {
        return null;
    }
}
