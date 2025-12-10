<template>
    <div>
        <Card class="smart-query-card">
            <!------ 查询条件第一行 begin------->
            <Row class="smart-query-form-row">
                <Col span="2" style="text-align:right; line-height: 30px;">部门编号&nbsp;&nbsp;</Col>
                <Col span="4">
                    <Input placeholder="请输入部门编号" style="width: 180px" v-model="queryForm.code" />
                </Col>
                <Col span="2" style="text-align:right; line-height: 30px;">部门名称&nbsp;&nbsp;</Col>
                <Col span="4">
                    <Input placeholder="请输入部门名称" style="width: 180px" v-model="queryForm.name" />
                </Col>
                <Col span="6">
                    <ButtonGroup>
                    <Button
                            @click="queryList"
                            icon="ios-search"
                            type="primary"
                            v-privilege="'department-list-query'"
                    >查询</Button>
                    <Button
                            @click="resetQueryList"
                            icon="md-refresh"
                            type="default"
                            v-privilege="'department-list-query'"
                    >重置</Button>
                </ButtonGroup>
                <Button
                       @click="showMoreQueryConditionFlag = !showMoreQueryConditionFlag"
                        icon="md-more"
                        style="margin-left: 20px"
                        type="primary"
                        v-privilege="'department-list-query'"
                >{{showMoreQueryConditionFlag?'隐藏':'展开'}}</Button>
                </Col>
            </Row>
            
            <!------ 查询条件第一行 begin------->

            <!------ 查询条件第二行 begin------->
            
            <Row class="smart-query-form-row" v-show="showMoreQueryConditionFlag">
                 <Col span="2" style="text-align:right; line-height: 30px;">部门简称&nbsp;&nbsp;</Col>
                <Col span="4">
                    <Input placeholder="请输入部门简称" style="width: 180px" v-model="queryForm.shortName" />
                </Col>
                <Col span="2" style="text-align:right; line-height: 30px;">部门负责人&nbsp;&nbsp;</Col>
                <Col span="4">
                    <Input placeholder="请输入部门负责人" style="width: 180px" v-model="queryForm.managerId" />
                </Col>
                <Col span="2" style="text-align:right; line-height: 30px;">部门英文名称&nbsp;&nbsp;</Col>
                <Col span="4">
                    <Input placeholder="请输入部门英文名称" style="width: 180px" v-model="queryForm.engname" />
                </Col>
                </Row>
            </Row>
        </Card>
        
            <!------ 查询条件第二行 end------->
        

        <Card class="warp-card">
            <!-------操作按钮行 begin------->
            
            <Row class="marginBottom10">
                <Button
                        @click="showAddDepartmentForm"
                        icon="md-add"
                        size="small"
                        type="primary"
                        v-privilege="'department-list-add'"
                >新建数据</Button>
                <Button
                        @click="showBatchDeleteModal"
                        class="marginLeft10"
                        icon="ios-trash-outline"
                        size="small"
                        type="error"
                        v-privilege="'department-list-batch-delete'"
                >批量删除</Button>
                <!-- <Button
                        @click="showSetReviewerModal"
                        class="marginLeft10"
                        icon="md-add"
                        size="small"
                        type="info"
                        v-privilege="'department-list-set'"
                >设置审核人</Button> -->


                <!-- <Button
                        :loading="allExportBtnLoading"
                        @click="exportAll"
                        class="marginLeft10 float-right"
                        icon="ios-cloud-download-outline"
                        size="small"
                        type="warning"
                        v-privilege="'department-list-export-all'"
                >导出全部</Button>

                <Button
                        :loading="batchExportBtnLoading"
                        @click="batchExport"
                        class="marginLeft10 float-right"
                        icon="ios-download-outline"
                        size="small"
                        type="warning"
                        v-privilege="'department-list-batch-export'"
                >批量导出</Button> -->

            </Row>
            
            <!-------操作按钮行 end------->

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
            <!-- 部门详情 -->
            <DepartmentDetail ref="departmentTableDetail"></DepartmentDetail>
        </Card>
        
        <!-------表格列表 end------->

        <!-------批量删除Modal begin------->
        
        <Modal title="批量删除" v-model="batchDeleteModal.show" width="450">
            <Form :label-width="80">
                <FormItem>
                    <h3 class="error-color">确定要删除以下数据吗？</h3>
                </FormItem>
                <FormItem label="删除数据">
                    <Card style="width:350px;height:250px;overflow-y:scroll;">
                        <ul>
                            <li v-for="item in mainTableSelectArray">
                            
                                <!-- 根据显示id 或者 name 进行修改-->
                                
                                <a href="#">{{ item.name }}</a>
                            </li>
                        </ul>
                    </Card>
                </FormItem>
            </Form>
            <div slot="footer">
                <Button @click="batchDeleteModal.show = false" size="small" type="default">取消</Button>
                <Button @click="batchDelete" size="small" type="primary">确定删除</Button>
            </div>
        </Modal>
        
        <!-------批量删除Modal end------->

        <!-----设置审核人Modal begin------->
        
        <Modal title="设置审核人" v-model="setReviewerModal.show" width="700">
            
            <EmployeeTable
                      ref="EmployeeTable"
                    ></EmployeeTable>
        </Modal>
        
        <!-------设置审核人Modal end----->

        <!-------添加、更新 Form表单 begin------->
        
        <Modal
                :footer-hide="true"
                :title="saveModal.isUpdate?'更新':'新建'"
                v-model="saveModal.show"
                @on-cancel="saveFormClose"
                width="500"
        >
            <DepartmentListForm
                    :isUpdate="saveModal.isUpdate"
                    :updateData="saveModal.updateData"
                    @on-form-close="saveFormClose"
                    ref="departmentListForm"
            />
        </Modal>
        
        <!-------添加、更新 Form表单 end------->
        
    </div>
