package com.luo.service.impl;

import com.luo.dao.RoleDao;
import com.luo.domain.RoleInfo;
import com.luo.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("roleService")
@Transactional
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleDao roleDao;
    @Override
    public List<RoleInfo> findAllRole() {
        return roleDao.findAllRole();
    }
}
