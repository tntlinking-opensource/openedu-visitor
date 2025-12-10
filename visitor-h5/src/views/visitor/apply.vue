<!-- home -->
<template>
  <div class="body_w">
    <van-nav-bar
      left-text="返回"
      left-arrow
      @click-left="$router.back()"
      title="填写申请访校信息"
    />

    <van-form @submit="onSubmit" style="width: 100%;height: 85%;overflow-y: auto;">
      <!-- <div class="file_title_w"><span>申请访校</span></div> -->
      <van-field
        v-model="parent.name"
        clearable
        required
        label="访客姓名"
        placeholder="访客姓名"
        maxlength="10"
        :rules="[{ required: true, message: '请填写访客姓名' }]"
      />
      <van-field
        v-model="parent.idCard"
        clearable
        maxlength="18"
        label="身份证号"
        required
        placeholder="请输入身份证号"
        :rules="[
          { required: true, message: '请输入身份证号' },
          { pattern, message: '身份证号格式有误' }
        ]"
      />
      <van-field
        v-model="parent.area"
        is-link
        readonly
        required
        label="所在地区"
        placeholder="请选择所在地区"
        @click="showArea = true"
        :rules="[{ required: true, message: '请选择所在地区' }]"
      />
      <van-popup v-model="showArea" round position="bottom">
        <van-area
          title="省/市/区县"
          @confirm="confirmArea"
          @cancel="showArea = false"
          :area-list="areaList"
        />
      </van-popup>
      <van-field
        v-model="parent.companyName"
        clearable
        required
        label="所属单位"
        placeholder="所属单位"
        maxlength="100"
        :rules="[{ required: true, message: '请填写所属单位' }]"
      />
      <van-field
        v-model="parent.phone"
        clearable
        maxlength="11"
        label="手机号码"
        required
        placeholder="请输入手机号码"
        :rules="[
          { required: true, message: '请输入手机号码' },
          { pattern: /^\d{11}$/, message: '手机号码格式有误' }
        ]"
      />
      <van-field
        v-model="parent.remark"
        clearable
        rows="2"
        autosize
        label="来访事由"
        type="textarea"
        maxlength="100"
        placeholder="请输入来访事由"
        :rules="[
          { required: true, message: '请输入来访事由' }
        ]"
        show-word-limit
      />
      <!-- <van-field required label="健康码">
        <template #input>
          <van-uploader v-model="itineraryCodeFileList" :after-read="uploadHealthCodeFile" :max-count="1" />
        </template>
      </van-field>
      <van-field required label="行程码">
        <template #input>
          <van-uploader v-model="healthCodeFileList" :after-read="uploadItineraryCodeFile" :max-count="1" />
        </template>
      </van-field>
      <van-field required label="情况说明">
        <template #input>
          <van-radio-group v-model="parent.specialCase" direction="horizontal">
            <van-radio checked-color="#ee0a24" name="1">未离开上海/抵达上海14天以上</van-radio>
            <van-radio checked-color="#ee0a24" name="2">抵达上海不满14天</van-radio>
          </van-radio-group>
        </template>
      </van-field>
      <van-field required label="是否发热">
        <template #input>
          <van-radio-group v-model="parent.isFr" direction="horizontal">
            <van-radio checked-color="#ee0a24" name="1">是</van-radio>
            <van-radio checked-color="#ee0a24" name="0">否</van-radio>
          </van-radio-group>
        </template>
      </van-field> -->
      <van-field
        v-model="visitorsTimeValue"
        is-link
        required
        readonly
        label="访校时间"
        placeholder="请选择访校时间"
        :rules="[{ required: true, message: '请选择访校时间' }]"
        @click="showDatetimePicker = true"
      />
      <van-popup v-model="showDatetimePicker" position="bottom">
        <van-datetime-picker
          v-model="visitorsTime"
          type="datetime"
          title="选择访校时间"
          :min-date="minDate"
          :max-date="maxDate"
          @cancel="showDatetimePicker = false"
          @confirm="confirmPickerDatetimePicker(this)"
        />
      </van-popup>

      <van-field
        v-model="departmentValue"
        is-link
        readonly
        required
        label="访问部门及人员"
        placeholder="请选择访问部门及人员"
        @click="showDepartment = true"
        :rules="[{ required: true, message: '请选择访问部门及人员' }]"
      />
      <van-popup v-model="showDepartment" round position="bottom">
        <van-cascader
          v-model="parent.employeeId"
          title="请选择老师"
          :options="departments"
          @close="showDepartment = false"
          @finish="onFinishDepartment"
        />
      </van-popup>
      <van-popup v-model="showDepartment" round position="bottom">
        <van-cascader
          v-model="parent.departmentId"
          title="请选择部门"
          :options="departments"
          @close="showDepartment = false"
          @finish="onFinishDepartment"
        />
      </van-popup>


      <van-checkbox-group v-model="result">
        <van-cell-group>
          <van-cell
            v-for="(item, index) in list"
            clickable
            :key="item"
            :title="`本人承诺以上提供的资料真实准确，若有不实，本人愿意承担由此引起的一切后果及法律责任。`"
            @click="toggle(index)"
          >
            <template #right-icon>
              <van-checkbox :name="item" checked-color="#ee0a24" v-model="isDisabled" ref="checkboxes"/>
            </template>
          </van-cell>
        </van-cell-group>
      </van-checkbox-group>

      <div style="margin: 16px">
        <van-button :disabled="isDisabled" round block color="linear-gradient(to right, #ff6034, #ee0a24)"
                    native-type="submit">提交
        </van-button>
      </div>
      <div style="margin: 16px">
        <van-button round block type="default" @click="$router.back()">取消</van-button>
      </div>
    </van-form>
  </div>
