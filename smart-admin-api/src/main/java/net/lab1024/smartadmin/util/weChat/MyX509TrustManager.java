package net.lab1024.smartadmin.util.weChat;

import javax.net.ssl.X509TrustManager;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;

/**
 * 信任管理器
 * @author wangQiang
 * @date 2021/7/23 9:13
 */
public class MyX509TrustManager implements X509TrustManager {
    // 检查客户端证书
    public void checkClientTrusted(X509Certificate[] chain, String authType) throws CertificateException {
    }

    // 检查服务器端证书
    public void checkServerTrusted(X509Certificate[] chain, String authType) throws CertificateException {
    }

    // 返回受信任的X509证书数组
    public X509Certificate[] getAcceptedIssuers() {
        return null;
    }
}
