<template>
  <div>
    <Card class="smart-query-card">
      <!------ 查询条件第一行 begin------->
      <Row class="smart-query-form-row">
        <span>
          访客姓名 :
          <Input
            placeholder="请输入访客姓名"
            style="width: 180px"
            v-model="queryForm.name"
          />
        </span>
        <span>
          身份证号 :
          <Input
            placeholder="请输入身份证号"
            style="width: 180px"
            v-model="queryForm.idCard"
          />
        </span>
        <span>
          电话 :
          <Input
            placeholder="请输入电话"
            style="width: 180px"
            v-model="queryForm.phone"
          />
        </span>
        <!-- <span>
          审核状态 :
          <Select v-model="queryForm.shzt" style="width: 180px">
            <Option value="0">待审核</Option>
            <Option value="1">已通过</Option>
            <Option value="-1">未通过</Option>
          </Select>
        </span> -->
        <ButtonGroup>
          <Button
            @click="queryList"
            icon="ios-search"
            type="primary"
            v-privilege="'auditManagement-list-query'"
            >查询</Button
          >
          <Button
            @click="resetQueryList"
            icon="md-refresh"
            type="default"
            v-privilege="'auditManagement-list-query'"
            >重置</Button
          >
        </ButtonGroup>
      </Row>
    </Card>
    <Card class="warp-card">
      <!-- <Row class="marginBottom10">
        <Button
          @click="showAuditForm"
          icon="ios-checkmark"
          size="small"
          type="primary"
          v-privilege="'auditManagement-list-set'"
          >审核</Button
        >
      </Row> -->

      <!-------表格列表 begin------->
      <Table
        :columns="mainTable.columnArray"
        :data="mainTable.data"
        :loading="mainTable.loading"
        @on-sort-change="handleSortChange"
        border
        highlight-row
        ref="mainTable"
      ></Table>

      <Page
        :current="queryForm.pageNum"
        :page-size="queryForm.pageSize"
        :page-size-opts="mainTablePage.pageSizeOps"
        :total="mainTablePage.total"
        @on-change="changeMainTablePagePageNum"
        @on-page-size-change="changeMainTablePagePageSize"
        class="smart-query-table-page"
        show-elevator
        show-sizer
        show-total
      />
    </Card>
    <!-------表格列表 end------->

    <!-------更新 begin------->
    <AuditManagementListForm
      ref="auditManagementListForm"
      @close="auditManagementListFormClose"
    ></AuditManagementListForm>

    <!-------更新 end------->

    <!--图片预览-->
    <Modal
      v-model="showImgModal"
      draggable
      width="500"
      title="预览">

      <img :src="imgCodeUrl" width="100%" height="100%"  alt="">
      <div slot="footer"></div>
    </Modal>
    <!--图片预览-->
  </div>
</template>

<script>
import { PAGE_SIZE_OPTIONS } from "@/constants/table-page";
import { visitorsRecordApi } from "@/api/visitors-record";
import AuditManagementListForm from "./components/auditManagement-list-form";
import config from '@/config';

