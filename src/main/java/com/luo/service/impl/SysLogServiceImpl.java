package com.luo.service.impl;

import com.github.pagehelper.PageHelper;
import com.luo.dao.SysLogDao;
import com.luo.domain.SysLog;
import com.luo.service.SysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("sysLogService")
@Transactional(readOnly = false)
public class SysLogServiceImpl implements SysLogService {
    @Autowired
    private SysLogDao sysLogDao;
    @Override
    public void save(SysLog log) {
        sysLogDao.save(log);
    }

    @Override
    public List<SysLog> findAllLog(Integer page,Integer size) {
        PageHelper.startPage(page,size);
        return sysLogDao.findAllLog();
    }
}
