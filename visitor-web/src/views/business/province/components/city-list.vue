<template>
  <!-- Row 城市管理 start -->
    <!-- Col 左侧城市列表模块 start -->
    <Col span="11">
      <Card class="warp-card" dis-hover style=" position: relative;">
        <p slot="title">城市列表</p>
        <div slot="extra">
          <Button
            @click="showAddCityModal()"
            size="small"
            type="primary"
            v-privilege="'add-city'"
          >添加城市</Button>
        </div>
        <!-- Menu 城市列表 start -->
        <Menu
          :active-name="0"
          class="left city-list no-scrollbar"
          ref="sideMenu"
          style="height: 666px;overflow-y: scroll;width:100%;"
        >
          <!-- MenuItem 城市列表项 start -->
          <MenuItem
            :key="item.id"
            :name="index"
            @click.native="selectCity(item,index)"
            v-for="(item,index) in cityList"
          >
            <Row>
              <Col span="24">
                <span class="city-name">
                  <Tooltip placement="right">
                    <span>{{item.name}}</span>
                    <div class="suspension-box" slot="content">
                      <p>
                        <span @click="deleteSingleCity(item)" v-privilege="'delete-city'">删除城市</span>
                      </p>
                      <p>
                        <span @click="showUpdateCityModal(item)" v-privilege="'update-city'">编辑城市</span>
                      </p>
                    </div>
                  </Tooltip>
                </span>
              </Col>
            </Row>
          </MenuItem>
          <!-- MenuItem 城市列表项 end -->
        </Menu>
        <!-- Menu 城市列表 end -->
        <!--Modal 添加城市 start-->
        <Modal title="添加城市" v-model="isShowAddCityModal">
          <Form :label-width="100" :model="ruleDetail" label-position="left">
            <FormItem label="城市名称" required>
              <Input
                @on-keydown="ruleDetail.name=ruleDetail.name.replace(/^ +| +$/g,'')"
                @on-keyup="ruleDetail.name=ruleDetail.name.replace(/^ +| +$/g,'')"
                placeholder="请输入城市名称..."
                v-model="ruleDetail.name"
              ></Input>
            </FormItem>
            <FormItem label="备注">
              <Input placeholder="请输入备注" type="textarea" v-model="ruleDetail.remark"></Input>
            </FormItem>
          </Form>
          <div slot="footer">
            <Button @click="submitCity" type="primary">确认</Button>
            <Button @click="hideAddCityModal()">返回</Button>
          </div>
        </Modal>
        <!--Modal 添加城市 end-->
        <!--Modal 修改城市 start-->
        <Modal title="修改城市" v-model="isShowUpdateCityModal">
          <Form :label-width="100" :model="ruleDetail" label-position="left">
            <FormItem label="城市名称" required>
              <Input
                @on-keydown="ruleDetail.name=ruleDetail.name.replace(/^ +| +$/g,'')"
                @on-keyup="ruleDetail.name=ruleDetail.name.replace(/^ +| +$/g,'')"
                placeholder="请输入城市名称..."
                v-model="ruleDetail.name"
              ></Input>
            </FormItem>
            <FormItem label="备注">
              <Input placeholder="请输入备注" type="textarea" v-model="ruleDetail.remark"></Input>
            </FormItem>
          </Form>
          <div slot="footer">
            <Button @click="updateCity" type="primary">确认</Button>
            <Button @click="hideUpdateCityModal()">返回</Button>
          </div>
        </Modal>
        <!--Modal 修改城市 end-->
        <!--Modal 删除城市 start-->
        <Modal
          @on-cancel="cancelDeleteCity()"
          @on-ok="confirmDeleteCity()"
          title="删除城市"
          v-model="isShowRemoveCityModal"
        >确定删除"{{ruleDetail.name}}"这个城市吗？</Modal>
        <!--Modal 删除城市 end-->
      </Card>
    </Col>
    <!-- Col 左侧城市列表模块 end -->
  <!-- Row 城市管理 end -->
