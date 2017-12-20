package cn.staryu.dao.dev_user;

import cn.staryu.pojo.DevUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author kongxiangzhong
 * 2017/12/19 10:29
 */
public interface DevUserMapper {


    //添加新用户
    int addUser(DevUser devUser) throws Exception;
    //删除用户
    int deleteUser(@Param("id")Integer id) throws Exception;
    //更新用户信息
    int updateUser(DevUser devUser)throws Exception;
    //根据用户id获取用户信息
    DevUser findUserById(@Param("id")Integer id)throws Exception;
    //根据用户名称查找用户是否存在
    DevUser findUserByname(String devName) throws Exception;
    //通过userCode获取User
    DevUser findLoginUser(@Param("devName")String userCode,@Param("devPassword")String devPassword)throws Exception;

    List<DevUser> findAllDevUser()throws Exception;


}
