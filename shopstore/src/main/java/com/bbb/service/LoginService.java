package com.bbb.service;

import com.bbb.dao.BaseDao;
import com.bbb.dao.LoginDao;
import com.bbb.entity.Login;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class LoginService extends BaseService<Login>
{

    @Autowired
    LoginDao dao;

    public BaseDao<Login> getDao() {
        return dao;
    }
    public List<Map<String,Object>> find(Object...obj)
    {
        return dao.find(obj);
    }
}
