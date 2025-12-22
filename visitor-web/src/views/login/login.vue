<style lang="less">
@import './login.less';
</style>

<template>
  <div class="login">
    <div class="content">
      <header class="logo center">
        <img alt src="../../assets/images/logo2.png" height="50"/>
      </header>
      <div style="font-size: 30px; text-align: center; line-height: 60px;">校园访客预约</div>
      <div class="form-con">
        <login-form @on-success-valid="handleSubmit"></login-form>
      </div>
      <!-- <footer class="center footerDesc">SmartAdmin 由1024创新实验室强力驱动</footer> -->
      <div style="text-align: center;font-size: 18px; margin: 50px -100px;">
        Copyright © 2025湖北天天数链技术有限公司<br/>
        本系统软件源代码许可来源于
        <a href="https://open.tntlinking.com/communityTreaty" target="_blank"
           style="white-space: nowrap;">《天天开源软件（社区版）许可协议》</a>
      </div>
    </div>
  </div>
</template>
<script>
import LoginForm from './components/login-form';
import { mapActions } from 'vuex';
import $ from 'jquery';
import { lonWave, canvasParticle } from './canvas';
export default {
  name: 'login',
  props: {},
  components: {
    LoginForm
  },
  data () {
    return {}
  },
  computed: {},
  watch: {},
  filters: {},
  created () {},
  mounted () {
    this.$Spin.hide();
  },
  methods: {
    ...mapActions(['handleLogin']),
    // 提交
    handleSubmit (params) {
      this.handleLogin(params).then(res => {
        this.$router.push({
          name: this.$config.homeName
        });
      });
    }
  }
};
</script>
