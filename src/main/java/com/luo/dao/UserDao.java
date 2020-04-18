package com.luo.dao;

import com.luo.domain.RoleInfo;
import com.luo.domain.UserInfo;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDao {


    /**
     * 根据用户名查找用户信息
     * @param username
     * @return
     */
    @Select("select * from user where username=#{username}")
    UserInfo findUserByUsername(String username);

    @Select("select * from user where userid=#{userid}")
    UserInfo findByUserId(String userid) throws Exception;

    @Select("select * from user where username=#{username}")
    @Results({
            @Result(id = true, property = "userid", column = "userid"),
            @Result(property = "username", column = "username"),
            @Result(property = "email", column = "email"),
            @Result(property = "password", column = "password"),
            @Result(property = "phoneNum", column = "phoneNum"),
            @Result(property = "status", column = "status"),
            @Result(property = "roles",column = "userid",javaType = List.class,many = @Many(select = "com.luo.dao.RoleDao.findRoleByUserId"))
    })
    UserInfo findByUsername(String username) throws Exception;

    /**
     * 查找所有的用户
     * @return
     */
    @Select("select * from user")
    @Results({
            @Result(id = true, property = "userid", column = "userid"),
            @Result(property = "username", column = "username"),
            @Result(property = "email", column = "email"),
            @Result(property = "password", column = "password"),
            @Result(property = "phoneNum", column = "phoneNum"),
            @Result(property = "joinTime", column = "joinTime"),
            @Result(property = "status", column = "status"),
    })
    List<UserInfo> findAllUser();

    @Insert("INSERT INTO user(userid,username,password, email, phoneNum,status) VALUES (replace(uuid(), '-', ''),#{username},#{password},#{email},#{phoneNum},#{status})")
    void saveUser(UserInfo userInfo);

    @Select("select * from user where username=#{username}")
    UserInfo findUserByName(String username);

    @Select("select * from user where userid=#{userid}")
    UserInfo findUserById(String userid);

    @Update("update user set username=#{username},email=#{email},phoneNum=#{phoneNum},password=#{password},status=#{status} where userid=#{userid}")
    void updateUser(UserInfo userInfo);

    @Delete("delete from user where userid=#{userid}")
    void deleteUserById(String userid);

    @Select("select * from user where status=0")
    List<UserInfo> findDelUser();

    @Update("update user set status=0 where userid=#{userid}")
    void stopUserById(String userid);


    @Update("update user set status=1 where userid=#{userid}")
    void enableUserById(String userid);

    @Select("select * from role where roleid not in (select roleId  from user_role where userId=#{userid})")
    List<RoleInfo> findOtherRoles(String userid);

    @Insert("insert into user_role (userid,roleid) values(#{userId},#{roleId})")
    void addRoleToUser(@Param("userId") String userid,@Param("roleId") String roleid);

    @Select("select count(*) from user")
    String getUserCount();

    @Select("select count(*) from project")
    String getProjectCount();
    @Select("select count(*) from mycase")
    String getCaseCount();
}
