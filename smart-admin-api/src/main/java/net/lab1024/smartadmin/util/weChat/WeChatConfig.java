package net.lab1024.smartadmin.util.weChat;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @author wangQiang
 * @date 2021/7/29 17:31
 */

@Component
@ConfigurationProperties(prefix = "visitor.wechat")
public class WeChatConfig {

    public static Boolean enabled = false;
    /**
     * 域名
     */
    public static String host = "wx.xxx.com";

    /**
     * 微信公众号的appId
     */
    public static String appid = "wxecac1489859e70c6";

    /**
     * 微信公众号的secret
     */
    public static String secret = "a9c2c3f5e2fabf3a64e58b0dc739a3b5";

    /**
     * 微信公众号消息模板Id 访客申请通知
     */
    public static String visitorApplyTemplateId = "INDbswunUiReh_z0WYWLQ-N146HLzs93YXbiC80994o";

    /**
     * 微信公众号消息模板Id 来访审核通知
     */
    public static String visitorApplyShTemplateId = "G9RABtkaa4WsbBFH5VbwZp88Q6cprHmobXnzvtbAtYY";
    /**
     * 微信公众号消息模板Id 来访通知 学校来访通知
     */
    public static String visitorNoticeTemplateId = "1dLPZFHuK1j_7I_EJujobaaMXyFDkg1AJzaXXt5fl5E";


    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public void setAppId(String appId) {
        this.appid = appId;
    }

    public void setSecret(String secret) {
        this.secret = secret;
    }

    public void setVisitorApplyTemplateId(String visitorApplyTemplateId) {
        this.visitorApplyTemplateId = visitorApplyTemplateId;
    }

    public void setVisitorApplyShTemplateId(String visitorApplyShTemplateId) {
        this.visitorApplyShTemplateId = visitorApplyShTemplateId;
    }

    public void setVisitorNoticeTemplateId(String visitorNoticeTemplateId) {
        this.visitorNoticeTemplateId = visitorNoticeTemplateId;
    }
}
