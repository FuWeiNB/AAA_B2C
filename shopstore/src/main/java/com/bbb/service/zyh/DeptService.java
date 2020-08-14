package com.bbb.service.zyh;

import com.bbb.dao.zyh.DeptDaoc;
import com.bbb.entity.zyh.Dept;
import com.bbb.util.BaseDao;
import com.bbb.util.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DeptService extends BaseService<Dept> {
    @Autowired
    DeptDaoc dao;

    @Override
    public BaseDao<Dept> getDao() {
        return dao;
    }
}
