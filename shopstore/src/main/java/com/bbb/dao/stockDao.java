package com.bbb.dao;

import com.aaa.util.DBhelper;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
/*
   用来查询库存的
 */
@Component
public class stockDao
{
    public List<Map<String,Object>> showAll(String a_name,String begindate,String afterdate,String flag)
    {
        String sql ="select m.m_id,m.m_oldprice*m.m_count sums,m.m_number,m.m_name,p_c.c_name,m.m_oldprice,m.m_count,m.m_Date,m.m_flag \n" +
                "  from merchandise m " +
                "  inner join p_m on m.m_id = p_m.m_id" +
                "  inner join product_categories p_c on p_m.c_id = p_c.c_id" +
                "   where 1=1" ;
        if(!"".equals(a_name))
        {
            sql+=" and (m.m_number like '%"+a_name+"%' or m.m_name like '%"+a_name+"%' or p_c.c_name like '%"+a_name+"%' )";
        }
        if (!"".equals(begindate) && !"".equals(afterdate))
        {
            sql += " and m.m_date between '" + begindate + "' and '" + afterdate + "' ";
        }
        if(!"".equals(flag))
        {
            sql +=" and m.m_flag ="+flag;
        }
        sql +=" group by m.m_id ";
        return DBhelper.executeQuery(sql);
    }
    public int  countAll(String a_name,String begindate,String afterdate,String flag)
    {
        String sql ="select * " +
                " from merchandise m " +
                " inner join p_m on p_m.m_id = m.m_id" +
                " inner join product_categories p_c on p_c.c_id=p_m.c_id" +
                " where 1=1";
        if(!"".equals(a_name))
        {
            sql+=" and (m.m_number like '%"+a_name+"%' or m.m_name like '%"+a_name+"%' or p_c.c_name like '%"+a_name+"%' )";
        }
        if (!"".equals(begindate) && !"".equals(afterdate))
        {
            sql += " and m.m_date between '" + begindate + "' and '" + afterdate + "' ";
        }
        if(!"".equals(flag))
        {
            sql +=" and m.m_flag ="+flag;
        }
        sql +=" group by m.m_id ";

        if(DBhelper.executeQuery(sql).size() != 0)
        {
            return DBhelper.executeQuery(sql).size();
        }
        else
        {
            return 0;
        }
    }

    public List<Map<String,Object>> showNow(String a_name)
    {
        String sql = "select m.m_id,m.m_oldprice*m.m_count sums,m.m_name,p_c.c_name,m.m_oldprice,m.m_count,m.m_Date,m.m_number" +
                " from merchandise m " +
                " inner join p_m on m.m_id=p_m.m_id" +
                " inner join product_categories p_c on p_c.c_id=p_m.c_id" +
                " where to_days(m.m_date) = to_days(now())" ;
        if(!"".equals(a_name))
        {
            sql+=" and (m.m_number like '%"+a_name+"%' or m.m_name like '%"+a_name+"%' or p_c.c_name like '%"+a_name+"%' )";
        }

        sql +="group by m.m_id";
        return DBhelper.executeQuery(sql);
    }
    public int showNowCount(String a_name)
    {
        String sql = "select count(*) counts" +
                " from merchandise m " +
                " inner join p_m on m.m_id=p_m.m_id" +
                " inner join product_categories p_c on p_c.c_id=p_m.c_id" +
                " where to_days(m.m_date) = to_days(now())" ;
        if(!"".equals(a_name))
        {
            sql+=" and (m.m_number like '%"+a_name+"%' or m.m_name like '%"+a_name+"%' or p_c.c_name like '%"+a_name+"%' )";
        }
        sql +=" group by m.m_id ";

        if(DBhelper.executeQuery(sql).size() != 0)
        {
            return Integer.valueOf(DBhelper.executeQuery(sql).get(0).get("counts").toString()) ;
        }
        else
        {
            return 0;
        }

    }

