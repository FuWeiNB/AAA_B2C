package com.bbb.service.zyh;

import com.bbb.dao.zyh.RoleDao;
import com.bbb.entity.zyh.Role;
import com.bbb.util.BaseDao;
import com.bbb.util.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoleService extends BaseService<Role> {
    @Autowired
    RoleDao dao;
    @Override
    public BaseDao<Role> getDao() {
        return dao;
    }

}
