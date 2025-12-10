package net.lab1024.smartadmin.module.support.codegenerator;

import net.lab1024.smartadmin.BaseTest;
import net.lab1024.smartadmin.module.support.codegenerator.constant.SqlOperateTypeEnum;
import net.lab1024.smartadmin.module.support.codegenerator.domain.CodeGeneratorDTO;
import net.lab1024.smartadmin.module.support.codegenerator.domain.CodeGeneratorQueryColumnDTO;
import net.lab1024.smartadmin.module.support.codegenerator.service.CodeGeneratorService;
import com.google.common.collect.Lists;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * IdGeneratorService Tester.
 *
 * @author zhuoda
 * @version 1.0
 */
public class CodeGeneratorServiceTest extends BaseTest {

    @Autowired
    private CodeGeneratorService codeGeneratorService;

    /*@Test
    public void testGenerate() throws Exception {
        *//**
         * !!! 所有查询条件均包含了createTime和updateTime的 范围查询 !!!
         *//*

        // t_peony 牡丹花表

        //搜索字段 对应QueryDTO
        //搜索字段 kind， 使用like搜索
        CodeGeneratorQueryColumnDTO kind = CodeGeneratorQueryColumnDTO.builder()
                .columnName("kind")
                .sqlOperate(SqlOperateTypeEnum.LIKE).build();
        //搜索字段 kind， 使用 == 搜索
        CodeGeneratorQueryColumnDTO id = CodeGeneratorQueryColumnDTO.builder()
                .columnName("id")
                .sqlOperate(SqlOperateTypeEnum.EQUALS).build();
        //搜索字段 name， 使用like搜索
        CodeGeneratorQueryColumnDTO name = CodeGeneratorQueryColumnDTO.builder()
                .columnName("name")
                .sqlOperate(SqlOperateTypeEnum.LIKE).build();
        //搜索字段 color， 使用like搜索
        CodeGeneratorQueryColumnDTO color = CodeGeneratorQueryColumnDTO.builder()
                .columnName("color")
                .sqlOperate(SqlOperateTypeEnum.LIKE).build();

        List<CodeGeneratorQueryColumnDTO> queryColumnList = Lists.newArrayList(id, kind, name, color);

        CodeGeneratorDTO codeGenerator = CodeGeneratorDTO.builder()
                .author("wang")//class 注释作者
                .company("1024创新实验室( www.1024lab.net )")//class注释公司名字
                .tableName("t_peony")//表名
                .tablePrefix("t_")//表名前缀
                .basePackage("net.lab1024.smartadmin")//包名
                .modulePackage("business.peony")//业务子包名
                .queryColumnList(queryColumnList)//加入搜搜字段
                .build();//构建

        //当需要代码生成的时候，请将注释去掉
        codeGeneratorService.codeGenerator(codeGenerator);
    }*/

//    @Test
//    public void testGenerateNew() throws Exception {
//        /**
//         * !!! 所有查询条件均包含了createTime和updateTime的 范围查询 !!!
//         */
//
//        //搜索字段 对应QueryDTO
//
//        //搜索字段 kind， 使用 == 搜索
//        CodeGeneratorQueryColumnDTO id = CodeGeneratorQueryColumnDTO.builder()
//                .columnName("id")
//                .sqlOperate(SqlOperateTypeEnum.EQUALS).build();
//        //搜索字段 name， 使用like搜索
//        CodeGeneratorQueryColumnDTO name = CodeGeneratorQueryColumnDTO.builder()
//                .columnName("name")
//                .sqlOperate(SqlOperateTypeEnum.LIKE).build();
//
//        CodeGeneratorQueryColumnDTO idCard = CodeGeneratorQueryColumnDTO.builder()
//                .columnName("id_card")
//                .sqlOperate(SqlOperateTypeEnum.EQUALS).build();
//
//        CodeGeneratorQueryColumnDTO phone = CodeGeneratorQueryColumnDTO.builder()
//                .columnName("phone")
//                .sqlOperate(SqlOperateTypeEnum.EQUALS).build();
//
//        CodeGeneratorQueryColumnDTO employeeId = CodeGeneratorQueryColumnDTO.builder()
//                .columnName("employee_id")
//                .sqlOperate(SqlOperateTypeEnum.EQUALS).build();
//
//
//        List<CodeGeneratorQueryColumnDTO> queryColumnList = Lists.newArrayList(id, name, idCard, phone, employeeId);
//
//        CodeGeneratorDTO codeGenerator = CodeGeneratorDTO.builder()
//                .author("wang")//class 注释作者
//                .company("彦致信息")//class注释公司名字
//                .tableName("vis_visitors_record")//表名
//                .tablePrefix("vis_")//表名前缀
//                .basePackage("net.lab1024.smartadmin")//包名
//                .modulePackage("business.visitorManager.visitors")//业务子包名
//                .queryColumnList(queryColumnList)//加入搜搜字段
//                .build();//构建
//
//        //当需要代码生成的时候，请将注释去掉
//        codeGeneratorService.codeGenerator(codeGenerator);
//    }



//    @Test
//    public void testGenerateNew() throws Exception {
//        /**
//         * !!! 所有查询条件均包含了createTime和updateTime的 范围查询 !!!
//         */
//
//        //搜索字段 对应QueryDTO
//
//        //搜索字段 kind， 使用 == 搜索
//        CodeGeneratorQueryColumnDTO id = CodeGeneratorQueryColumnDTO.builder()
//                .columnName("id")
//                .sqlOperate(SqlOperateTypeEnum.EQUALS).build();
//        //搜索字段 name， 使用like搜索
//        CodeGeneratorQueryColumnDTO name = CodeGeneratorQueryColumnDTO.builder()
//                .columnName("name")
//                .sqlOperate(SqlOperateTypeEnum.LIKE).build();
//
//
//        List<CodeGeneratorQueryColumnDTO> queryColumnList = Lists.newArrayList(id, name);
//
//        CodeGeneratorDTO codeGenerator = CodeGeneratorDTO.builder()
//                .author("wang")//class 注释作者
//                .company("彦致信息")//class注释公司名字
//                .tableName("vis_province")//表名
//                .tablePrefix("vis_")//表名前缀
//                .basePackage("net.lab1024.smartadmin")//包名
//                .modulePackage("system.province")//业务子包名
//                .queryColumnList(queryColumnList)//加入搜搜字段
//                .build();//构建
//
//        //当需要代码生成的时候，请将注释去掉
//        codeGeneratorService.codeGenerator(codeGenerator);
//    }