    //查询本周的
    public List<Map<String,Object>> showThisWeek(String a_name)
    {
        String sql = "select m.m_id,m.m_oldprice*m.m_count sums,m.m_name,p_c.c_name,m.m_oldprice,m.m_count,m.m_Date,m.m_number" +
                " from merchandise m " +
                " inner join p_m on m.m_id=p_m.m_id" +
                " inner join product_categories p_c on p_c.c_id=p_m.c_id" +
                " WHERE YEARWEEK(date_format(m.m_date,'%Y-%m-%d')) = YEARWEEK(now())" ;
        if(!"".equals(a_name))
        {
            sql+=" and (m.m_number like '%"+a_name+"%' or m.m_name like '%"+a_name+"%' or p_c.c_name like '%"+a_name+"%' )";
        }

        sql +="group by m.m_id";
        return DBhelper.executeQuery(sql);
    }
    //查询本周的数量
    public int showThisWeekCount(String a_name)
    {
        String sql = "select count(*) counts" +
                " from merchandise m " +
                " inner join p_m on m.m_id=p_m.m_id" +
                " inner join product_categories p_c on p_c.c_id=p_m.c_id" +
                " WHERE YEARWEEK(date_format(m.m_date,'%Y-%m-%d')) = YEARWEEK(now()) " ;
        if(!"".equals(a_name))
        {
            sql+=" and (m.m_number like '%"+a_name+"%' or m.m_name like '%"+a_name+"%' or p_c.c_name like '%"+a_name+"%' )";
        }
        sql +="group by m.m_id";
        if(DBhelper.executeQuery(sql).size() != 0)
        {
            return Integer.valueOf(DBhelper.executeQuery(sql).get(0).get("counts").toString()) ;
        }
        else
        {
            return 0;
        }
    }
    //查询本月的数据
    public List<Map<String,Object>> showThisMonth(String a_name)
    {
        String sql = "select m.m_id,m.m_oldprice*m.m_count sums,m.m_name,p_c.c_name,m.m_oldprice,m.m_count,m.m_Date,m.m_number" +
                " from merchandise m " +
                " inner join p_m on m.m_id=p_m.m_id" +
                " inner join product_categories p_c on p_c.c_id=p_m.c_id" +
                " WHERE date_format(m.m_date,'%Y-%m')=date_format(now(),'%Y-%m') " ;
        if(!"".equals(a_name))
        {
            sql+=" and (m.m_number like '%"+a_name+"%' or m.m_name like '%"+a_name+"%' or p_c.c_name like '%"+a_name+"%' )";
        }
        sql +=" group by m.m_id";
       return DBhelper.executeQuery(sql);
    }
    //查询本月的数据总数
    public int showThisMonthCount(String a_name)
    {
        String sql = "select count(*) counts" +
                " from merchandise m " +
                " inner join p_m on m.m_id=p_m.m_id" +
                " inner join product_categories p_c on p_c.c_id=p_m.c_id" +
                " WHERE date_format(m.m_date,'%Y-%m')=date_format(now(),'%Y-%m')  " ;
        if(!"".equals(a_name))
        {
            sql+=" and (m.m_number like '%"+a_name+"%' or m.m_name like '%"+a_name+"%' or p_c.c_name like '%"+a_name+"%' )";
        }
        sql +=" group by m.m_id";
        if(DBhelper.executeQuery(sql).size() != 0)
        {
            return Integer.valueOf(DBhelper.executeQuery(sql).get(0).get("counts").toString()) ;
        }
        else
        {
            return 0;
        }
    }

