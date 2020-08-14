package com.bbb.service;

import com.bbb.dao.BaseDao;
import com.bbb.dao.PowerDao;
import com.bbb.entity.Power;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class Powerservice extends BaseService<Power> {

    @Autowired
    PowerDao dao;

    public BaseDao<Power> getDao()
    {
        return dao;
    }
    public List<Map<String,Object>> find(Object...obj)
    {
        return dao.find(obj);
    }
}
