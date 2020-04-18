package com.luo.service;

import com.luo.domain.RoleInfo;

import java.util.List;

public interface RoleService {
    /**
     * 查询所有角色
     * @return
     */
    List<RoleInfo> findAllRole();
}
