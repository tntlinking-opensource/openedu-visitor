<!-- home -->
<template>
  <div style="padding: 0.4rem">
    <van-form @submit="onSubmit">
      <div style="text-align: center; margin-top: 100px;">
        <img src="../../assets/logo2.png" height="50"/>
      </div>
      <van-row type="flex" justify="center">
        <div style="text-align: center; font-size: 30px; line-height: 80px; letter-spacing: 5px;">访客系统</div>
      </van-row>
      <van-cell-group>
        <van-field
          v-model="formData.loginName"
          clearable
          left-icon="user-circle-o"
          @field-icon-size
          right-icon="question-o"
          placeholder="请输入用户名"
          @click-right-icon="$toast('请输入用户名')"
        />

        <van-field
          v-model="formData.loginPwd"
          type="password"
          left-icon="bag-o"
          placeholder="请输入密码"
        />
      </van-cell-group>
      <div style="margin: 16px;">
        <van-button block type="info" native-type="submit">
          登录
        </van-button>
      </div>
      <div style="text-align: center; line-height: 50px; margin-top: -16px; color: #1989fa;" @click="gotoVisitor">
        游客登录
      </div>
    </van-form>

    <div style="text-align: center; font-size: 20px; color: #fff; margin-top: 60px;">
      <a href="https://open.tntlinking.com/communityTreaty" target="_blank"
         style="white-space: nowrap;">本系统软件源代码来源于天天开源的许可</a>
    </div>
  </div>
</template>

<script>
import { Notify } from 'vant';
import { loginApi } from '@/api/login';
import cookie from '@/lib/cookie';

export default {
  data() {
    return {
      formData: {
        loginName: '',
        loginPwd: ''
      }
    };
  },
  mounted() {
  },
  methods: {
    // 提交登录表单
    async onSubmit() {
      if (!this.formData.loginName) {
        Notify({ type: 'danger', message: '用户名不能为空' });
        return false;
      }
      if (!this.formData.loginPwd) {
        Notify({ type: 'danger', message: '密码不能为空' });
        return false;
      }
      this.$smart.loading();
      try {
        const res = await loginApi.login(this.formData);
        const loginInfo = res.data;
        localStorage.setItem('openid', loginInfo.id);
        this.$store.commit('user/updateSession', loginInfo);
        cookie.setToken(loginInfo.xaccessToken);
        this.$toast.success('登录成功');
        let login_back_url = localStorage.getItem('login_back_url');
        // console.log(login_back_url, loginInfo);
        if (login_back_url) {
          localStorage.removeItem('login_back_url');
          location.href = login_back_url;
        } else {
          this.$router.replace('/dashboard/visitorManage');
          // this.$router.replace('/contact-company');
        }
      } catch (e) {
        this.$smartSentry.captureException(e);
        await this.getVerificationCode();
      } finally {
        this.$smart.loadingClear();
      }
    },
    gotoVisitor() {
      this.$router.replace('/visitor/index');
    }
  }
};
</script>
<style lang="scss" scoped>
</style>
