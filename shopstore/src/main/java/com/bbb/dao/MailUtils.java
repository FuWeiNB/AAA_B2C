package com.bbb.dao;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import java.util.Properties;
import java.util.Random;

//发送邮箱的调试类(无关联类)
public class MailUtils
{
    public static void main(String[] args)
    {
        Random r = new Random();
        //随机生成的验证码
        int number = (int)((Math.random()*9+1)*100000);
        try
        {

            //接收者的邮箱账号，与发送的内容
            sendMail(" 2323865956@qq.com","这是一封注册邮件,注册码为："+number);

        } catch (AddressException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (MessagingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }


    /**
     *
     * @Title: sendMail
     * @Description: 实现发送邮件
     * @param email：接收邮件的地址
     * @param emailMsg：发送邮件的内容
     * @throws AddressException
     * @throws MessagingException
     */
    public static void sendMail(String email, String emailMsg)
            throws AddressException, MessagingException {
        // 1.创建一个程序与邮件服务器会话对象 Session

        Properties props = new Properties();
        props.setProperty("mail.transport.protocol", "SMTP");

        //163邮箱设置
        //props.setProperty("mail.host", "smtp.163.com");

        //qq邮箱设置
        props.setProperty("mail.host", "smtp.qq.com");

        props.setProperty("mail.smtp.auth", "true");// 指定验证为true

        // 创建验证器
        Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                //自己的邮箱账号和密码（发送者）{qq邮箱开启pop3/smtp时会给你一个授权码此授权码就是你登
                //入邮箱的密码

        return new PasswordAuthentication("2323865956", "sgmzjqjcyfjgebaj");
        }
    };

    Session session = Session.getInstance(props, auth);

    // 2.创建一个Message，它相当于是邮件内容
    Message message = new MimeMessage(session);

		message.setFrom(new InternetAddress("2323865956@qq.com")); // 设置发送者（自己的邮箱账号）

        message.setRecipient(RecipientType.TO, new InternetAddress(email)); // 设置发送方式与接收者

		message.setSubject("一醉坊用户注册");
    // message.setText("这是一封激活邮件，请<a href='#'>点击</a>");

		message.setContent(emailMsg, "text/html;charset=utf-8");

    // 3.创建 Transport用于将邮件发送

		Transport.send(message);
}

}
