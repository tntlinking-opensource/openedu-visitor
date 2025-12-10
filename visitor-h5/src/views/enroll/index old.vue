<!-- home -->
<template>
  <div>
    <van-nav-bar title="新生报名"/>

    <van-empty v-if="!isFillIn" image="search" description="通告：6月10日00:00-6月15日24:00开放线上登记，请您届时关注，并如实填写相关信息。" >
    </van-empty>
    <!-- <van-button size="large" color="linear-gradient(to right, #ff6034, #ee0a24)">填写报名信息</van-button> -->
    <div v-if="isFillIn" class="w_div">
      <div class="w_title">2021 年秋季江夏区文化大道小学一年级新生入学公告</div>
      <div class="w_pa_l">
        各位家长（监护人）：
        <br>根据《市教育局关于进一步规范 2021 年义务教育阶段新生入学 管理工作的通知》等文件精神，为做好江夏区文化大道小学 2021--2022 学年一年级新生招生入学工作，公告如下：
        <br><strong>&nbsp;&nbsp;&nbsp;&nbsp;一、年龄范围</strong>
        <br>2015 年 8 月 31 日（含 8 月 31 日）前出生的适龄儿童方可登记 入学。

        <br><strong>&nbsp;&nbsp;&nbsp;&nbsp;二、招生服务范围</strong>
        <br>汤逊湖壹号小区、菩提苑小区、福志友缘小区、金悦府小区、联 投龙湾一期、联投龙湾二期、联投龙湾三期。

        <br><strong>&nbsp;&nbsp;&nbsp;&nbsp;三、登记时间及地点</strong>
        <br>登记时间：2021 年 6 月 17 日—20 日 
        <br>登记地点：大花岭小学体育馆(南门）

        <br><strong>&nbsp;&nbsp;&nbsp;&nbsp;四、招生办法</strong>
        <br>1.登记条件：按照《义务教育法》规定：地方各级人民政府应当 保障适龄儿童、少年在户籍所在地学校就近入学”的规定，户籍和住 房一致的，安排对口入学；户籍和住房不一致的，在学校登记，视学 位情况安排入学。
        <br>2.提交资料：
        <br>（1）户口本：原件及户口本首页、户主页和适龄儿童页的复印件。
        <br>（2）儿童预防接种手册及医学出生证明的原件和复印件。
        <br>（3）房产证或购房合同：原件及房产证（购房合同）一二页（须 注明持有人姓名、房产名称和门牌号）、手印页的复印件。购房合同 需购房发票原件及复印件。
        <br>说明：适龄儿童随父（母）与祖父母（外祖父母）长期居住在一 起，同时适龄儿童父（母）为独生子女并且适龄儿童父母无住房的， 需提供父（母）独生子女证和房管局出具的父母双方无房证明材料原 件及复印件。
        <br>（4）入住证明:户主为适龄儿童父母的 2021 年 4 月、5 月的水电 气网之一的缴费凭证（凭证必须是水电气网相关部门出具的正式机打 发票且有公章）。
        <br>3.招生程序
        <br>（1）时间安排：因疫情关系，为避免人群聚集，新生报名实行 分对口小区到指定地点登记，具体安排如下：
        <br>
        <table>
          <tr>
            <td width="25%"></td>
            <td width="25%">上 午<br>8:30--11:30</td>
            <td width="25%">下 午<br>2:00--5:00</td>
            <td width="25%">备注</td>
          </tr>
          <tr>
            <td>6 月 17 日<br>（周四）</td>
            <td>联投龙湾 1 期</td>
            <td>联投龙湾 2 期</td>
            <td rowspan="5">请家长们（监护 人）严格按照规 定的时间节点到校登记。无特 殊原因，一律不 接受任何家长 提前或延期办 理。</td>
          </tr>
          <tr>
            <td>6 月 18 日<br>（周五）</td>
            <td>菩提苑</td>
            <td>汤逊湖壹号</td>
          </tr>
          <tr>
            <td>6 月 19 日<br>（周六）</td>
            <td>联投龙湾 3 期</td>
            <td>汤逊湖壹号、菩提 苑、福志友缘补登</td>
          </tr>
          <tr>
            <td>6 月 20 日<br>（周日）</td>
            <td>联投龙湾 1 期 2 期 3 期补登</td>
            <td></td>
          </tr>
        </table>
        <br>（2）登记流程：
        <br>①家长（监护人）在规定的时间内，到指定地点拿号办理登记。
        <br>②扫码，线上填写相关信息，确认提交。
        <br>③签订《诚信承诺书》，提交所需资料的原件、复印件，接受学 校审核，登记程序结束。
        <br>（3）学校查验核实：6 月 21 日—6 月 22 日，学校查验、核实、 确认家长所提交的证件符合招生条件后，初步拟定入学名单。
        <br>（4）教育局审核确认：6 月 23 日，学校将初步拟定的入学名单 交教育局，审查核对确认。
        <br>（5）入学名单公示：6 月 24 日--6 月 30 日入学名单公示，通过 线上平台推送通知（请家长及时关注）。
        <br>（6）发放入学通知：7 月 3 日家长（监护人）持身份证或户口 本等有效证件到大花岭小学（体育馆）领取入学通知书。
        <br>（7）报到注册及入学教育：8 月 28 日（周六）新生凭《义务教 育入学通知书》到大桥中学（过渡点）报到注册及参加入学教育。
        
        <br><strong>&nbsp;&nbsp;&nbsp;&nbsp;五、温馨提示</strong>
        <br>1.本公告中房产指普通住宅，不含商业用途或经营用途的写字楼、商铺、厂房等。房产所有人为适龄儿童父母，未交付使用或已交付但 未入住的房产，不作为对口就近入学的依据。
        <br>2.线下审核报名时，需提供无房证明材料的适龄儿童父母，请提 前关注微信公众号“武汉住保房管”，按“网上办事大厅”—“个人 房查”（先注册）的路径查询，熟悉操作，提前打印查询结果，现场 提交房查情况。
        <br>3.为了防疫安全，请佩戴好口罩、自己带黑色签字笔在规定时间 前往登记，为提高线下报名审核效率，请家长整理齐全相关资料，做 好准备。
        <br>4.凡因学生家长（监护人）不能在规定的时间到指定的地点报名 登记而影响学生入学，或因年龄、户口薄等证件造假而导致学生不能 及时办理学籍的，后果由家长（监护人）自负。
        <br><strong>请特别关注</strong>：由于疫情原因，学校交付使用时间延后，为保证师 生身体健康，新学期开学将在大桥中学过渡，待新校达到安全交付使 用标准时，再进行整体搬迁。未尽事宜，如有疑问，可在工作日咨询。
        <br>咨询电话：15827634969
      </div>
      <div class="w_pa_r">
        江夏区文化大道小学
        <br>2021 年 6 月 1 日
      </div>
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
    height: 30px;
    line-height: 30px;
    font-weight: bold;
    text-align: center;
    margin:  0 auto;

  }
  .w_pa_l{
    width: 96%;
    height: auto;
    line-height: 30px;
    text-align: left;
    margin:  0 auto;
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
