package cn.staryu.service.dev_user;

import cn.staryu.dao.dev_user.DevUserMapper;
import cn.staryu.pojo.DevUser;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author kongxiangzhong
 * 2017/12/19 10:39
 */
public class DevUserServiceImpl implements DevUserService {

    @Resource
    private DevUserMapper devUserMapper;


    @Override
    public int addUser(DevUser devUser) throws Exception {
        int result=-1;
        result=devUserMapper.addUser(devUser);

        return result;
    }

    @Override
    public int deleteUser(Integer id) throws Exception {
        int result = 0;
        result = devUserMapper.deleteUser(id);
        return result;
    }

    @Override
    public int updateUser(DevUser devUser) throws Exception {
        int result = 0;
        result = devUserMapper.updateUser(devUser);

        return result;
    }

    @Override
    public DevUser findUserByname(String devName) throws Exception {

        return devUserMapper.findUserByname(devName);
    }

    @Override
    public DevUser finduserLogin(String devName, String devPassword) throws Exception {
        return null;
    }



    @Override
    public List<DevUser> findAllDevUser(DevUser devUser) throws Exception {
        List<DevUser> devUserList = new ArrayList<>();
        devUserList= devUserMapper.findAllDevUser();
        if(devUserList.size()==0){

            devUserList=null;
        }
        return devUserList;
    }


}
