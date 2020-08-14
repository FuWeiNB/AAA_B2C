package com.bbb.web;

import com.aliyuncs.CommonRequest;
import com.aliyuncs.CommonResponse;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.exceptions.ServerException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Random;

//手机号发送验证码信息
@Controller
@RequestMapping("SendMessage")//窄化路径
public class SendMessageController
{
    private int number ;

    @RequestMapping("sendM")
    public String sendM(String phone)
    {
        Random r = new Random();
        //随机生成的验证码
        number = (int)((Math.random()*9+1)*100000);
        DefaultProfile profile = DefaultProfile.getProfile("cn-hangzhou", "LTAI4FwvULYECQkF5Fq1FNNu", "V1QWG9qHynniPSGSRzMRg1tnAnlNZp");
        IAcsClient client = new DefaultAcsClient(profile);
        CommonRequest request = new CommonRequest();
        request.setMethod(MethodType.POST);
        request.setDomain("dysmsapi.aliyuncs.com");
        request.setVersion("2017-05-25");
        request.setAction("SendSms");
        request.putQueryParameter("RegionId", "cn-hangzhou");
        request.putQueryParameter("PhoneNumbers", phone);
        request.putQueryParameter("SignName", "一醉坊");
        request.putQueryParameter("TemplateCode", "SMS_181855729");
        request.putQueryParameter("TemplateParam", "{\"code\":"+number+"}");
        try {
            CommonResponse response = client.getCommonResponse(request);
            String info = response.getData().indexOf(12,14)+"";
        } catch (ServerException e) {
            e.printStackTrace();
        } catch (ClientException e) {
            e.printStackTrace();
        }

        return "";
    }
    @ResponseBody
    @RequestMapping("toequals")
    public String toequals(String yan)
    {
        //判断验证码是否输入正确
        System.out.println("numuber:"+number+"yan:"+yan);
        if(number==Integer.valueOf(yan)||(number+"").equals(yan))
        {
            return "0";
        }
        else
        {
            return "1";
        }
    }
}
