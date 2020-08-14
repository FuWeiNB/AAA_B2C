package com.bbb.service;

import com.bbb.dao.BaseDao;
import com.bbb.dao.addressDao;
import com.bbb.entity.address;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AddressService extends BaseService<address>
{
    @Autowired
    addressDao dao;

    @Override
    public BaseDao<address> getDao()
    {
        return dao;
    }
}
