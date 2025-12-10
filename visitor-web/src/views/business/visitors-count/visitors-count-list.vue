<template>
  <div style="width:80%;margin: 0 auto;height:100%;">
    <div style="width:100%;height:100px;">
      <Card class="warp-card" dis-hover style="width: 100%;text-align: right;">
        <Form
          :model="searchform"
          class="tools"
          inline
          ref="searchform"
        >
          <FormItem prop="startDate">
            <DatePicker
              placeholder="开始日期"
              style="width: 200px"
              type="date"
              @on-change="startDateChange"
              v-model="searchform.startDate"
            ></DatePicker>
          </FormItem>
          <FormItem prop="endDate">
            <DatePicker
              placeholder="结束日期"
              style="width: 200px"
              type="date"
              format="yyyy-MM-dd"
              @on-change="endDateChange"
              v-model="searchform.endDate"
            ></DatePicker>
          </FormItem>
          <FormItem>
            <ButtonGroup>
              <Button @click="search" icon="ios-search" type="primary">查询</Button>
            </ButtonGroup>
          </FormItem>
        </Form>
      </Card>
    </div>
    <div style="width:100%;height:80%;overflow: auto;">
      <table class="table_w">
        <tr>
          <td></td>
          <td  style="font-size: 16px;width:20%;">部门名称/申请人数</td>
          <td style="font-size: 16px;">审核通过</td>
          <td style="font-size: 16px;">审核失败</td>
          <td style="font-size: 16px;">待审核</td>
          <td style="font-size: 16px;">扫码确认</td>
        </tr>
        <tr v-for="(item,key,i) in dataList" :key="key">
          <td width="50px;"><img :src="departmentImg" style="width:32px;height:32px;"></td>
          <td style="font-size: 16px;text-align: left;">{{key}}({{item.count}})</td>
          <td>{{item.num1}}</td>
          <td>{{item.num2}}</td>
          <td>{{item.num3}}</td>
          <td>{{item.num4}}</td>
        </tr>
      </table>
    </div>
  </div>
</template>

<script>

import { PAGE_SIZE_OPTIONS } from "@/constants/table-page";
import { visitorsRecordApi } from "@/api/visitors-record";
import config from '@/config';
import departmentImg from '@/assets/images/department_w.png';

const baseUrl = config.baseUrl.apiUrl;
const PAGE_SIZE_INIT = 20;

export default {
  name: "VisitorsCount",
  components: {
  },
  props: {},
  data() {
    return {
      searchform: {
        startDate: '',
        endDate: '',
      },
      
      departmentImg,
      dataList:{}
    }
  },
  computed: {},
  watch: {},
  filters: {},
  created() {},
  mounted() {
    this.visitorCount();
  },
  beforeCreate() {},
  beforeMount() {},
  beforeUpdate() {},
  updated() {},
  beforeDestroy() {},
  destroyed() {},
  activated() {},
  methods: {
    // 搜索
    search() {
      this.visitorCount();
    },
    async visitorCount(){
      let params = this.searchform;
      let result = await visitorsRecordApi.visitorCount(params);
      this.dataList = result.data;
      console.log(this.dataList);
    },
    startDateChange(formateDate){
      this.searchform.startDate = formateDate;
    },
    endDateChange(formateDate){
      this.searchform.endDate = formateDate;
    }
  }
};
</script>
<style scoped>
  .table_w{
    width: 100%;
  }
  .table_w td{
    text-align: center;
    height: 50px;
    font-size: 25px;
    color: #9ea1aa;
    border-top: 1px solid #F7F7F9;
  }
</style>