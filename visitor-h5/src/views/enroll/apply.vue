<!-- home -->
<template>
  <div>
    <van-nav-bar title="填写报名信息"/>

    <van-form @submit="onSubmit">

      <div class="file_title_w"><span>学生信息</span></div>
      <van-field
        v-model="student.name"
        clearable
        required
        label="学生姓名"
        placeholder="学生姓名"
        maxlength="10"
        :rules="[{ required: true, message: '请填写学生姓名' }]"
      />
      <van-field required label="性别">
        <template #input>
          <van-radio-group v-model="student.gender" direction="horizontal">
            <van-radio name="1">男</van-radio>
            <van-radio name="2">女</van-radio>
          </van-radio-group>
        </template>
      </van-field>
      
      <van-field
        v-model ="birthdayValue"
        is-link
        required
        readonly
        label="出生年月日"
        placeholder="请选择出生年月日"
        :rules="[{ required: true, message: '请选择出生年月' }]"
        @click="showDatetimePicker = true"
      />
      <van-popup v-model="showDatetimePicker" position="bottom">
        <van-datetime-picker
          v-model="birthday"
          type="date"
          title="选择年月日"
          :min-date="minDate"
          :max-date="maxDate"
          @cancel="showDatetimePicker = false"
          @confirm="confirmPickerDatetimePicker(this)"
        />
      </van-popup>
      
      <van-field
        v-model="student.nation"
        clearable
        required
        label="民族"
        placeholder="民族"
         maxlength="10"
        :rules="[{ required: true, message: '请填写民族信息' }]"
      />
      <van-field v-model="student.idCard" 
        clearable 
        maxlength="18" 
        label="新生身份证号" 
        required
        placeholder="请输入身份证号" 
        :rules="[
          { required: true, message: '请输入身份证号' },
          { pattern, message: '身份证号格式有误' }
        ]"
      />
      <van-field
        v-model="student.koseki"
        clearable
        rows="1"
        autosize
        required
        label="户籍所在地"
        type="textarea"
        maxlength="100"
        placeholder="请输入户籍所在地详细地址"
        show-word-limit
        :rules="[{ required: true, message: '请输入户籍所在地详细地址' }]"
      />
      <van-field
        v-model="student.address"
        clearable
        rows="2"
        autosize
        label="实际居住地"
        type="textarea"
        required
        maxlength="100"
        placeholder="请输入实际居住地详细地址（包含门栋号）"
        show-word-limit
        :rules="[{ required: true, message: '请输入实际居住地详细地址（包含门栋号）' }]"
      />

      <div class="file_title_w"><span>家长信息</span></div>
      <van-field label="" required value="请至少填写一个家长的联系方式" readonly />
      <van-tabs v-model="activeName">
        <van-tab title="父亲" name="a">
          <van-field v-model="student.nameFather" clearable label="姓名"  maxlength="10" placeholder="请输入姓名" />
          <van-field v-model="student.workUnitFather" clearable label="工作单位"  maxlength="100" placeholder="请输入工作单位" />
          <van-field
            v-model="student.workAddressFather"
            clearable
            rows="2"
            autosize
            label="工作单位详细地址"
            type="textarea"
            maxlength="100"
            placeholder="请输入工作单位详细地址"
            show-word-limit
          />
          <!-- <van-field v-model="student.workTelephoneFather" clearable type="number"  maxlength="20" label="单位电话" placeholder="请输入单位电话" />
          <van-field v-model="student.homePhoneFather" clearable type="number"  maxlength="20" label="住宅电话" placeholder="请输入住宅电话" /> -->
          <van-field v-model="student.phoneFather" clearable type="number"  maxlength="20" label="移动电话" placeholder="请输入移动电话" />
        </van-tab>
        <van-tab title="母亲" name="b">
          <van-field v-model="student.nameMather" clearable label="姓名"  maxlength="10" placeholder="请输入姓名" />
          <van-field v-model="student.workUnitMather" clearable label="工作单位"  maxlength="100" placeholder="请输入工作单位" />
          <van-field
            v-model="student.workAddressMather"
            clearable
            rows="2"
            autosize
            label="工作单位详细地址"
            type="textarea"
            maxlength="100"
            placeholder="请输入工作单位详细地址"
            show-word-limit
          />
          <!-- <van-field v-model="student.workTelephoneMather" clearable type="number"  maxlength="20" label="单位电话" placeholder="请输入单位电话" />
          <van-field v-model="student.homePhoneMather" clearable type="number"  maxlength="20" label="住宅电话" placeholder="请输入住宅电话" /> -->
          <van-field v-model="student.phoneMather" clearable type="number"  maxlength="20" label="移动电话" placeholder="请输入移动电话" />
        </van-tab>
      </van-tabs>

      <div class="file_title_w"><span>社区信息</span></div>
      <van-field
        v-model="communityValue"
        is-link
        readonly
        required
        label="社区"
        placeholder="请选择所在社区"
        @click="showCommunity = true"
        :rules="[{ required: true, message: '请选择所在社区' }]"
      />
      <van-popup v-model="showCommunity" round position="bottom">
        <van-cascader
          v-model="communityValue"
          title="请选择所在小区"
          :options="communitys"
          @close="showCommunity = false"
          @finish="onFinish"
        />
      </van-popup>
      <van-popup v-model="showCommunity" round position="bottom">
        <van-cascader
          v-model="communityId"
          title="请选择所在社区"
          :options="communitys"
          @close="showCommunity = false"
          @finish="onFinish"
        />
      </van-popup>

      <van-field 
        v-model="student.householdHead" 
        clearable  
        required
        maxlength="50" 
        label="房产证户主姓名" 
        placeholder="请输入房产证户主姓名" 
        :rules="[{ required: true, message: '请输入房产证户主姓名' }]"
      />
      <van-field
        v-model="student.relation"
        clearable
        rows="2"
        autosize
        required
        label="房产证户主与新生的关系"
        type="textarea"
        maxlength="100"
        placeholder="请输入房产证户主与新生的关系"
        show-word-limit
        :rules="[{ required: true, message: '请输入房产证户主与新生的关系' }]"
      />
      <van-field
        v-model="student.premisesPermitCode"
        clearable
        rows="2"
        autosize
        label="房产证号"
        type="textarea"
        maxlength="100"
        placeholder="请输入房产证号（或产权证号、合同备案号等证件）"
        show-word-limit
      />

      <div class="file_title_w"><span>其他</span></div>
      <van-field v-model="student.kindergarten" clearable  maxlength="50" label="幼儿园名称" placeholder="请输入幼儿园名称" />      
      <van-field
        v-model="student.feature"
        clearable
        rows="2"
        autosize
        label="新生特点"
        type="textarea"
        maxlength="100"
        placeholder="新生特点"
        show-word-limit
      />
      <van-field
        v-model="student.remark"
        clearable
        rows="2"
        autosize
        label="备注"
        type="textarea"
        maxlength="100"
        placeholder="备注信息"
        show-word-limit
      />

      <div style="margin: 16px;">
        <van-button round block type="info" native-type="submit">提交</van-button>
      </div>
    </van-form>
  </div>