    //查询上个月的数据PERIOD_DIFF(DATE_FORMAT(NOW(),'%Y%m'), DATE_FORMAT(m_date,'%Y%m')) =1
    public List<Map<String,Object>> showUpMonth(String a_name)
    {
        String sql = "select  m.m_id,m.m_oldprice*m.m_count sums,m.m_name,p_c.c_name,m.m_oldprice,m.m_count,m.m_Date,m.m_number" +
                " from merchandise m " +
                " inner join p_m on m.m_id=p_m.m_id" +
                " inner join product_categories p_c on p_c.c_id=p_m.c_id" +
                " WHERE PERIOD_DIFF(DATE_FORMAT(NOW(),'%Y%m'), DATE_FORMAT(m.m_date,'%Y%m')) =1" ;
        if(!"".equals(a_name))
        {
            sql+=" and (m.m_number like '%"+a_name+"%' or m.m_name like '%"+a_name+"%' or p_c.c_name like '%"+a_name+"%' )";
        }
        sql +=" group by m.m_id";
        System.out.println(sql);
        return DBhelper.executeQuery(sql);
    }
    public int showUpMonthCount(String a_name)
    {
        String sql = "select count(*) counts" +
                " from merchandise m " +
                " inner join p_m on m.m_id=p_m.m_id" +
                " inner join product_categories p_c on p_c.c_id=p_m.c_id" +
                " WHERE PERIOD_DIFF(DATE_FORMAT(NOW(),'%Y%m'), DATE_FORMAT(m.m_date,'%Y%m')) =1" ;
        if(!"".equals(a_name))
        {
            sql+=" and (m.m_number like '%"+a_name+"%' or m.m_name like '%"+a_name+"%' or p_c.c_name like '%"+a_name+"%' )";
        }
        sql +=" group by m.m_id";
        if(DBhelper.executeQuery(sql).size() != 0)
        {
            return Integer.valueOf(DBhelper.executeQuery(sql).get(0).get("counts").toString()) ;
        }
        else
        {
            return 0;
        }
    }
    //查询入库量
    public List<Map<String,Object>> findtheInStore(String m_id)
    {
        String sql="select m.m_name,insr.in_num2,emp.e_name,pays.pay_date,pays.in_id,supplier.s_name from merchandise m \n" +
                " inner join instore insr on m.m_id = insr.m_id\n" +
                " inner join payorders pays on pays.in_id = insr.in_id\n" +
                " inner join supplier on insr.s_id = supplier.s_id\n" +
                " inner join emp on emp.e_id=insr.e_id\n" +
                "  where 1=1 and insr.in_flag = 4  " ;
        if(!"".equals(m_id))
        {
            sql+=" and m.m_id = " +m_id;
        }
        sql+=" order by pays.pay_date";
        return DBhelper.executeQuery(sql);

    }
    //查询入库总数
    public int findtheInStoreCount(String m_id)
    {
        String sql="select  count(*) counts from merchandise m" +
                "   inner join instore insr on m.m_id = insr.m_id " +
                "   inner join payorders pays on pays.in_id = insr.in_id" +
                "   inner join supplier on insr.s_id = supplier.s_id" +
                "   inner join emp on emp.e_id=insr.e_id" +
                " where 1=1 and insr.in_flag = 1  " ;
        if(!"".equals(m_id))
        {
            sql+=" and m.m_id = " +m_id;
        }
        if(DBhelper.executeQuery(sql).size() == 0)
        {
            return 0;
        }
        else
        {
            return Integer.valueOf(DBhelper.executeQuery(sql).get(0).get("counts").toString());
        }
    }

    //查询出库量
    public List<Map<String,Object>> findtheOutStore(String m_id)
    {
        String sql="select  m.m_id,m.m_name,oue.out_number,oue.out_date,sum(out_m.o_number) sums,emp.e_name,oue.out_flag from merchandise m " +
                " inner join out_m on m.m_id = out_m.m_id" +
                " inner join outstore oue on out_m.out_id=oue.out_id" +
                " inner join emp on emp.e_id = oue.e_id" +
                " where 1=1 " ;

        if(!"".equals(m_id))
        {
            sql+=" and m.m_id = " +m_id;
        }
        sql+= " group by oue.out_date order by oue.out_date desc";
        return DBhelper.executeQuery(sql);
    }
    //查询出库总数
    public int findtheoutStoreCount(String m_id)
    {
        String sql="select count(*) counts from merchandise m " +
                " inner join out_m on m.m_id = out_m.m_id" +
                " inner join outstore oue on out_m.out_id=oue.out_id" +
                " inner join emp on emp.e_id = oue.e_id" +
                " where 1=1 " ;
        if(!"".equals(m_id))
        {
            sql+=" and m.m_id = " +m_id;
        }
        sql+= " group by oue.out_date order by oue.out_date desc";

        return  DBhelper.executeQuery(sql).size() == 0 ? 0:
                Integer.valueOf(DBhelper.executeQuery(sql).size());
    }

