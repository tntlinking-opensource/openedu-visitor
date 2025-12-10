<template>
  <!-- Row 省份管理 start -->
  <Row :gutter="24">
    <!-- Col 左侧省份列表模块 start -->
    <Col span="11">
      <Card class="warp-card" dis-hover style=" position: relative;">
        <p slot="title">省份列表</p>
        <div slot="extra">
          <Button
            @click="showAddProvinceModal()"
            size="small"
            type="primary"
            v-privilege="'add-province'"
          >添加省份</Button>
        </div>
        <!-- Menu 省份列表 start -->
        <Menu
          :active-name="0"
          class="left province-list no-scrollbar"
          ref="sideMenu"
          style="height: 666px;overflow-y: scroll;width:100%;"
        >
          <!-- MenuItem 省份列表项 start -->
          <MenuItem
            :key="item.id"
            :name="item.name"
            @click.native="selectProvince(item)"
            v-for="(item,index) in provinceList"
          >
            <Row>
              <Col span="24">
                <span class="province-name">
                  <Tooltip placement="right">
                    <span>{{item.name}}</span>
                    <div class="suspension-box" slot="content">
                      <p>
                        <span @click="deleteProvinceModal(item)" v-privilege="'delete-province'">删除省份</span>
                      </p>
                      <p>
                        <span @click="showUpdateProvinceModal(item)" v-privilege="'update-province'">编辑省份</span>
                      </p>
                    </div>
                  </Tooltip>
                </span>
              </Col>
            </Row>
          </MenuItem>
          <!-- MenuItem 省份列表项 end -->
        </Menu>
        <!-- Menu 省份列表 end -->
        <!--Modal 添加省份 start-->
        <Modal title="添加省份" v-model="isShowAddProvinceModal">
          <Form :label-width="100" :model="ruleDetail" label-position="left">
            <FormItem label="省份名称" required >
              <Input
                @on-keydown="ruleDetail.name=ruleDetail.name.replace(/^ +| +$/g,'')"
                @on-keyup="ruleDetail.name=ruleDetail.name.replace(/^ +| +$/g,'')"
                placeholder="请输入省份名称..."
                v-model="ruleDetail.name"
              ></Input>
            </FormItem>
            <FormItem label="备注">
              <Input placeholder="请输入备注" type="textarea" v-model="ruleDetail.remark"></Input>
            </FormItem>
          </Form>
          <div slot="footer">
            <Button @click="submitProvince" type="primary">确认</Button>
            <Button @click="hideAddProvinceModal()">返回</Button>
          </div>
        </Modal>
        <!--Modal 添加省份 end-->
        <!--Modal 修改省份 start-->
        <Modal title="修改省份" v-model="isShowUpdateProvinceModal">
          <Form :label-width="100" :model="ruleDetail" label-position="left">
            <FormItem label="省份名称" required>
              <Input
                @on-keydown="ruleDetail.name=ruleDetail.name.replace(/^ +| +$/g,'')"
                @on-keyup="ruleDetail.name=ruleDetail.name.replace(/^ +| +$/g,'')"
                placeholder="请输入省份名称..."
                v-model="ruleDetail.name"
              ></Input>
            </FormItem>
            <FormItem label="备注">
              <Input placeholder="请输入备注" type="textarea" v-model="ruleDetail.remark"></Input>
            </FormItem>
          </Form>
          <div slot="footer">
            <Button @click="updateProvince" type="primary">确认</Button>
            <Button @click="hideUpdateProvinceModal()">返回</Button>
          </div>
        </Modal>
        <!--Modal 修改省份 end-->
        <!--Modal 删除省份 start-->
        <Modal
          @on-cancel="cancelDeleteProvince()"
          @on-ok="confirmDeleteProvince()"
          title="删除省份"
          v-model="isShowRemoveProvinceModal"
        >确定删除"{{ruleDetail.name}}"这个省份吗？</Modal>
        <!--Modal 删除省份 end-->
      </Card>
    </Col>
    <!-- Col 左侧省份列表模块 end -->
    <!-- 右侧城市列表 -->

    <city-list ref="CityList"></city-list>
        
  </Row>
  <!-- Row 省份管理 end -->
</template>
<script>

