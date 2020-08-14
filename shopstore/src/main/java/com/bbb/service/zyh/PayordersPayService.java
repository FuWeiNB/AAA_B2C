package com.bbb.service.zyh;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.bbb.alipay.AlipayConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

@Service
@RequestMapping("/zyh/PayordersPay")
public class PayordersPayService {
    @Autowired
    PayordersService pos;

    @RequestMapping(value = "jiesuan",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String goodsPay(HttpServletResponse response, HttpServletRequest request) throws UnsupportedEncodingException, AlipayApiException {
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        //获得初始化的AlipayClient
        System.out.println(1);
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, AlipayConfig.format, AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
        //设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AlipayConfig.return_url);
        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
        String pay_id = request.getParameter("in_id");
        System.out.println(pay_id);
        String[] inpirce = request.getParameterValues("in_price2");
        String[] number = request.getParameterValues("in_num2");
        String[] memo = request.getParameterValues("in_memo");
        String pay_price2 = request.getParameter("pay_price2");
        HttpSession session = request.getSession();
        Map<String,Object> map = (HashMap)session.getAttribute("e_id");
        pos.UpdatePayorders(map.get("e_id"),pay_price2,pay_id);
        for(int i = 0 ; i<inpirce.length&&i<number.length&&i<memo.length;i++)
        {
            pos.UpdateIn_m(map.get("e_id"),number[i],inpirce[i],memo[i],pay_id);
        }
        String sub = "采购";
        String bodu = "描述";
        //商户订单号，商户网站订单系统中唯一订单号，必填
        String out_trade_no = pay_id;
        //付款金额，必填
        String total_amount = pay_price2;
        //订单名称，必填
        String subject = sub;
        //商品描述，可空
        String body = bodu;
        alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
                + "\"total_amount\":\""+ total_amount +"\","
                + "\"subject\":\""+ subject +"\","
                + "\"body\":\""+ body +"\","
                + "\"timeout_express\":\"10m\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
        String result = alipayClient.pageExecute(alipayRequest).getBody();
        return result;
    }
}
