package cn.staryu.service.admin_user;


import cn.staryu.pojo.AdminUser;

import java.util.List;

/**
 * @author kongxiangzhong
 * 2017/12/19 15:42
 */
public interface AdminUserService {

    //添加新用户
    int addUser(AdminUser adminUser) throws Exception;
    //删除用户
    int deleteUser(Integer id) throws Exception;
    //更新用户信息
    int updateUser(AdminUser adminUser)throws Exception;
    //根据用户id获取用户信息
    AdminUser findUserById(Integer id)throws Exception;
    //根据用户名称查找用户是否存在
    AdminUser findUserByname(String adminName) throws Exception;
    //根据用户名称和密码确认用户登录
    AdminUser finduserLogin(String adminName,String adminPassword) throws Exception;
    //获取所有用户信息
    List<AdminUser> findAllBackendUser(AdminUser adminUser)throws Exception;



}