import CityList from './components/city-list.vue';
import { provinceApi } from '@/api/province.js';
export default {
  name: 'ProvinceManage',
  components: {
    CityList
  },
  props: {},
  data() {
    return {
      provinceList: {},
      provinceId: 0,
      // 删除省份对话框隐藏
      isShowRemoveProvinceModal: false,
      // 修改省份对话框隐藏
      isShowUpdateProvinceModal: false,
      // 增加省份对话框隐藏
      isShowAddProvinceModal: false,
      // 增加省份信息
      ruleDetail: {
        name: '',
        id: '',
        remark: ''
      },
      // 是否第一次请求数据
      isFirst: true
    };
  },
  computed: {},
  watch: {},
  filters: {},
  created() {},
  mounted() {
    // 初始化加载数据
    this.getAllProvinces();
  },
  beforeCreate() {},
  beforeMount() {},
  beforeUpdate() {},
  updated() {},
  beforeDestroy() {},
  destroyed() {},
  activated() {},
  methods: {
    // 初始化加载数据方法
    async getAllProvinces() {
      try {
        let response = await provinceApi.getAllProvince();
        //console.log('response' + response.data);
        this.provinceList = response.data;
        if (this.provinceList && this.provinceList.length > 0) {
          this.provinceId = this.provinceList[0].id;
          this.$refs.CityList.getAllCity(this.provinceId);
          if (this.isFirst) {
            this.$nextTick(() => {
              this.$refs.sideMenu.updateOpened();
              this.$refs.sideMenu.updateActiveName();
            });
            this.isFirst = false;
          }
        }
      } catch (e) {
        //TODO zhuoda sentry
        console.error(e);
      }
    },
    // 增加省份方法
    async addProvince() {
      this.$Spin.show();
      try {
        await provinceApi.addProvince(this.ruleDetail);
        this.hideAddProvinceModal();
        await this.getAllProvinces(); // 刷新
      } catch (e) {
        //TODO zhuoda sentry
        console.error(e);
      } finally {
        this.$Spin.hide();
      }
    },
    // 提交添加省份
    submitProvince() {
      // 添加
      if (this.ruleDetail.name) {
        this.addProvince();
      } else {
        this.$Message.warning('请先完善省份信息');
      }
    },
    // 编辑省份方法
    async updateProvince() {
      this.$Spin.show();
      try {
        await provinceApi.updateProvince(this.ruleDetail);
        this.hideUpdateRoleModal();
        await this.getAllProvinces(); // 刷新
      } catch (e) {
        //TODO zhuoda sentry
        console.error(e);
      } finally {
        this.$Spin.hide();
      }
    },
    // 删除省份方法
    async deleteProvince() {
      this.$Spin.show();
      try {
        await provinceApi.deleteProvince(this.ruleDetail.id);
        this.$Message.success('删除成功');
        await this.getAllProvinces(); // 刷新
      } catch (e) {
        //TODO zhuoda sentry
        console.error(e);
      } finally {
        this.$Spin.hide();
      }
    },
    // 确认删除省份页面
    deleteProvinceModal(item) {
      this.isShowRemoveProvinceModal = true;
      this.ruleDetail.id = item.id;
      this.ruleDetail.name = item.name;
    },
    // 编辑省份页面
    showUpdateProvinceModal(item) {
      this.isShowUpdateProvinceModal = true;
      this.ruleDetail.id = item.id;
      this.ruleDetail.name = item.name;
      this.ruleDetail.remark = item.remark;
    },
    // 添加省份页面
    showAddProvinceModal() {
      this.isShowAddProvinceModal = true;
      this.ruleDetail.name = '';
      this.ruleDetail.remark = '';
    },
    // 关闭更新弹窗
    hideUpdateProvinceModal() {
      this.isShowUpdateProvinceModal = false;
    },
    // 关闭添加弹窗
    hideAddProvinceModal() {
      this.isShowAddProvinceModal = false;
    },
    // 省份选择
    selectProvince(item) {
      this.provinceId = item.id;
      this.$refs.CityList.getAllCity(this.provinceId);
    },
    // 确定删除
    confirmDeleteProvince() {
      this.deleteProvince();
      this.isShowRemoveProvinceModal = false;
    },
    // 取消删除
    cancelDeleteProvince() {
      this.isShowRemoveProvinceModal = false;
    }
  }
};
</script>
<style lang="less" scoped>
.province-list {
  line-height: 30px;
  padding: 10px 0;

  .province-name {
    position: relative;
  }

  &::after {
    display: none;
  }

  button {
    margin-left: 3px;
  }
}

.ivu-menu-item-active:not(.ivu-menu-submenu) {
  z-index: 0 !important;
}

.suspension-box {
  z-index: 999;
  padding: 0 8px;

  p {
    padding: 3px 0;
  }
}
</style>

