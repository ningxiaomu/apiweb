package com.luo.dao;

import com.luo.domain.PermissionInfo;
import com.luo.domain.RoleInfo;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoleDao {
    @Select("select * from role where roleid in (select roleid from user_role where userid=#{userid})")
    @Results(value = {
            @Result(id=true,column = "roleid",property = "roleid"),
            @Result(column = "roleName",property = "roleName"),
            @Result(column = "roleDesc",property = "roleDesc"),
            @Result(property = "users",column = "roleid",many = @Many(select = "com.luo.dao.UserDao.findByUserId",fetchType = FetchType.EAGER))
    }
    )
    List<RoleInfo> findUserRole(String userid);

    //根据用户id查询出所有对应的角色
    @Select("select * from role where roleid in (select roleid from user_role where userid=#{userid})")
    List<RoleInfo> findRoleByUserId(String userid) throws Exception;

    @Select("select * from role where roleName = #{roleName}")
    RoleInfo findRoleByName(String roleName);

    /**
     * 查询所有的角色
     * @return
     */
    @Select("select * from role")
    List<RoleInfo> findAllRole();

    @Insert("insert into role (roleid,roleName,roleDesc) values (replace(uuid(), '-', ''),#{roleName},#{roleDesc})")
    void saveRole(RoleInfo roleInfo);

    @Select("select * from role where roleid=#{roleid}")
    RoleInfo findById(String roleid);

    @Select("select * from lb_permission where id not in (select permissionid from role_permission where roleid=#{roleid})")
    List<PermissionInfo> findOtherPermission(String roleid);

    @Insert("insert into role_permission (roleid,permissionid) values (#{roleid},#{permissionid})")
    void addPermissionToUser(@Param("roleid") String roleid,@Param("permissionid") String permissionid);

}
