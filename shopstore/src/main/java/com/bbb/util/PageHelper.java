package com.bbb.util;

public class PageHelper
{
    private int count;
    private int pageSize=3;
    private int nowpage=1;
    private int begin;
    private int TotalPage = 0;
	public int getCount()
	{
		return count;
	}
	public void setCount(int count)
	{
		this.count = count;
	}
	public int getPageSize()
	{
		return pageSize;
	}
	public void setPageSize(int pageSize)
	{
		this.pageSize = pageSize;
	}
	public int getNowpage()
	{
		return nowpage;
	}
	public void setNowpage(String nowpage)
	{
		if(nowpage == null)
		{
			this.nowpage=1;
			return;
		}
		this.nowpage = Integer.valueOf(nowpage);
	}
	public int getBegin()
	{
		begin=(this.nowpage-1)*this.pageSize;
		return begin;
	}
	public void setBegin(int begin)
	{
		this.begin = begin;
	}
	public int getTotalPage()
	{
		TotalPage = this.count%this.pageSize == 0? 
				this.count / this.pageSize : this.count/this.pageSize+1;
		return TotalPage;
	}
	public void setTotalPage(int totalPage)
	{
		TotalPage = totalPage;
	}
    
}
