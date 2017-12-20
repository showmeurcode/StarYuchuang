package cn.staryu.dao.admin_user;

import cn.staryu.pojo.AdminUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author kongxiangzhong
 * 2017/12/19 15:35
 */
public interface AdminUserMapper {

    //添加新用户
    int addUser(AdminUser adminUser) throws Exception;
    //删除用户
    int deleteUser(@Param("id")Integer id) throws Exception;
    //更新用户信息
    int updateUser(AdminUser adminUser);
    //根据用户id获取用户信息
    AdminUser findUserById(@Param("id")Integer id)throws Exception;
    //根据用户名称查找用户是否存在
    AdminUser findUserByname(String adminName) throws Exception;

    //通过userCode获取User
    AdminUser findLoginUser(@Param("adminName")String adminName,@Param("adminPassword")String adminPassword)throws Exception;

    List<AdminUser> findAllAdminUser()throws Exception;


}