const baseUrl = config.baseUrl.apiUrl;
const PAGE_SIZE_INIT = 20;
export default {
  name: "AuditManagementList",
  components: {
    AuditManagementListForm,
  },
  props: {},
  data() {
    return {
      /* -------------------------查询条件相关数据-------------------- */
      //搜索表单
      queryForm: {
        //姓名
        name: null,
        //身份证号
        idCard: null,
        //电话
        phone: null,
        // 审核状态
        shzt: 0,
        pageNum: 1,
        pageSize: PAGE_SIZE_INIT,
        orders: [],
      },
      /*  -------------------------表格相关数据------------------------- */
      //表格分页
      mainTablePage: {
        total: 0,
        pageSizeOps: PAGE_SIZE_OPTIONS,
      },
      imgCodeUrl : '',
      //显示图片预览弹框
      showImgModal : false,
      //表格
      mainTable: {
        //加载中
        loading: false,
        //表格数据
        data: [],
        //表格列
        columnArray: [
          {
            type: "selection",
            width: 30,
            align: "center",
          },
          {
            width: 80,
            title: "访客姓名",
            key: "name",
            //sortable: "custom",
          },
          {
            width: 140,
            title: "身份证号",
            key: "idCardEncryption",
            //sortable: "custom",
          },
          {
            width: 150,
            title: "所在地区",
            key: "area",
            //sortable: "custom",
          },
          {
            width: 100,
            title: "电话",
            key: "phone",
            //sortable: "custom",
          },
          // {
          //   title: '健康码',
          //   key: 'healthCode',
          //   width: 60,
          //   render:(h,params) =>{
          //     const row = params.row;
          //     const imgUrl = baseUrl+"/visitorsRecord/downloadImg/"+row.healthCode;
          //     return h('img',{
          //       attrs : {
          //         src : imgUrl
          //       },
          //       style : {
          //         width : '40px',
          //         height : '40px',
          //         cursor : 'pointer'
          //       },
          //       on: {
          //             click: () => {
          //               this.imgCodeUrl = imgUrl;
          //               this.showImgModal = true;
          //             },
          //           },
          //     })
          //   }
          // },
          // {
          //   title: '行程码',
          //   key: 'itineraryCode',
          //   width: 60,
          //   render:(h,params) =>{
          //     const row = params.row;
          //     const imgUrl = baseUrl+"/visitorsRecord/downloadImg/"+row.itineraryCode;
          //     return h('img',{
          //       attrs : {
          //         src : imgUrl
          //       },
          //       style : {
          //         width : '40px',
          //         height : '40px',
          //         cursor : 'pointer'
          //       },
          //       on: {
          //             click: () => {
          //               this.imgCodeUrl = imgUrl;
          //               this.showImgModal = true;
          //             },
          //           },
          //     })
          //   }
          // },
          {
            width: 180,
            title: "公司名称",
            key: "companyName",
            //sortable: "custom",
          },
          {
            width: 120,
            title: "访校时间",
            key: "visitorsTime",
            sortable: "custom",
          },
          {
            title: "教师",
            key: "deptEmp",
            //sortable: "custom",
          },
          {
            width: 80,
            title: "审核状态",
            key: "shzt",
            render: (h, params) => {
              const row = params.row;
              const color =
                row.shzt === 1
                  ? "success"
                  : row.shzt ===-1
                  ? "red"
                  : "warning";
              const text =
                row.shzt === 1
                  ? "已通过"
                  : row.shzt === -1
                  ? "未通过"
                  : "待审核";

              return h(
                "Tag",
                {
                  props: {
                    type: "border",
                    color: color,
                  },
                },
                text
              );
            },
          },
          {
            title: "操作",
            key: "action",
            align: "right",
            width: 60,
            className: "action-hide",
            render: (h, params) => {
              return h('div', [
                h('Button', {
                    props: {
                        type: 'primary',
                        size: 'small'
                    },
                    style: {
                        marginRight: '5px'
                    },
                    on: {
                        click: () => {
                          this.$refs.auditManagementListForm.showModal(params.row);
                            //this.showInfoStudentForm(params.row);
                        }
                    }
                }, '审核')
              ]);

            },
          },
        ],
      },
    };
  },
  computed: {},
  watch: {},
  filters: {},
  created() {},
  mounted() {
    this.queryList();
  },
  beforeCreate() {},
  beforeMount() {},
  beforeUpdate() {},
  updated() {},
  beforeDestroy() {},
  destroyed() {},
  activated() {},
  methods: {
    /* -------------------------查询相关 begin------------------------- */
    convertQueryParam() {
      return { ...this.queryForm };
    },
    //查询
    async queryList() {
      this.mainTable.loading = true;
      try {
        let params = this.convertQueryParam();
        let result = await visitorsRecordApi.queryVisitorsRecord(params);
        this.mainTable.data = result.data.list;
        this.mainTablePage.total = result.data.total;
      } finally {
        this.mainTable.loading = false;
      }
    },
    //重置查询
    resetQueryList() {
      let pageSize = this.queryForm.pageSize;
      this.queryForm = {
        id: null,
        name: null,
        idCard: null,
        phone: null,
        employeeId: null,
        shzt: 0,
        pageNum: 1,
        pageSize: pageSize,
        orders: [],
      };
      this.queryList();
    },
    //修改页码
    changeMainTablePagePageNum(pageNum) {
      this.queryForm.pageNum = pageNum;
      this.queryList();
    },
    //修改页大小
    changeMainTablePagePageSize(pageSize) {
      this.queryForm.pageNum = 1;
      this.queryForm.pageSize = pageSize;
      this.queryList();
    },
    //处理排序
    handleSortChange(column) {
      if (column.order === "normal") {
        this.queryForm.orders = [];
      } else {
        this.queryForm.orders = [
          {
            column: column.column.tableColumn,
            asc: "asc" === column.order,
          },
        ];
      }
      this.queryList();
    },
    /* -------------------------审核------------------------- */
    // 展示审核界面
    showAuditForm() {
      if (!this.validateMainTableSelection()) {
        return;
      }
      this.Audit();
    },
    //审核
    async Audit() {
      this.$Spin.show();
      this.$refs.auditManagementListForm.showModal(
        this.mainTableSelectArray[0]
      );
      this.clearMainTableSelection();
      this.$Spin.hide();
    },
    //清空选中
    clearMainTableSelection() {
      this.mainTableSelectArray = [];
    },
    //校验是否有选中
    validateMainTableSelection() {
      this.mainTableSelectArray = this.$refs.mainTable.getSelection();
      if (this.mainTableSelectArray.length != 1) {
        this.$Message.error("请选择一条数据");
        return false;
      }
      return true;
    },
    auditManagementListFormClose() {
      this.queryList();
      //this.$refs.AuditManagementListForm.isShowDetailModal = false;
    }
  },
};
</script>
