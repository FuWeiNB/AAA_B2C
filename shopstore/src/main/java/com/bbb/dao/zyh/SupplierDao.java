package com.bbb.dao.zyh;

import com.aaa.util.DBhelper;
import com.bbb.entity.zyh.Merchandise;
import com.bbb.entity.zyh.Supplier;
import com.bbb.util.PageHelper;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public class SupplierDao {
    public List<Map<String, Object>> findAll(PageHelper p, Supplier entity) {
        String sql = "select * from supplier where 1=1";
        if(entity.getS_name() != null && entity.getS_name() != "") sql += " and s_name like '%"+entity.getS_name()+"%'";
        if(entity.getC_id() != null && entity.getC_id() != "") sql += " and c_id="+entity.getC_id();
        sql += " limit ?,?";
        return DBhelper.executeQuery(sql,p.getBegin(),p.getPageSize());
    }
    public List<Map<String,Object>> findProduct_ca(){
        return DBhelper.executeQuery("select c_Id,c_Name from product_categories");
    }
    public int count(Supplier entity){
        String sql = "select count(*) from supplier where 1=1";
        if(entity.getS_name() != null && entity.getS_name() != "") sql += " and s_name like '%"+entity.getS_name()+"%'";
        if(entity.getC_id() != null && entity.getC_id() != "") sql += " and c_id="+entity.getC_id();
        return Integer.valueOf(DBhelper.executeQuery(sql).get(0).get("count(*)").toString());
    }
    public void insert(Supplier entity){
        DBhelper.executeUpdate("insert into supplier(s_name,c_id) values(?,?)", entity.getS_name(),entity.getC_id());
    }
    public void delete(Supplier entity){
        DBhelper.executeUpdate("delete from supplier where s_id=?", entity.getS_id());
    }
    public Map<String,Object> findOne(Supplier entity){
        return DBhelper.executeQuery("select * from supplier where s_id=?", entity.getS_id()).get(0);
    }
    public void update(Supplier entity){
        DBhelper.executeUpdate("update supplier set s_name=?,c_id=? where s_id=?",entity.getS_name(),entity.getC_id(),entity.getS_id());
    }
    public List<Map<String,Object>> findSupplier(Merchandise mer){
        return DBhelper.executeQuery("select * from supplier where c_id=?",mer.getC_id());
    }
}
