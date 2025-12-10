<template>
  <Modal :footer-hide="true" :width="700" title="部门详情" v-model="isShowDetailModal">
    <Form :label-width="80">
      <Row :gutter="16">
        <Col span="8">
          <FormItem label="部门id:">{{details.id}}</FormItem>
        </Col>
        <Col span="8">
          <FormItem label="部门名称:">{{details.name}}</FormItem>
        </Col>
        <Col span="8">
          <FormItem label="部门简称:">{{details.shortName}}</FormItem>
        </Col>
      </Row>
      <Row :gutter="16">
        <Col span="8">
          <FormItem label="部门负责人:">{{details.managerId}}</FormItem>
        </Col>
        <Col span="8">
          <FormItem label="部门编号:">{{details.code}}</FormItem>
        </Col>
        <Col span="8">
          <FormItem label="英文名称">{{details.engName}}</FormItem>
        </Col>
        <Col span="24" >
          <FormItem label="审核人" ><b v-for="(reviewer,index) in reviewers">{{reviewer + '、'}}</b></tr></FormItem>
        </Col>
      </Row>
    </Form>
  </Modal>
</template>
<script>
import { departmentApi } from '@/api/department';
export default {
  name: 'departmentTableDetail',
  components: {},
  props: {},
  data() {
    return {
      isShowDetailModal: false,
      details: {},
      reviewers: [],
      loginNames: []
      //reviewer:''
    };
  },
  computed: {},
  watch: {},
  filters: {},
  created() {},
  mounted() {},
  beforeCreate() {},
  beforeMount() {},
  beforeUpdate() {},
  updated() {},
  beforeDestroy() {},
  destroyed() {},
  activated() {},
  methods: {
    showModal(detail) {
      this.isShowDetailModal = true;
      this.getRealDetail(detail.id);
      
    },

    async getRealDetail(id){
        // 把 result 返回给上一级函数 好像 无效，只能在当前方法中取值
        let result = await departmentApi.getRealDetails(id);
        this.details = result.data;
        this.reviewers = this.details.reviewers;
        // this.reviewers.map(e => {
        //     this.reviewer += e + ', '
        // });
    }
  }
};
</script>
<style lang="less" scoped>
</style>