</template>


<script>
    import {dateTimeRangeConvert} from '@/lib/util'
    import { PAGE_SIZE_OPTIONS } from '@/constants/table-page';
    import { departmentApi } from '@/api/department';
    import DepartmentListForm from './components/department-list-form';
    import EmployeeTable from './components/chooseReviewer/employee-table.vue';
    import DepartmentDetail from './components/department-list-detail/department-detail.vue';
    const PAGE_SIZE_INIT = 20;
    export default {
        name: 'DepartmentList',
        components: {
            DepartmentListForm,
            EmployeeTable,
            DepartmentDetail
        },
        props: {},
        data() {
            return {
                /* -------------------------添加、更新表单 ------------------------- */
                saveModal: {
                    show: false,
                    isUpdate: false,
                    updateData: null
                },
                /* -------------------------批量操作------------------------- */
                //批量刪除彈出框
                batchDeleteModal: {
                    show: false
                },
                setReviewerModal: {
                    show: false
                },
                //表格多选选中的元素数组
                mainTableSelectArray: [],
                // 部门下的员工数组
                employees: [],
                /* -------------------------导出操作------------------------- */
                //批量导出loading按钮
                batchExportBtnLoading:false,
                //导出全部loading按钮
                allExportBtnLoading:false,
                /* -------------------------查询条件相关数据-------------------- */
                //搜索表单
                queryForm: {
                   //部门主键id
                   id:null,
                   //部门名称
                   name:null,
                   //部门简称
                   shortName:null,
                   //部门负责人id
                   managerId:null,
                   //部门编号
                   code:null,
                   //部门英文名称
                   engname:null,
                    createTimeRange: ["",""],
                    updateTimeRange: ["",""],
                    pageNum: 1,
                    pageSize: PAGE_SIZE_INIT,
                    orders: []
                },
                //是否展示更多搜索条件
                showMoreQueryConditionFlag: false,
                /*  -------------------------表格相关数据------------------------- */
                //表格分页
                mainTablePage: {
                    total: 0,
                    pageSizeOps: PAGE_SIZE_OPTIONS
                },
                //表格
                mainTable: {
                    //加载中
                    loading: false,
                    //表格数据
                    data: [],
                    //表格列
                    columnArray: [
                        {
                            type: 'selection',
                            width: 30,
                            align: 'center'
                        },
                        //                         {
                        //     title: '部门id',
                        //     key: 'id',
                        //     tableColumn: 't_department.id',
                        //     sortable: 'custom'
                        // },
                                                    {
                            title: '部门编号',
                            key: 'code',
                            tableColumn: 't_department.code',
                            //sortable: 'custom'
                        },
                                                {
                            title: '部门名称',
                            key: 'name',
                            tableColumn: 't_department.name',
                            //sortable: 'custom'
                        },
                                                {
                            title: '部门简称',
                            key: 'shortName',
                            tableColumn: 't_department.short_name',
                            //sortable: 'custom'
                        },
                                                {
                            title: '英文名称',
                            key: 'engName',
                            tableColumn: 't_department.engName',
                            //sortable: 'custom'
                        },
                                                {
                            title: '部门负责人',
                            key: 'managerName',
                            //tableColumn: 't_department.manager_id',
                            //sortable: 'custom'
                        },
                                                {
                            title: '操作',
                            key: 'action',
                            align: 'right',
                            width: 130,
                            className: 'action-hide',
                            render: (h, params) => {
                                return h('div', [
                                    h('Button', {
                                        props: {
                                            type: 'info',
                                            size: 'small'
                                        },
                                        style: {
                                            marginRight: '5px'
                                        },
                                        on: {
                                            click: () => {
                                                this.$refs['departmentTableDetail'].showModal(params.row);
                                            }
                                        }
                                    }, '详情'),
                                    h('Button', {
                                        props: {
                                            type: 'primary',
                                            size: 'small'
                                        },
                                        on: {
                                            click: () => {
                                                this.showEditDepartmentForm(params.row);
                                            }
                                        }
                                    }, '编辑')
                                ]);
                            }
                        }
                    ]
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
            convertQueryParam(){
                let createTimeArray = dateTimeRangeConvert(this.queryForm.createTimeRange);
                let updateTimeArray = dateTimeRangeConvert(this.queryForm.updateTimeRange);
                return {...this.queryForm,
                    createTimeBegin:createTimeArray[0],
                    createTimeEnd:createTimeArray[1],
                    updateTimeBegin:updateTimeArray[0],
                    updateTimeEnd:updateTimeArray[1]
                };
            },
            //查询
            async queryList() {
                this.mainTable.loading = true;
                try {
                    let params = this.convertQueryParam();
                    let result = await departmentApi.queryDepartment(params);
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
                    id:null,
                    name:null,
                    shortName:null,
                    managerId:null,
                    code:null,
                    engname:null,
                    createTimeRange: ["",""],
                    updateTimeRange: ["",""],
                    pageNum: 1,
                    pageSize: pageSize,
                    orders: []
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
                if (column.order === 'normal') {
                    this.queryForm.orders = [];
                } else {
                    this.queryForm.orders = [
                        {
                            column: column.column.tableColumn,
                            asc: 'asc' === column.order
                        }
                    ];
                }
                this.queryList();
            },
            /*-------------------------查询相关 end------------------------- */


            /*-------------------------设置审核人操作 bengin-------------------*/
            //显示批量设置审核人弹窗
            // 点击设置审核人按钮触发
            showSetReviewerModal() {

                if (!this.validateMainTableSelection1()) {
                    return;
                }
                // 通过部门id获取相应的所有员工，放在一个数组里
                let id = this.mainTableSelectArray.map(e => e.id);
                this.$refs.EmployeeTable.getEmployees(id);
                this.setReviewerModal.show = true;
            },
  
            //批量设置审核人
            async batchSetReviewer() {
                
                if (!this.validateMainTableSelectio2()) {
                    return;
                }

                this.$Spin.show();

                // 此方法为后端接口 即为完成设置审核人操作的方法
                await departmentApi.setReviewer(
                    this.mainTableSelectArray.map(e => e.id), this.employees.map(e => e.id)
                );
                this.setReviewerModal.show = false;
                this.$Message.success('设置成功');
                this.clearMainTableSelection();
                this.$Spin.hide();
            },
            //清空选中
            clearMainTableSelection() {
                this.mainTableSelectArray = [];
                this.employees = [];
            },
            //校验是否有选中
            validateMainTableSelection1() {
                this.mainTableSelectArray = this.$refs.mainTable.getSelection();
                //console.log(this.mainTableSelectArray);
                if (this.mainTableSelectArray.length != 1) {
                    this.$Message.error('请选择一条数据');
                    return false;
                }
                return true;
            },
             //校验是否有选中员工
            validateMainTableSelectio2() {
                this.employees = this.$refs.EmployeeTable.getSelection();
                if (this.employees.length < 1) {
                    this.$Message.error('请至少选择一条数据');
                    return false;
                }
                return true;
            },
            /*-------------------------设置审核人操作 end-------------------*/

            /*-------------------------批量操作 begin------------------------- */
            //显示批量删除弹窗
            showBatchDeleteModal() {
                if (!this.validateMainTableSelection()) {
                    return;
                }
                this.batchDeleteModal.show = true;
            },
            //批量删除
            async batchDelete() {
                this.$Spin.show();
                await departmentApi.batchDeleteDepartment(
                        this.mainTableSelectArray.map(e => e.id)
                );
                this.batchDeleteModal.show = false;
                this.$Message.success('刪除成功');
                this.clearMainTableSelection();
                this.$Spin.hide();
                this.queryList();
            },
            //清空选中
            // clearMainTableSelection() {
            //     this.mainTableSelectArray = [];
            // },
            //校验是否有选中
            validateMainTableSelection() {
                this.mainTableSelectArray = this.$refs.mainTable.getSelection();
                if (this.mainTableSelectArray.length < 1) {
                    this.$Message.error('请选择至少一条数据');
                    return false;
                }
                return true;
            },
            /*-------------------------批量操作 end------------------------- */

            /*-------------------------导入导出 begin------------------------- */
            //导出全部
            async exportAll(){
                try{
                    this.allExportBtnLoading = true;
                    let params = this.convertQueryParam();
                    await departmentApi.exportAll(params);
                }  catch(e){
                    console.log(e);
                }finally{
                    this.allExportBtnLoading = false;
                }
            },
            //批量导出
            async batchExport(){
                if (!this.validateMainTableSelection()) {
                    return;
                }
                try{
                    this.batchExportBtnLoading = true;
                    await departmentApi.batchExport(this.mainTableSelectArray.map(e => e.id));
                }  catch(e){
                    console.log(e);
                }finally{
                    this.batchExportBtnLoading = false;
                }
            },
            /*-------------------------导入导出 end------------------------- */

            /*-------------------------添加，修改 表单 begin------------------------- */
            //显示添加表单
            showAddDepartmentForm() {
                this.saveModal.isUpdate = false;
                this.saveModal.show = true;
                this.$refs.departmentListForm.getEmployees();
            },
            showEditDepartmentForm(detail){
                this.saveModal.isUpdate =true;
                this.saveModal.updateData = detail;
                this.saveModal.show = true;
                this.$refs.departmentListForm.getEmployees();
            },
            saveFormClose(){
                this.saveModal.show = false;
                this.queryList();
            }
            /*-------------------------添加，修改 表单 end------------------------- */
        }
    };
</script>
