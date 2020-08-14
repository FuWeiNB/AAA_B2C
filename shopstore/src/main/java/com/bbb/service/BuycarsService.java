package com.bbb.service;

import com.bbb.dao.BaseDao;
import com.bbb.dao.BuycarsDao;
import com.bbb.entity.Buycars;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BuycarsService extends BaseService<Buycars>
{

    @Autowired
    BuycarsDao dao;

    public BaseDao<Buycars> getDao() {
        return dao;
    }
}
