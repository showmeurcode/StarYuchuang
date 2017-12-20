package cn.staryu.service.dev_user;

import cn.staryu.pojo.DevUser;

import java.util.List;

/**
 * @author kongxiangzhong
 * 2017/12/19 10:38
 */
public interface DevUserService {

    //添加新用户
    int addUser(DevUser devUser) throws Exception;
    //删除用户
    int deleteUser(Integer id) throws Exception;
    //更新用户信息
    int  updateUser(DevUser devUser)throws Exception;
    //根据用户id获取用户信息
    DevUser findUserById(Integer id)throws Exception;
    //根据用户名称查找用户是否存在
    DevUser findUserByname(String devName) throws Exception;
    //根据用户名称和密码确认用户登录
    DevUser finduserLogin(String devName, String devPassword) throws Exception;
    //获取所有用户信息
    List<DevUser> findAllDevUser(DevUser devUser)throws Exception;



}