</template>
<script>
import { cityApi} from '@/api/city';
export default {
  name: 'cityList',
  components: {
    
  },
  props: {},
  data() {
    return {
      cityList: {},
      cityId: 0,
      provinceId: 0,
      // 删除城市对话框隐藏
      isShowRemoveCityModal: false,
      // 修改城市对话框隐藏
      isShowUpdateCityModal: false,
      // 增加城市对话框隐藏
      isShowAddCityModal: false,
      // 增加城市信息
      ruleDetail: {
        name: '',
        id: '',
        remark: '',
        provinceId: ''
      },
      // 默认选中Menu标签为功能权限
      displayTab: 1,
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
    //this.getAllCity();
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
    async getAllCity(id) {
      try {
        this.provinceId = id;
        console.log('this.provinceId=' + this.provinceId);
        let response = await cityApi.getAllCity(id);
        this.cityList = response.data;
        // if (this.roleList && this.roleList.length > 0) {
        //   this.roleId = this.roleList[0].id;
        //   if (this.isFirst) {
        //     this.$nextTick(() => {
        //       this.$refs.sideMenu.updateOpened();
        //       this.$refs.sideMenu.updateActiveName();
        //     });
        //     this.isFirst = false;
        //   }
        // }
      } catch (e) {
        //TODO zhuoda sentry
        console.error(e);
      }
    },
    // 增加城市方法
    async addCity() {
      this.$Spin.show();
      try {
        await cityApi.addCity(this.ruleDetail);
        this.hideAddCityModal();
        await this.getAllCity(this.provinceId); // 刷新
      } catch (e) {
        //TODO zhuoda sentry
        console.error(e);
      } finally {
        this.$Spin.hide();
      }
    },
    // 提交添加城市
    submitCity() {
      // 添加
      if (this.ruleDetail.name) {
        this.addCity();
      } else {
        this.$Message.warning('请先完善城市信息');
      }
    },
    // 编辑城市方法
    async updateCity() {
      this.$Spin.show();
      try {
        await cityApi.updateCity(this.ruleDetail);
        this.hideUpdateCityModal();
        await this.getAllCity(this.provinceId); // 刷新
      } catch (e) {
        //TODO zhuoda sentry
        console.error(e);
      } finally {
        this.$Spin.hide();
      }
    },
    // 删除城市方法
    async deleteCity(id) {
      this.$Spin.show();
      try {
        await cityApi.deleteById(id);
        this.$Message.success('删除成功');
        await this.getAllCity(this.provinceId); // 刷新
      } catch (e) {
        //TODO zhuoda sentry
        console.error(e);
      } finally {
        this.$Spin.hide();
      }
    },
    // 删除城市界面
    deleteSingleCity(item) {
      this.isShowRemoveCityModal = true;
      this.ruleDetail.id = item.id;
    },
    // 编辑城市页面
    showUpdateCityModal(item) {
      console.log(item);
      this.isShowUpdateCityModal = true;
      this.ruleDetail.id = item.id;
      this.ruleDetail.name = item.name;
      this.ruleDetail.remark = item.remark;
      this.ruleDetail.provinceId = this.provinceId;
    },
    // 添加城市页面
    showAddCityModal() {
      this.isShowAddCityModal = true;
      this.ruleDetail.name = '';
      this.ruleDetail.remark = '';
      this.ruleDetail.provinceId = this.provinceId;
    },
    // 关闭更新弹窗
    hideUpdateCityModal() {
      this.isShowUpdateCityModal = false;
    },
    // 关闭添加弹窗
    hideAddCityModal() {
      this.isShowAddCityModal = false;
    },
    // 城市选择
    selectCity(item, index) {
      this.cityId = item.id;
    },
    // 确定删除
    confirmDeleteCity() {
      this.deleteCity(this.ruleDetail.id);
      this.isShowRemoveCityModal = false;
    },
    // 取消删除
    cancelDeleteCity() {
      this.isShowRemoveCityModal = false;
    }
  }
};
</script>
<style lang="less" scoped>
.city-list {
  line-height: 30px;
  padding: 10px 0;

  .city-name {
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