    @Test
    public void testGenerateNew() throws Exception {
        /**
         * !!! 所有查询条件均包含了createTime和updateTime的 范围查询 !!!
         */

        //搜索字段 对应QueryDTO

        //搜索字段 kind， 使用 == 搜索
        CodeGeneratorQueryColumnDTO id = CodeGeneratorQueryColumnDTO.builder()
                .columnName("id")
                .sqlOperate(SqlOperateTypeEnum.EQUALS).build();
        //搜索字段 name， 使用like搜索
        CodeGeneratorQueryColumnDTO name = CodeGeneratorQueryColumnDTO.builder()
                .columnName("name")
                .sqlOperate(SqlOperateTypeEnum.LIKE).build();


        List<CodeGeneratorQueryColumnDTO> queryColumnList = Lists.newArrayList(id, name);

        CodeGeneratorDTO codeGenerator = CodeGeneratorDTO.builder()
                .author("wang")//class 注释作者
                .company("彦致信息")//class注释公司名字
                .tableName("vis_city")//表名
                .tablePrefix("vis_")//表名前缀
                .basePackage("net.lab1024.smartadmin")//包名
                .modulePackage("system.city")//业务子包名
                .queryColumnList(queryColumnList)//加入搜搜字段
                .build();//构建

        //当需要代码生成的时候，请将注释去掉
        codeGeneratorService.codeGenerator(codeGenerator);
    }


}
