package com.bbb.dao.zyh;

import com.aaa.util.DBhelper;
import com.bbb.entity.zyh.Dept;
import com.bbb.entity.zyh.Emp;
import com.bbb.entity.zyh.Role;
import com.bbb.util.BaseDao;
import com.bbb.util.PageHelper;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
@Component
public class EmpDao implements BaseDao<Emp> {
    @Override
    public void add(Emp entity) {
        DBhelper.executeUpdate("insert into emp(e_name,e_pass,r_id,e_flag) values(?,123456,?,0)",entity.getE_name(), entity.getR_id());
    }

    @Override
    public void upd(Emp entity) {
        DBhelper.executeUpdate("update emp set e_name=?,e_pass=?,r_id=? where e_id=?",entity.getE_name(),entity.getE_pass(),entity.getR_id(),entity.getE_id());
    }

    @Override
    public void del(Emp entity) {
        DBhelper.executeUpdate("update emp set e_flag=? where e_id=?",entity.getE_flag(),entity.getE_id());
    }

    @Override
    public List<Map<String, Object>> findAll(Object... obj) {
        return null;
    }

    @Override
    public List<Map<String, Object>> findPage(PageHelper p, Object... obj) {
        return null;
    }

    @Override
    public Map<String, Object> findone(Emp entity) {
        return DBhelper.executeQuery("select e_id,e_name,e_pass,r.r_id,r_name,d.d_id,d_name,d_loc from emp e left join role r on e.r_id=r.r_id left join dept d on r.d_id=d.d_id where e_id=?",entity.getE_id()).get(0);
    }

    @Override
    public int count(Emp entity) {
        return 0;
    }

    @Override
    public List<Map<String, Object>> findByParams(PageHelper p, Emp entity) {
        return null;
    }

    public List<Map<String,Object>> paging(PageHelper p, Emp emp, Dept dept, Role role){
        String sql = "select e.e_id,e.e_name,d.d_id,d.d_name,r.r_name from emp e left join role r on e.r_id=r.r_id left join dept d on r.d_id=d.d_id where 1=1";
        if(emp.getE_flag() != null && emp.getE_flag() != "") sql += " and e.e_flag="+emp.getE_flag();
        if(emp.getE_name() != null && emp.getE_name() != "") sql += " and e.e_name like '%"+emp.getE_name()+"%'";
        if(dept.getD_name() != null && dept.getD_name() != "") sql += " and d.d_name like '%"+dept.getD_name()+"%'";
        if(role.getR_name() != null && role.getR_name() != "") sql += " and r.r_name like '%"+role.getR_name()+"%'";
        sql += " limit ?,?";
        return DBhelper.executeQuery(sql, p.getBegin(), p.getPageSize());
    }

    public int count(Emp emp, Dept dept, Role role){
        String sql = "select count(*) from emp e left join role r on e.r_id=r.r_id left join dept d on r.d_id=d.d_id where 1=1";
        if(emp.getE_name() != null && emp.getE_name() != "") sql += " and e.e_name like '%"+emp.getE_name()+"%'";
        if(dept.getD_name() != null && dept.getD_name() != "") sql += " and d.d_name like '%"+dept.getD_name()+"%'";
        if(role.getR_name() != null && role.getR_name() != "") sql += " and r.r_name like '%"+role.getR_name()+"%'";
        return Integer.valueOf(DBhelper.executeQuery(sql).get(0).get("count(*)").toString());
    }

    public List<Map<String, Object>> findDept(){
        return DBhelper.executeQuery("select * from dept");
    }

    public List<Map<String, Object>> findRole(Role role){
        return DBhelper.executeQuery("select * from role where d_id=?",role.getD_id());
    }
}
