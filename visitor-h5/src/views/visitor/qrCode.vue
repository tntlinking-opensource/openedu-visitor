<!-- home -->
<template>
  <div>
    
  </div>
</template>

<script>
import Vue from 'vue';
import { weChatApi } from 'api/weChat/weChat';
import { employeeApi } from 'api/employee';
import cookie from '@/lib/cookie';
import { loginApi } from '@/api/login';
import { Toast } from 'vant';
import { Cell, CellGroup,Notify } from 'vant';

Vue.use(Toast);
Vue.use(Cell);
Vue.use(CellGroup);

function getUrlKey(name){//获取url 参数
  return decodeURIComponent((new RegExp('[?|&]'+name+'='+'([^&;]+?)(&|#|;|$)').exec(location.href)||[,""])[1].replace(/\+/g,'%20'))||null;
}
  
function getCodeApi(state){//获取code   
  let urlNow=encodeURIComponent(window.location.href);
  let scope='snsapi_base';    //snsapi_userinfo   //静默授权 用户无感知
  let appid='wx3dd35327d83d23c3';
  let url=`https://open.weixin.qq.com/connect/oauth2/authorize?appid=${appid}&redirect_uri=${urlNow}&response_type=code&scope=${scope}&state=${state}#wechat_redirect`;
  window.location.replace(url);
}
export default {
  name: 'index',
  
  data() {
    return {
      applyImgUrl:require("assets/icon_w_apply.png"),
      listImgUrl:require("assets/icon_w_list.png"),
      loginImgUrl:require("assets/icon_w_login.png"),
      //vconsole: null,
      openid:'',
      accessType: '',
      count: ''
    };
  },
  created(){
    Toast.loading({
      forbidClick: true,
      duration: 0,
      message: '正在进入访客系统，请稍候',
    });
    
    //localStorage.setItem('openid', '111111231111111112');
    //localStorage.setItem('openid', '12311112321');
    //this.vconsole = new VConsole();

    //设置访问方式为扫码登陆
    localStorage.setItem('accessType', 'qrCode');


    this.openid = localStorage.getItem("openid");
    
    if(!this.openid||this.openid == "null"){//若缓存中的openid为空 重新获取openid
      let code=getUrlKey("code");//获取url参数code
      //let code = 111;
      if(code){ //拿到code， code传递给后台接口换取opend
        this.code = code;
        this.getOpenId();
      }else{
        let state = new  Date().getTime();
        getCodeApi(state);
      }
    }
    //跳转到访客页面
    this.$router.push('/visitor/index')
    Toast.clear();
	},
  computed: {},
  mounted() {
  },
  methods: {
    async getOpenId() {
      let res = await weChatApi.getOpenId(this.code);
      this.openid = res.data;
      localStorage.setItem('openid', this.openid);
      if(!this.openid){
        Notify({ type: 'danger', message: "授权失败，请先关注微房校公众号" });
      }else{
        Notify({ type: 'success', message: "授权成功" });
      }
    }
  }
};
</script>
<style scoped>
.bottom-button {
  width: 200px;
  height: 40px;
}
.file_title_w span {
  background: #3388ff;
  color: white;
  display: block;
  width: 6em;
  height: 2em;
  line-height: 2em;
  text-align: center;
  border-radius: 1em 1em 0 0;
  margin-left: 5%;
}
.seller .timeClass {
  color: #333;
}
.van-doc-demo-block__title {
    margin: 0;
    padding: 16px 16px 8px;
    color: rgba(69, 90, 100, 0.6);
    font-weight: normal;
    font-size: 14px;
    line-height: 16px;
}
.van-grid-item__icon{
  color: #ee0a24!important;
}
</style>
