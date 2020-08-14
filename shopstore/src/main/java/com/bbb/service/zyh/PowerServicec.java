package com.bbb.service.zyh;

import com.bbb.dao.zyh.PowerDaoc;
import com.bbb.entity.zyh.power;
import com.bbb.util.BaseDao;
import com.bbb.util.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PowerServicec extends BaseService<power> {
    @Autowired
    PowerDaoc dao;

    public BaseDao<power> getDao()
    {
        return dao;
    }
}