    //查询入库总量
    public Map<String,Object> inStoreCount(String m_id)
    {
        String sql = "select m.m_id,sum(ins.in_num2) sums,m.m_name" +
                "  from merchandise m " +
                "  inner join instore ins on ins.m_id = m.m_id " +
                "  inner join emp on emp.e_id = ins.e_id" +
                "  where 1=1" +
                "" ;
        if(!"".equals(m_id))
        {
            sql+=" and m.m_id = " +m_id;
        }
        sql+= " group by m.m_id";

        if(DBhelper.executeQuery(sql).size() == 0)
        {
            return null;
        }
        else
        {
            return DBhelper.executeQuery(sql).get(0);
        }

    }
    //查询出库总量
    public int OutStoreCount(String m_id)
    {
        String sql = "select m.m_id,sum(out_m.o_number) sums from merchandise m" +
                " inner join out_m on m.m_id = out_m.m_id" +
                " inner join outstore oue on out_m.out_id=oue.out_id" +
                " inner join emp on emp.e_id = oue.e_id" +
                " where 1=1 " ;
        if(!"".equals(m_id))
        {
            sql+=" and m.m_id = " +m_id;
        }
        sql+= " group by m.m_id";
        return  DBhelper.executeQuery(sql).size() == 0 ? 0:
                Integer.valueOf(DBhelper.executeQuery(sql).get(0).get("sums").toString());
    }


    //出库单查询
    public List<Map<String,Object>> showAllOut(String a_name, String begindate, String afterdate)
    {
        String sql ="select m.m_name,m.m_price,ous.out_number,ous.out_date," +
                " e.e_name,ous.out_flag,out_m.o_number,o.o_id,o.o_name" +
                " from out_m" +
                " inner join outstore ous on out_m.out_id=ous.out_id" +
                " inner join orders o on ous.o_id=o.o_id" +
                " inner join merchandise m on m.m_id=out_m.m_id" +
                " inner join emp e on e.e_id = ous.e_id" +
                " where 1=1" ;
        if(!"".equals(a_name))
        {
            sql+=" and (m.m_name like '%"+a_name+"%' or ous.out_number like '%"+a_name+"%' or e.e_name like '%"+a_name+"%' " +
                    " or o.o_id like '%"+a_name+"%' " +
                    " )";
        }
        if (!"".equals(begindate) && !"".equals(afterdate))
        {
            sql += " and ous.out_date between '" + begindate + "' and '" + afterdate + "' ";
        }
        sql+=" order by ous.out_date desc";

        return DBhelper.executeQuery(sql);
    }
    public int showAlloutCount(String a_name, String begindate, String afterdate)
    {
        String sql ="select count(*) counts" +
                " from out_m" +
                " inner join outstore ous on out_m.out_id=ous.out_id" +
                " inner join orders o on ous.o_id=o.o_id" +
                " inner join merchandise m on m.m_id=out_m.m_id" +
                " inner join emp e on e.e_id = ous.e_id" ;
        if(!"".equals(a_name))
        {
            sql+=" and (m.m_name like '%"+a_name+"%' or ous.out_number like '%"+a_name+"%' or e.e_name like '%"+a_name+"%' " +
                    " or o.o_id like '%"+a_name+"%' " +
                    " )";
        }
        if (!"".equals(begindate) && !"".equals(afterdate))
        {
            sql += " and ous.out_date between '" + begindate + "' and '" + afterdate + "' ";
        }
        sql+=" order by ous.out_date";

        return Integer.valueOf(DBhelper.executeQuery(sql).get(0).get("counts").toString());
    }
    public Map<String,Object> findtheShop(String m_id)
    {
        String sql = "select images.img_url,m.m_name from merchandise m" +
                " inner join img_m on m.m_id = img_m.m_id" +
                " inner join images on images.img_id = img_m.img_id" +
                " where m.m_id = '" +m_id+"'"+
                " group by m.m_id";
                return DBhelper.executeQuery(sql).get(0);
    }

}
