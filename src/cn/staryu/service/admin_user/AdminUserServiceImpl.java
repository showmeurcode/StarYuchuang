package cn.staryu.service.admin_user;

import cn.staryu.dao.admin_user.AdminUserMapper;
import cn.staryu.pojo.AdminUser;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author kongxiangzhong
 * 2017/12/19 15:43
 */
@Service("adminUserService")
public class  AdminUserServiceImpl implements AdminUserService {

    @Resource
    private AdminUserMapper adminUserMapper;



    @Override
    public int addUser(AdminUser adminUser) throws Exception {
        int result = -1;
        result=adminUserMapper.addUser(adminUser);
        return result;
    }

    @Override
    public int deleteUser(Integer id) throws Exception {
        int result = 0;
        result = adminUserMapper.deleteUser(id);
        return result;
    }

    @Override
    public int updateUser(AdminUser adminUser) throws Exception {
        int result = 0;
        result = adminUserMapper.updateUser(adminUser);

        return  result;
    }

    @Override
    public AdminUser findUserByname(String adminName) throws Exception {
        return adminUserMapper.findUserByname(adminName);
    }

    @Override
    public AdminUser finduserLogin(String adminName, String adminPassword) throws Exception {
        return adminUserMapper.findLoginUser(adminName,adminPassword);
    }

    @Override
    public List<AdminUser> findAllBackendUser(AdminUser adminUser) throws Exception {

        List<AdminUser> adminUsersList = new ArrayList<>();

        adminUsersList = adminUserMapper.findAllAdminUser();
        if(adminUsersList.size()==0){

            adminUsersList=null;
        }
        return adminUsersList;
    }
}