</template>

<script>
import { areaList } from '@vant/area-data';
import { Notify } from 'vant';
import { departmentApi } from 'api/department';
import { visitorApi } from 'api/visitor';
import { provinceApi } from 'api/province';

export default {
  name: 'apply',
  data() {
    return {
      areaList,//省市区数据
      list: ['a'],
      itineraryCodeFileList: [],
      healthCodeFileList: [],
      result: [],
      isDisabled: true,
      visitorsTimeValue: '', // 访校时间
      visitorsTime: new Date(), // 日期绑定
      showArea: false,//是否显示所在地区
      showDatetimePicker: false, //是否显示日期选择
      showDepartment: false,
      disabled: false,
      departmentValue: '', //部门名称
      ids: '', // 把部门id和教师id拼接在一起
      pids: '', // 把省份id 和 城市 id 拼接在一起
      minDate: new Date(),
      maxDate: new Date(2100, 10, 1),
      accessType: '',//访问类型 tencent 公众号 qrCode 扫码
      // pattern: /^(13[0-9]|14[01456879]|15[0-35-9]|16[2567]|17[0-8]|18[0-9]|19[0-35-9])\d{8}$/,//手机号验证
      pattern: /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/,// 身份证验证
      parent: {
        name: '', //姓名
        idCard: '', //身份证号
        companyName: '', //公司
        phone: '', //电话
        area: '',//所在地区
        itineraryCode: '',//行程码
        healthCode: '',//健康码
        departmentId: '', // 部门
        employeeId: '', // 老师
        specialCase: '1', //情况说明
        isFr: '0', //是否发热
        remark: '', //来访事由
        visitorsTime: '', //访校时间
        openid: ''
      },
      departments: [], // 部门列表
      idValues: [], // 存放拆分的部门(省份)id和教师(城市)id
      provinces: []
    };
  },

  computed: {},
  created() {
    this.accessType = localStorage.getItem('accessType');
    this.parent.openid = localStorage.getItem('openid');
    if (!this.parent.openid || this.parent.openid == 'null') {
      //返回首页
      this.$router.push('/visitor/index');
    }
  },
  mounted() {
    this.getDepartmentTeacherCascade();
  },
  methods: {
    //部门选择
    async getDepartmentTeacherCascade() {
      let result = await departmentApi.getDepartmentTeacherCascades(this.accessType);
      this.departments = result;
      if (this.accessType == 'qrCode' && this.departments.length != 0) {

        this.ids = this.departments[0].value + '/' + this.departments[0].children[0].value;
        this.idValues = this.ids.split('/');
        this.parent.departmentId = this.idValues[0];
        this.parent.employeeId = this.idValues[1];
        this.departmentValue = this.departments[0].text + '/' + this.departments[0].children[0].text;
        this.idValues = [];
      }

    },
    // 部门选择 全部选项选择完毕后，会触发 finish 事件
    onFinishDepartment({ selectedOptions }) {
      this.showDepartment = false;
      this.departmentValue = selectedOptions
        .map(option => option.text)
        .join('/');
      this.ids = selectedOptions.map(option => option.value).join('/');
      this.idValues = this.ids.split('/');
      this.parent.departmentId = this.idValues[0];
      this.parent.employeeId = this.idValues[1];
      this.idValues = [];
    },
    //确认所在地区
    confirmArea(areaArr) {
      this.showArea = false;
      let areaValue = '';
      if (areaArr != null && areaArr.length > 0) {
        areaArr.forEach(item => {
          areaValue += item.name + '/';
        });
      }
      areaValue = areaValue.substring(0, areaValue.length - 1);
      this.parent.area = areaValue;
    },
    // 确认选择的时间 日期插件
    confirmPickerDatetimePicker() {
      this.visitorsTimeValue = this.timeFormat(this.visitorsTime);
      this.parent.visitorsTime = this.timeFormat2(this.visitorsTime);
      this.showDatetimePicker = false;
    },
    timeFormat(time) {
      // 时间格式化 2019年09月08日
      let year = time.getFullYear();
      let month = time.getMonth() + 1;
      let day = time.getDate();
      let hour = time.getHours();
      let minute = time.getMinutes();

      return year + '年' + month + '月' + day + '日 ' + hour + '时' + minute + '分';
    },
    timeFormat2(time) {
      // 时间格式化 2019-09-08
      let year = time.getFullYear();
      let month = time.getMonth() + 1;
      let day = time.getDate();
      let hour = time.getHours();
      let minute = time.getMinutes();
      return year + '-' + month + '-' + day + ' ' + hour + ':' + minute;
    },
    validatorIdCard(val) {
      return /1\d{10}/.test(val);
    },
    //是否承诺
    toggle(index) {
      this.$refs.checkboxes[index].toggle();
      if (this.result.length == 1) {
        this.isDisabled = true;
      } else {
        this.isDisabled = false;
      }
    },
    //上传行程码
    async uploadItineraryCodeFile(file) {
      const data = new FormData();
      data.append('file', file.file); //上传的是 File 对象
      //使用axios上传文件到服务器,注意设置axios的headers为{ "Content-Type": "multipart/form-data" }
      let res = await visitorApi.uploadImg(data);

      if (res != null && res.success && res.code == 1) {
        this.parent.itineraryCode = res.data;
      } else {
        Notify({ type: 'danger', message: res.msg });
      }
    },
    //上传健康码
    async uploadHealthCodeFile(file) {
      const data = new FormData();
      data.append('file', file.file); //上传的是 File 对象
      //使用axios上传文件到服务器,注意设置axios的headers为{ "Content-Type": "multipart/form-data" }
      let res = await visitorApi.uploadImg(data);

      if (res != null && res.success && res.code == 1) {
        this.parent.healthCode = res.data;
      } else {
        Notify({ type: 'danger', message: res.msg });
      }
    },
    //表单提交
    onSubmit() {
      console.log(this.itineraryCodeFileList);
      // if(!this.parent.healthCode||this.healthCodeFileList.length == 0){
      //   Notify({ type: 'danger', message: '请上传行程码' });
      //   return false;
      // }
      // if(!this.parent.itineraryCode||this.itineraryCodeFileList.length == 0){
      //   Notify({ type: 'danger', message: '请上传健康码' });
      //   return false;
      // }
      this.save();
    },
    async save() {

      let res = await visitorApi.addVisitorsRecord(this.parent);
      this.isDisabled = true;
      if (res != null && res.success && res.code == 1) {
        //console.log(res);
        Notify({ type: 'success', message: res.msg });
        this.resetForm();
        //返回首页
        this.$router.push('/visitor/index');
      } else {
        this.isDisabled = false;
        Notify({ type: 'danger', message: res.msg });
      }
    },
    //重置表单
    resetForm() {
      this.parent = {
        name: '', //姓名
        idCard: '', //身份证号
        companyName: '', //公司
        phone: '', //电话
        area: '',//所在地区
        itineraryCode: '',//行程码
        healthCode: '',//健康码
        specialCase: '', //情况说明
        isFr: '', //是否发热
        visitorsTime: '', //访校时间
        departmentId: '', //部门
        employeeId: '', //老师
        remark: '' //来访事由
      };
    }
  }
};
</script>
<style scoped>
.body_w {
  position: absolute;
  width: 100%;
  height: 100%;
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
</style>
