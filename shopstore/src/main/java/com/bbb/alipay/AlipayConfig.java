package com.bbb.alipay;


public class AlipayConfig {
    // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
    public static String app_id = "2016101600697944";

    // 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQClSMGOeEfHs6TXN9t4j3uTMHXswxiAYC3xHshL+kAob7esQCCEhs3ILInO4FBi/9Vvh0svMumFIhZaCV7ofa3Kc49xbL0U5YV2yyY3j+ZMp+xwQZ07tODKSLf5bmCrSNS+/cBSsthZbeDikKed35pc0Sd6+stQPkxeWkOULVFTUNBFna1XPBB+8H+OkCZVUkU3U3UVxNBpE5QIQd+TGybATBQmQXjFeb4w/O5CeYFxykCD/Ep6hWW/KGlIZMMxuy8+nUthOaQFb4ns0IxAeE8ZeSXOF8xhp03UPwNHZyhD6O34KVpeD5ArZM5LI1/V1oBiLX//V2zet5CclyYtTPzBAgMBAAECggEBAJXQc7j6Zz2pJHH7bFBD5ePNWiZH1E6QXzQeDbloVH0Sfi6AVbkqIx4c2LCOe+6wK7sSq+BVSntlIVNtCPy85ikKQ+uwf1aQkD/T9YkJQtsanmJF5wn2coaIEVHibXbz5fpUMN4Ew7uTr/JM4dFkmxskbZ+38U+DmF8xe+20gfF8atTEJcu+VJJE35MgQmU22v0EJvavCZ2g6jBoQX9tBDkk+Q/FdnriiAnYcWInprPulXGeoC/ynM+VAUeQ5I5p8/E5bQJOvrY2CPKrxM+vEjoKHYGmnCSp5ibhcVIIiPKTe+tmJMvyjsdtfLHAHyhTjIGNMOiTHJ7WLDVISX+EXAECgYEAzfaONVuM+lqWzUgN7WRMcBV1MrjAdUNnV/GGipQG9qUR8usUOY07wQLY7zSmJKyVnLaHOsKAk9Nw6pQ3kiWml3I7TSOlca1A2PLHJJh+aoz4kCa/y/7V5a+BdWXUxOSGBfjh8IrOHSMUOBnMRsGGQNQIvIoKpzfGPdsFnS1JwyECgYEAzXBC4iqhr88pYfreRI2+IAhjudm9VnW2Mv1tsilbjAG6BN8CsYL9vhqlfi3CXKFCKniAvJ6i7xqrinUyMcdLJ5O3CEu9ukj1NbvKdj8PjHLDomyDfXKnyB0fd1yY2kJ0WnwvxBwdmo0T7eZMg50c2D8RrK7qBJoVeLeK1+eFpaECgYBjXngf8CqlQv2Mzx3BEen7Da88qHxaVwnOGT4jL+XoK53sSFS6q5RPu9L0Hb+m5AlO0ZWO2PZ128aXtqjU/wtP+BH6Vp9kqAUoZoGD+3rKZ3co/Tj979Y8+Z8JB/dOgz7SNNC1YBKvZhREONYgsQ/XyTTp2ePn53XitAASZB45YQKBgDLUPsgkkiKkl/GVF19QzqSwTrRSCkWVFEJjb7uv/eWTG8pOvyTaaxuZDi889STkBTHq5LdGbLvKFn1IZ+XnEFI3ewbDbqrjmD/2Oa6uBZPTZVIPlSz5rEeX5QwsTeland0xcsQLzMtLco3e+DlsKxHZ8O6PzHjdAsj+aIzozKlhAoGBALiUeXozlp4BOjNF+SES/rYuOJ/iTDWrI0ZuGZQ1qMCNc7xP8MJlUdihmOiUzhtdj1YA9plZz+76STW6A+SPgDnppKoYPBHKBV3dSeqfeFViEiFxCTk00tH1D5yuDkP9mMrvw2wyaS1B9thFbdv5+lTLSYL4f/73F62ZFM479zwa";

    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAgR3qVcuralc1uwrVFlHXhdsxc5ZC8E+jbvAFAM0UjKlMCeovaoPHc/7GxMb5PNBvmNsI1GpwYNz+fF4uWwUJ/WJvaO28M4K1dj1MJLYCTg43dmps0qrjNpCHV2Z7ZAwzZpU6zhnryIgTEeO5aKsPJ8foLcbnMXPMhYHgZieRJKO4JeYe5V9FwNkVyh8ydY8JoK14JIaUx6VfG3aE/ct/6S+G0OQmsi26GH+62iSyoVnKu4I3ue4tXuxGWbSKowOFbfQPAIfk9Ejs0hWn+pHRI/R1kyrNnZTUbMEuuI34PfbHog33ZGZLQofUiKIWj6WJ8QNg03bk1Elf4owU4203MQIDAQAB";

    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://localhost:8080/zyh/Payorders/alipayNotifyUrl";
    public static String notify_url2 = "http://localhost:8080/BuycarsNotifyUrl";

    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String return_url = "http://localhost:8080/zyh/Payorders/alipayReturnUrl";
    public static String return_url2 = "http://localhost:8080/BuycarsNotifyUrl";

    // 签名方式
    public static String sign_type = "RSA2";

    // 字符编码格式
    public static String charset = "utf-8";

    // 支付宝网关
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

    public static String format = "JSON";

    // 支付宝网关
    public static String log_path = "C:\\";
}
