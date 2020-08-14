package com.bbb.entity;

public class orderdetials
{
    private String itemId;
    private Merchandise m;
    private String buy_number;
    private String t_id;
    private orders o;

    public String getItemId()
    {
        return itemId;
    }

    public void setItemId(String itemId)
    {
        this.itemId = itemId;
    }

    public Merchandise getM()
    {
        return m;
    }

    public void setM(Merchandise m)
    {
        this.m = m;
    }

    public String getBuy_number()
    {
        return buy_number;
    }

    public void setBuy_number(String buy_number)
    {
        this.buy_number = buy_number;
    }

    public String getT_id()
    {
        return t_id;
    }

    public void setT_id(String t_id)
    {
        this.t_id = t_id;
    }

    public orders getO()
    {
        return o;
    }

    public void setO(orders o)
    {
        this.o = o;
    }
}