</template>

<script>

import { enrollApi } from 'api/enroll';
import { Notify } from 'vant';

export default {
  name: 'enrollApply',
  data() {
    return {
      birthdayValue: '',
      birthday: new Date(),//生日
      communityValue: '',
      communityId: '',
      showDatetimePicker: false,//是否显示日期选择
      className: '',
      activeName: 'a',
      showCommunity: false,//显示选择社区弹框
      minDate: new Date(1900, 0, 1),
      maxDate: new Date(2100, 10, 1),
      pattern: /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/,
      student: {
        name: '',//姓名
        gender: '1',//性别
        birthdayValue: '',//生日
        nation: '',//民族
        koseki: '',//户籍所在地详细地址
        address: '',//实际居住地详细地址（包含门栋号）
        plotid: '', //小区
        householdHead: '',//房产证户主姓名
        relation: '',//与新生的关系
        premisesPermitCode: '',//房产证号
        kindergarten: '',//幼儿园
        idCard: '',//身份证号
        feature: '',//新生特点
        remark: '',//备注
        nameFather:'',//姓名 -----父亲
        workUnitFather: '',//工作单位
        workAddressFather: '',//工作单位详细地址
        workTelephoneFather: '',//单位电话
        homePhoneFather: '',//住宅电话
        phoneFather: '',//手机
        nameMather:'',//姓名 -----母亲
        workUnitMather: '',//工作单位
        workAddressMather: '',//工作单位详细地址
        workTelephoneMather: '',//单位电话
        homePhoneMather: '',//住宅电话
        phoneMather: '',//手机
      },
      communitys: [],
    };
  },

  computed: {},

  mounted() {
    this.getCommunityPlotCascades();
  },
  methods: {

    // 社区选择 全部选项选择完毕后，会触发 finish 事件 
    onFinish({ selectedOptions }) {
      this.showCommunity = false;
      this.communityValue = selectedOptions.map((option) => option.text).join('/');
      this.student.plotid = this.communityId;
    },
    // 确认选择的时间 日期插件
    confirmPickerDatetimePicker () {
      this.birthdayValue = this.timeFormat(this.birthday)
      this.student.birthdayValue = this.timeFormat2(this.birthday)
      this.showDatetimePicker = false
    },
    timeFormat(time) { // 时间格式化 2019-09-08
      let year = time.getFullYear();
      let month = time.getMonth() + 1;
      let day = time.getDate();
      return year + '年' + month + '月' + day + '日'
    },
    timeFormat2(time) { // 时间格式化 2019-09-08
      let year = time.getFullYear();
      let month = time.getMonth() + 1;
      let day = time.getDate();
      return year + '-' + month + '-' + day
    },
    validatorIdCard(val) {
      return /1\d{10}/.test(val);
    },
    //表单提交
    onSubmit (values){
      //验证是否填写了联系方式
     
      if( this.student.phoneFather.length==0 && this.student.phoneMather.length==0){
        Notify({ type: 'danger', message:"请至少填写一个家长的联系方式"});
        return false;
      }else{
        this.save(values);
      }

    },
    async save(values) {
        //this.$router.push('/enroll/success')
        
        let res = await enrollApi.addStudent(this.student);
        if(res != null && res.success && res.code == 1){
          Notify({ type: 'success', message: res.msg });
          this.resetForm();
          
          //跳转到成功页面
          this.$router.push('/enroll/success')
        }else{
          Notify({ type: 'danger', message: res.msg });
        }
        
    },
    async getCommunityPlotCascades() {
      let res = await enrollApi.getCommunityPlotCascades();
      this.communitys = res;
    },
    //重置表单
    resetForm() {
      this.birthdayValue = '',
      this.birthday = new Date(),//生日
      this.activeName = 'a',
      this.student = {
        name: '',//姓名
        gender: '1',//性别
        birthdayValue: '',//生日
        nation: '',//民族
        koseki: '',//户籍所在地详细地址
        address: '',//实际居住地详细地址（包含门栋号）
        plotid: '', //小区
        householdHead: '',//房产证户主姓名
        relation: '',//与新生的关系
        premisesPermitCode: '',//房产证号
        kindergarten: '',//幼儿园
        idCard: '',//身份证号
        feature: '',//新生特点
        remark: '',//备注
        nameFather:'',//姓名 -----父亲
        workUnitFather: '',//工作单位
        workAddressFather: '',//工作单位详细地址
        workTelephoneFather: '',//单位电话
        homePhoneFather: '',//住宅电话
        phoneFather: '',//手机
        nameMather:'',//姓名 -----母亲
        workUnitMather: '',//工作单位
        workAddressMather: '',//工作单位详细地址
        workTelephoneMather: '',//单位电话
        homePhoneMather: '',//住宅电话
        phoneMather: '',//手机
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
</style>
