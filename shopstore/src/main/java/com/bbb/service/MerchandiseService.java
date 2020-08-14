package com.bbb.service;

import com.bbb.dao.BaseDao;
import com.bbb.dao.MerchandiseDao;
import com.bbb.entity.Merchandise;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MerchandiseService extends BaseService<Merchandise>
{
    @Autowired
    MerchandiseDao dao;
    public BaseDao<Merchandise> getDao() {
        return dao;
    }
}
