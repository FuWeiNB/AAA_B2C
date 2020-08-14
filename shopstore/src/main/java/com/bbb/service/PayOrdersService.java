package com.bbb.service;

import com.bbb.dao.PayOrdersDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class PayOrdersService
{
    @Autowired
    PayOrdersDao dao;

    public List<Map<String,Object>> show_Supplier()
    {
        return dao.show_Supplier();
    }
    public int count()
    {
        return dao.count();
    }
    public List<Map<String,Object>> showshop()
    {
        return dao.showshop();
    }
    public Map<String,Object> showshopinfo(String m_id)
    {
        return dao.showshopinfo(m_id);
    }
}
