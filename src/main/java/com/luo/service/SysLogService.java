package com.luo.service;

import com.luo.domain.SysLog;

import java.util.List;

public interface SysLogService {
    void save(SysLog log);

    /**
     * 查找所有的操作
     * @return
     */
    List<SysLog> findAllLog(Integer page,Integer size);
}
