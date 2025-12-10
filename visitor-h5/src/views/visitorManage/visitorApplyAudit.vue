<!-- home -->
<template>
  <div class="body_w">
    <van-nav-bar
      left-text="返回"
      left-arrow
      @click-left="$router.back()"
      title="访校申请审核"
    />
    <div class="main_w" style="width: 100%;height: 85%;overflow-y: auto;">  
      <van-form>
        <van-cell-group>
          <van-cell title="访客姓名">
            <template slot="default">
              <span>{{ details.name }}</span>
            </template>
          </van-cell>
          <van-cell title="所在地区">
            <template slot="default">
              <span>{{ details.area }}</span>
            </template>
          </van-cell>
          <van-cell title="手机号码">
            <template slot="default">
              <span>{{ details.phone }}</span>
            </template>
          </van-cell>
          <van-cell title="来访事由">
            <template slot="default">
              <span>{{ details.remark }}</span>
            </template>
          </van-cell>
          <!-- <van-cell title="行程码">
            <template slot="default">
              <van-image
                width="100"
                height="100"
                :src="itineraryCodeUrl"
                @click="sceneItineraryCodeUrlImg()"
              />
            </template>
          </van-cell>
          <van-cell title="健康码">
            <template slot="default">
              <van-image
                width="100"
                height="100"
                :src="healthCodeUrl"
                @click="sceneHealthCodeUrlImg()"
              />
            </template>
          </van-cell> -->
          <van-cell title="身份证">
            <template slot="default">
              <span>{{ details.idCardEncryption }}</span>
            </template>
          </van-cell>
          <van-cell title="公司">
            <template slot="default">
              <span>{{ details.companyName }}</span>
            </template>
          </van-cell>
          <!-- <van-cell title="情况说明">
            <template slot="default">
              <span>{{
                details.specialCase == 1
                  ? '本人未离开上海/抵达上海14天以上'
                  : '抵达上海不满14天'
              }}</span>
            </template>
          </van-cell>
          <van-cell title="是否发热">
            <template slot="default">
              <span>{{ details.isFr == 0 ? '否' : '是' }}</span>
            </template>
          </van-cell> -->
          <van-cell title="访问部门">
            <template slot="default">
              <span>{{ details.departmentName }}</span>
            </template>
          </van-cell>
          <van-cell title="访问教师">
            <template slot="default">
              <span>{{ details.employeeName }}</span>
            </template>
          </van-cell>
          <van-cell title="访校时间">
            <template slot="default">
              <span>{{ details.visitorsTime }}</span>
            </template>
          </van-cell>
        </van-cell-group>
      </van-form>

      <van-form @submit="onSubmit">
        <h2 class="van-doc-demo-block__title">审核结果</h2>
        <van-radio-group v-model="update.shzt" checked-color="#ee0a24">
          <van-cell-group>
            <van-cell title="审核通过" clickable @click="update.shzt = '1'">
              <template #right-icon>
                <van-radio name="1" />
              </template>
            </van-cell>
            <van-cell title="审核不通过" clickable @click="update.shzt = '-1'">
              <template #right-icon>
                <van-radio name="-1" />
              </template>
            </van-cell>
          </van-cell-group>
        </van-radio-group>
        <van-field
          v-model="update.shyj"
          rows="2"
          autosize
          label="审核意见"
          type="textarea"
          maxlength="100"
          placeholder="请输入审核意见"
          show-word-limit
        />
        <div style="margin: 16px">
          <van-button :disabled="isDisabled" round block color="linear-gradient(to right, #ff6034, #ee0a24)" native-type="submit">提交</van-button>
        </div>
      </van-form>
      
    </div>
  </div>
</template>

<script>
import { Notify } from 'vant';
import { visitorApi } from 'api/visitor';
import Vue from 'vue';
import { Cell, CellGroup, Dialog, Icon ,NavBar} from 'vant';
import { ImagePreview } from "vant"; // 引入Vant图片预览组件
import config from '@/config';

export const baseUrl = config.baseUrl.apiUrl;

Vue.use(Cell);
Vue.use(CellGroup);
Vue.use(Dialog);
Vue.use(Icon);
Vue.use(NavBar);
export default {
  name: 'applyResult',
  data() {
    return {
      isDisabled: false,
      successImgUrl:require("assets/success.png"),
      waitImgUrl:require("assets/wait.png"),
      failImgUrl:require("assets/fail.png"),
      isHidden: true,
      itineraryCodeUrl: '',
      healthCodeUrl: '',
      successHidden: true,
      failHidden: true,
      crossHidden: true,
      hiddenButton: false,
      backButton: true,
      details: {},
      id: '',
      openid: '',
      update:{
        id: null,
        shzt: '-1',
        shyj: ''
      }
    };
  },
  computed: {},
  created() {
  },
  mounted() {
    this.id = this.$route.params.id;
    this.update.id = this.$route.params.id;
    this.getResults();
  },
  methods: {
    async getResults() {
      let result = await visitorApi.getResultsById(this.id);
      this.details = result.data;
      this.itineraryCodeUrl = baseUrl + '/visitorsRecord/downloadImg/' + result.data.itineraryCode;
      this.healthCodeUrl = baseUrl + '/visitorsRecord/downloadImg/' + result.data.healthCode;
    },
    //表单提交
    onSubmit() {
      if('-1' == this.update.shzt){
        if(!this.update.shyj){
          Notify({ type: 'danger', message: '审核不通过请填写审核意见' });
          return false;
        }
      }
      this.save();
    },
    async save() {
      
      let res = await visitorApi.updateVisitorsRecord(this.update);
      this.isDisabled = true;
      if (res != null && res.success && res.code == 1) {
        Notify({ type: 'success', message: res.msg });
        this.$router.push('/visitorManage/visitorApplyPending')
      } else {
        this.isDisabled = false;
        Notify({ type: 'danger', message: res.msg });
      }
    },
    //预览图片
    sceneItineraryCodeUrlImg() {
      const list = [this.itineraryCodeUrl];
      ImagePreview({
        images:list, //需要预览的图片 URL 数组
        showIndex:true, //是否显示页码
        loop:false, //是否开启循环播放
        startPosition:0 //图片预览起始位置索引
      })
    },
    sceneHealthCodeUrlImg() {
      const list = [this.healthCodeUrl];
      ImagePreview({
        images:list, //需要预览的图片 URL 数组
        showIndex:true, //是否显示页码
        loop:false, //是否开启循环播放
        startPosition:0 //图片预览起始位置索引
      })
    }
  }
};
</script>
<style scoped>
.body_w{
  position:absolute;
  width: 100%;
  height: 100%;
  background: white;
}
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
.img_div_w{
  width: 100%;
  height: aoto;
  text-align: center;
}
.img_font_w{
  text-align: center;
  font-size: 1.2em;
  font-weight: bold;
  line-height: 1.5em;
  margin-bottom: 10px;
}
.img_font_w_2{
  text-align: center;
  font-size: 1.2em;
  line-height: 1.5em;
  margin-bottom: 10px;
}
.van-doc-demo-block__title {
    margin: 0;
    padding: 16px 16px 8px;
    color: rgba(69, 90, 100, 0.6);
    font-weight: normal;
    font-size: 14px;
    line-height: 16px;
}
</style>
