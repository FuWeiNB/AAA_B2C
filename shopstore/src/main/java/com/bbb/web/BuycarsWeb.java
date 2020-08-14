package com.bbb.web;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.bbb.alipay.AlipayConfig;
import com.bbb.dao.BuycarsDao;
import com.bbb.dao.addressDao;
import com.bbb.entity.Buycars;
import com.bbb.entity.address;
import com.bbb.service.BuycarsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

@Controller
public class BuycarsWeb
{
    @Autowired
    BuycarsService bs;

    @Autowired
    BuycarsDao bd;

    @Autowired
    addressDao dao;

    @RequestMapping("bw_view")
    public String bw_view(Buycars cars, Model m)
    {
        m.addAttribute("list", bs.find(cars.getB_user()));
        m.addAttribute("lists", dao.findByUser(cars));
        return "shopcart";
    }

    @RequestMapping("sp_del")
    public String sp_del(Buycars cars, Model m)
    {
        bs.del(cars);
        return bw_view(cars, m);
    }

    Buycars b = new Buycars();

    @RequestMapping(value = "BuycarsPay", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String MerchandisePay(Buycars entity, HttpServletResponse response, HttpServletRequest request) throws UnsupportedEncodingException, AlipayApiException, AlipayApiException
    {
        //根据选中的那个收货地址获得编号查询这个编号里面的收货地址和手机号还有收货人
        Map<String,Object> map = bd.findOne(entity);
        entity.setO_name(map.get("a_name").toString());
        entity.setO_phone(map.get("a_phone").toString());
        entity.setO_site(map.get("a_namedetials").toString());
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        //获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, AlipayConfig.format, AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
        //设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AlipayConfig.return_url2);
        alipayRequest.setNotifyUrl(AlipayConfig.notify_url2);
        String o_id = new Date().toString() + UUID.randomUUID().toString().replace("-", "");
        String sub = "结算";
        String bodu = "描述";
        b = entity;
        //商户订单号，商户网站订单系统中唯一订单号，必填
        String out_trade_no = o_id;
        //付款金额，必填
        String total_amount = Float.toString(entity.getO_price());
        System.out.println(total_amount);
        //订单名称，必填
        String subject = sub;
        //商品描述，可空
        String body = bodu;
        alipayRequest.setBizContent("{\"out_trade_no\":\"" + out_trade_no + "\","
                + "\"total_amount\":\"" + total_amount + "\","
                + "\"subject\":\"" + subject + "\","
                + "\"body\":\"" + body + "\","
                + "\"timeout_express\":\"10m\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
        String result = alipayClient.pageExecute(alipayRequest).getBody();
        return result;
    }

    @RequestMapping("BuycarseReturnUrl")
    public String merchandiseReturnUrl(Model m)
    {
        bd.add_Ods(b);

        return bw_view(b, m);
    }

    @RequestMapping("BuycarsNotifyUrl")
    public String merchandiseNotifyUrl(Model m)
    {
        bd.add_Ods(b);
        return bw_view(b, m);
    }

    //查看地址中的详情
    @ResponseBody
    @RequestMapping("toshowDetials")
    public String toshow(address s)
    {
        Random r = new Random();
        int num = r.nextInt();
        String json = "";
        System.out.println(s.getA_id());
        Map<String,Object> map = null;
        if(!"0".equals(s.getA_id()))
        {
             map = dao.findone(s);
        }

        if(map == null)
        {
            json = "<span style='color:red'>ps:您还没有添加呢,先添加一下吧。" +
                    "如果您想要添加或者修改地址,请点击下方," +
                    "</br>并且我们本店,不进行任何售后处理的哦!" +
                    "</br>因为我们有质量保障的呢亲！</span>" +
                    "<a href='person/ByUserFind?a_id="+num+"' >添加/修改地址</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
        }
        else
        {
            json = "<div style='margin:10px 0px 0px 30px;font-size:18px;'>收货人名称:"+map.get("a_name")+"</br>收货人电话:"+
                    map.get("a_phone")+"</br>收货地址:"+map.get("a_namedetials")+"</div>" +
                    "<div style='height:20px;'></div>" +
                    "<div style='margin:10px 0px 0px 30px;font-size:18px;'>" +
                    "<span style='color:red'>ps:如果您想要添加或者修改地址,请点击下方," +
                    "</br>并且我们本店,不进行任何售后处理的哦!" +
                    "</br>因为我们有质量保障的呢亲！</span>" +
                    "<a href='person/ByUserFind?a_id="+map.get("a_id")+"' >添加/修改地址</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
                    "</div>";
        }
        return json;
    }





}
