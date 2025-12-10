<template>
  <!-- Row 部门管理 start -->
  <Row :gutter="5">
    <!-- Col 左侧部门列表模块 start -->
    <Col span="5">
      <Card class="warp-card" dis-hover style="position: relative">
        <p slot="title">部门列表</p>
        <Row>
          <Input search enter-button placeholder="输入部门名称" @on-search="getDepartmentByDepartmentName" v-model="departmentName"/>
          <!-- <Input placeholder="输入部门名称" v-model="departmentName" />
          <Button @click="getDepartmentByDepartmentName">查询</Button> -->
        </Row>
        <!-- Menu 部门列表 start -->
        <Menu
          :active-name="0"
          class="left department-list no-scrollbar"
          ref="sideMenu"
          style="height: 666px; overflow-y: scroll; width: 100%"
        >
          <!-- MenuItem 部门列表项 start -->
          <MenuItem
            :key="item.id"
            :name="item.name"
            @click.native="selectDepartment(item)"
            v-for="(item, index) in departmentList"
          >
            <Row>
              <Col span="30">
                <span class="department-name">
                  <span>{{ item.name }}</span>
                </span>
              </Col>
            </Row>
          </MenuItem>
          <!-- MenuItem 部门列表项 end -->
        </Menu>
        <!-- Menu 部门列表 end -->
      </Card>
    </Col>
    <!-- Col 左侧部门列表模块 end -->
    <!-- 右侧员工列表 -->

    <EmployeeTable ref="employeeTable"></EmployeeTable>
  </Row>
  <!-- Row 部门管理 end -->
</template>
<script>
import { departmentApi } from "@/api/department";
import EmployeeTable from "./components/employee-table/employee-table";
export default {
  name: "RoleEmployeeManage",
  components: {
    EmployeeTable,
  },
  props: {},
  data() {
    return {
      departmentList: {},
      departmentId: 0,
      departmentName: "",
      // 是否第一次请求数据
      isFirst: true,
    };
  },
  computed: {},
  watch: {},
  filters: {},
  created() {},
  mounted() {
    // 初始化加载数据
    this.getAllDepartments();
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
    async getAllDepartments() {
      try {
        let response = await departmentApi.getDepartmentAll();
        //console.log('response' + response.data);
        this.departmentList = response.data;
        // if (this.departmentList && this.departmentList.length > 0) {
        //   this.departmentId = this.departmentList[0].id;
        //   //console.log(this.departmentId);
        //   this.$refs.employeeTable.getAllEmployees(this.departmentId);
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
    // 部门选择
    selectDepartment(item) {
      this.departmentId = item.id;
      this.$refs.employeeTable.getAllEmployees(this.departmentId);
    },
    // 搜索
    async getDepartmentByDepartmentName() {
      if(this.departmentName == ''){
        this.getAllDepartments();
        //console.log(this.departmentList);
      }else{
        this.departmentList = {};
        let result = await departmentApi.getDepartmentByDepartmentName(this.departmentName);
        this.departmentList = result.data;
        //console.log(this.departmentList);
        if (this.departmentList && this.departmentList.length > 0) {
          this.departmentId = this.departmentList[0].id;
          //console.log(this.departmentId);
          this.$refs.employeeTable.getAllEmployees(this.departmentId);
        }
      }  
    },
  },
};
</script>
<style lang="less" scoped>
.department-list {
  line-height: 30px;
  padding: 10px 0;

  .department-name {
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

