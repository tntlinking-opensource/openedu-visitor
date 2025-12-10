<!-- home -->
<template>
  <div>
    <van-nav-bar title="新生报名"/>

    <van-empty v-if="!isFillIn" image="search" description="通告：6月10日00:00-6月15日24:00开放线上登记，请您届时关注，并如实填写相关信息。" >
    </van-empty>
    <!-- <van-button size="large" color="linear-gradient(to right, #ff6034, #ee0a24)">填写报名信息</van-button> -->
    <div v-if="isFillIn" class="w_div">
      <div class="w_title">2021年秋季江夏区文化大道小学一年级新生信息登记填写须知</div>
      <div class="w_pa_l">
        尊敬的家长（监护人）：
        <br><span v-html="'\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0'"></span>您好！
        <br><span v-html="'\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0'"></span>为有效落实新学期一年级新生招生政策，保证登记工作的严肃性，请认真阅读以下要求，再准确填写。
        <br><span v-html="'\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0'"></span>1.知晓文化大道小学2021年秋一年级新生招生公告的内容。
        <br><span v-html="'\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0'"></span>2.保证线上所填写的各项信息真实无误。如信息虚假，影响了孩子入学，后果自负。
        <br><span v-html="'\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0'"></span>3.保证自己的孩子是2021年的新生，从未在任何学校取得过小学学籍。
        <br><span v-html="'\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0'"></span>4.填写完成后请仔细核对原件，反复检查，确认信息无误后再提交。
        <br><span v-html="'\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0'"></span>感谢您的支持！
        
      </div>
      
      <div class="div_line"></div>
      <van-checkbox-group v-model="result">
        <van-cell-group>
          <van-cell
            v-for="(item, index) in list"
            clickable
            :key="item"
            :title="`我已阅读报名须知`"
            @click="toggle(index)"
          >
            <template #right-icon>
              <van-checkbox :name="item" v-model="isDisabled" ref="checkboxes" />
            </template>
          </van-cell>
        </van-cell-group>
      </van-checkbox-group>
      
      <van-button :disabled="isDisabled"  to="/enroll/apply" type="primary" color="linear-gradient(to right, #ff6034, #ee0a24)" block>填写报名信息</van-button>
      <div class="div_line"></div>
      <van-divider />
    </div>
  </div>
</template>

<script>
import { loginApi } from 'api/login';
import cookie from '@/lib/cookie';
import { userApi } from 'api/user';

export default {
  name: 'Mine',
  data() {
    return {
      isFillIn: true,//是否允许填写
      isDisabled: true,
      list: ['a'],
      result: []
    };
  },

  computed: {},

  mounted() {
  },

  methods: {
    toggle(index) {
      this.$refs.checkboxes[index].toggle();
      if(this.result.length == 1){
        this.isDisabled = true;
      }else{
        this.isDisabled = false;
      }
    },
    // 清空缓存
    clearCache() {
      this.$toast('清空了!!');
    },
    // 更新权限
    async forceUpdatePrivilege() {
      this.$smart.loading();
      try {
        const res = await userApi.getSession();
        const loginInfo = res.data;
        this.$store.commit('user/updateSession', loginInfo);
        this.$toast('已成功更新权限!');
      } catch (e) {
        this.$smartSentry.captureException(e);
      } finally {
        this.$smart.loadingClear();
      }
    },
    // 退出
    async logout() {
      this.$smart.loading();
      try {
        await loginApi.logout(cookie.getToken());
      } catch (e) {
        this.$smartSentry.captureException(e);
      } finally {
        cookie.clearToken();
        this.$smart.loadingClear();
        this.$router.replace('/login');
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
  .w_div{
    position: absolute;
    width: 100%;
    height: 90%;
    background-color: white;
    overflow-y: auto;
  }
  .w_title{
    width: 96%;
    line-height: 30px;
    font-weight: bold;
    text-align: center;
    margin:  0 auto;
    font-size: 16px;
  }
  .w_pa_l{
    width: 96%;
    height: auto;
    line-height: 30px;
    text-align: left;
    margin:  0 auto;
    font-size: 15px;
  }
  .w_pa_r{
    width: 96%;
    height: auto;
    line-height: 30px;
    text-align: right;
    margin:  0 auto;
  }
  .w_line{
    width: 100%;
    height: 40px;
  }
  .w_div table{
    border-collapse: collapse;
    width: 100%;
    text-align: center;
  }
  .w_div td{
    border: 1px solid #000;
  }
  .div_line{
    width: 100%;
    min-height: 60px;
  }
</style>
