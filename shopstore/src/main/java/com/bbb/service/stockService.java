package com.bbb.service;

import com.bbb.dao.stockDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class stockService
{
    @Autowired
    stockDao dao;

    public List<Map<String, Object>> showAll(String a_name, String begindate, String afterdate, String flag)
    {
        return dao.showAll(a_name, begindate, afterdate, flag);
    }

    public int countAll(String a_name, String begindate, String afterdate, String flag)
    {
        return dao.countAll(a_name, begindate, afterdate, flag);
    }

    public List<Map<String, Object>> showNow(String a_name)
    {
        return dao.showNow(a_name);
    }

    public int showNowCount(String a_name)
    {
        return dao.showNowCount(a_name);
    }

    public List<Map<String, Object>> showThisWeek(String a_name)
    {
        return dao.showThisWeek(a_name);
    }

    public int showThisWeekCount(String a_name)
    {
        return dao.showThisWeekCount(a_name);
    }

    public List<Map<String, Object>> showThisMonth(String a_name)
    {
        return dao.showThisMonth(a_name);
    }

    public int showThisMonthCount(String a_name)
    {
        return dao.showThisMonthCount(a_name);
    }

    public List<Map<String, Object>> showUpMonth(String a_name)
    {
        return dao.showUpMonth(a_name);
    }

    public int showUpMonthCount(String a_name)
    {
        return dao.showUpMonthCount(a_name);
    }

    public List<Map<String, Object>> findtheInStore(String m_id)
    {
        return dao.findtheInStore(m_id);
    }
    public int findtheInStoreCount(String m_id)
    {
        return dao.findtheInStoreCount(m_id);
    }
    public List<Map<String,Object>> findtheOutStore(String m_id)
    {
        return dao.findtheOutStore(m_id);
    }
    public int findtheOutStoreCount(String m_id)
    {
        return dao.findtheoutStoreCount(m_id);
    }
    public Map<String,Object> inStoreCount(String m_id)
    {
        return dao.inStoreCount(m_id);
    }
    public int OutStoreCount(String m_id)
    {
        return dao.OutStoreCount(m_id);
    }
    public List<Map<String,Object>> showAllOut(String a_name, String begindate, String afterdate)
    {
        return dao.showAllOut(a_name,begindate,afterdate);
    }
    public int showAlloutCount(String a_name, String begindate, String afterdate)
    {
        return dao.showAlloutCount(a_name,begindate,afterdate);
    }
    public Map<String,Object> findtheShop(String m_id)
    {
        return dao.findtheShop(m_id);
    }
}

