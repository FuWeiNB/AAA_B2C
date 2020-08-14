package com.bbb.service.zyh;

import com.bbb.dao.zyh.PayordersDao;
import com.bbb.entity.zyh.Instore;
import com.bbb.entity.zyh.Merchandise;
import com.bbb.entity.zyh.Payorders;
import com.bbb.util.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class PayordersService {
    @Autowired
    PayordersDao dao;

    public List<Map<String,Object>> goodsFindAll(PageHelper page, Merchandise mer){
        return dao.goodsFindAll(page,mer);
    }
    public int goodscount(Merchandise mer){
        return dao.goodscount(mer);
    }
    public List<Map<String,Object>> findProduct_ca(){
        return dao.findProduct_ca();
    }
    public Map<String,Object> toTrolley(Merchandise mer){
        return dao.toTrolley(mer);
    }
    public void insertIn_m(Object... obj){
        dao.insertIn_m(obj);
    }
    public void insertPayorders(Object... obj){
        dao.insertPayorders(obj);
    }
    public Map<String,Object> one(Object... obj){
        return dao.one(obj);
    }
    public List<Map<String,Object>> findDetlisByOrderId(String in_id){
        return dao.findInstoreByOrderId(in_id);
    }
    public Map<String, Object> Payone(Object... obj) {
        return dao.Payone(obj);
    }
    public List<Map<String,Object>> OrdersFindAll(PageHelper page, Payorders entity){
        return dao.OrdersFindAll(page,entity);
    }
    public int OrdersCount(Payorders entity){
        return dao.OrdersCount(entity);
    }
    public void MercountAdd(Instore entity){
        dao.MercountAdd(entity);
    }
    public String Signature(String id, String pass){
        return dao.verify(id,pass);
    }
    public Map<String, Object> findOrders(Object... obj){
        return dao.findOrders(obj);
    }
    public List<Map<String,Object>> findInstore(String In_id){
        return dao.findInstore(In_id);
    }
    public void UpdatePayorders(Object... obj){
       dao.UpdatePayorders(obj);
    }
    public void UpdateIn_m(Object... obj){
        dao.UpdateIn_m(obj);
    }
    public void UpdatePayorder(Object... obj){
        dao.UpdatePayorder(obj);
    }
    public void UpdateInStore(Object... obj){
        dao.UpdateInStore(obj);
    }
}
