package net.lab1024.smartadmin.module.weChat;

import io.swagger.annotations.Api;
import net.lab1024.smartadmin.common.anno.NoNeedLogin;
import net.lab1024.smartadmin.common.constant.ResponseCodeConst;
import net.lab1024.smartadmin.common.domain.ResponseDTO;
import net.lab1024.smartadmin.module.system.employee.EmployeeService;
import net.lab1024.smartadmin.module.system.login.domain.RequestTokenBO;
import net.lab1024.smartadmin.util.SmartRequestTokenUtil;
import net.lab1024.smartadmin.util.weChat.WeChatConfig;
import net.lab1024.smartadmin.util.weChat.WeChatUtils;
import net.sf.json.JSONObject;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.UUID;


/**
 * @author wangQiang
 * @date 2021/7/23 9:56
 */
@RequestMapping("/api/wx/")
@RestController
@Api(tags = {"微信"})
public class WXController {

    @Autowired
    private EmployeeService employeeService;

    @GetMapping(value = "/getConfig")
    @NoNeedLogin
    public ResponseDTO<Object> getConfig() {
        JSONObject result = new JSONObject();
        result.put("enabled", WeChatConfig.enabled);
        if(WeChatConfig.enabled){
            result.put("appid", WeChatConfig.appid);
        }else{
            result.put("openid", UUID.randomUUID().toString().replaceAll("-", ""));
        }
        return ResponseDTO.succData(result);
    }

    /**
     * 通过浏览器传的code获取openid
     *
     * @param code
     * @return ResponseDTO
     */
    @GetMapping(value = "/getOpenId/{code}")
    @NoNeedLogin
    public ResponseDTO<Object> getOpenIdBycode(@PathVariable String code) {
        //code = "0313jcll254is74Edgnl2BZZyZ33jcll";
        String openid = null;
        System.out.println("code:" + code);
        JSONObject jsonObject = WeChatUtils.getAccessToken(code);

        if (!jsonObject.containsKey("errcode")) {
            openid = jsonObject.getString("openid");
        }
        System.out.println(openid);
        //openid = "041knC000LSn6M1Jwe100piZEY1knC0";
        return ResponseDTO.succData(openid);
    }

    /**
     * 通过浏览器传的code获取openid 并更新当前用户openid信息
     *
     * @return ResponseDTO
     */
    @GetMapping(value = "/getOpenIdAndSave/{code}")
    public ResponseDTO<Object> getOpenIdAndSave(@PathVariable String code) {
        //code = "0313jcll254is74Edgnl2BZZyZ33jcll";
        String openid = null;
        System.out.println("code:" + code);
        JSONObject jsonObject = WeChatUtils.getAccessToken(code);

        if (!jsonObject.containsKey("errcode")) {
            openid = jsonObject.getString("openid");
        }

        RequestTokenBO requestToken = SmartRequestTokenUtil.getRequestUser();
        //更新登陆用户openid信息
        if (requestToken != null) {
            employeeService.updateOpenidById(openid, requestToken);
        }
        System.out.println(openid);
        return ResponseDTO.succData(openid);
    }

    /**
     * 更新用户openid信息
     *
     * @return ResponseDTO
     */
    @GetMapping(value = "/updeteOpenid/{openid}")
    public ResponseDTO<Object> updeteOpenid(@PathVariable String openid) {

        if (StringUtils.isEmpty(openid)) {
            return ResponseDTO.wrap(ResponseCodeConst.ERROR_PARAM);
        }
        RequestTokenBO requestToken = SmartRequestTokenUtil.getRequestUser();
        //更新登陆用户openid信息
        if (requestToken != null) {
            employeeService.updateOpenidById(openid, requestToken);
        }
        System.out.println(openid);
        return ResponseDTO.succData(openid);
    }

}
