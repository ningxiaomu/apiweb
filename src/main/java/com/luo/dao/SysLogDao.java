package com.luo.dao;

import com.luo.domain.SysLog;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface SysLogDao {

    @Insert("insert sysLog(id,username,ip,url,method,visitTime) values(replace(uuid(),'-',''),#{username},#{ip},#{url},#{method},#{visitTime})")
    void save(SysLog log);

    @Select("select * from sysLog")
    List<SysLog> findAllLog();
}
