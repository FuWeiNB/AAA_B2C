package com.bbb.service.zyh;

import com.bbb.dao.zyh.EmpDao;
import com.bbb.entity.zyh.Emp;
import com.bbb.util.BaseDao;
import com.bbb.util.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmpService extends BaseService<Emp> {
    @Autowired
    EmpDao dao;

    @Override
    public BaseDao<Emp> getDao() {
        return dao;
    }
}
