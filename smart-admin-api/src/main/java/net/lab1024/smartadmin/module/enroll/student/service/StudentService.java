package net.lab1024.smartadmin.module.enroll.student.service;

import cn.afterturn.easypoi.word.WordExportUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mchange.util.StringObjectMap;
import net.lab1024.smartadmin.common.domain.PageResultDTO;
import net.lab1024.smartadmin.common.domain.ResponseDTO;
import net.lab1024.smartadmin.module.enroll.student.dao.StudentDao;
import net.lab1024.smartadmin.module.enroll.student.domain.dto.StudentAddDTO;
import net.lab1024.smartadmin.module.enroll.student.domain.dto.StudentUpdateDTO;
import net.lab1024.smartadmin.module.enroll.student.domain.dto.StudentQueryDTO;
import net.lab1024.smartadmin.module.enroll.student.domain.entity.StudentEntity;
import net.lab1024.smartadmin.module.enroll.student.domain.vo.StudentVO;
import net.lab1024.smartadmin.module.enroll.student.domain.vo.StudentExcelVO;
import net.lab1024.smartadmin.util.RequestUtils;
import net.lab1024.smartadmin.util.SmartPageUtil;
import net.lab1024.smartadmin.util.SmartBeanUtil;
import net.lab1024.smartadmin.util.word.WordUtils;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ResourceUtils;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileNotFoundException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * [  ]
 *
 * @author wang
 * @version 1.0
 * @company 彦致信息
 * @copyright (c)  彦致信息Inc. All rights reserved.
 * @date 2021-06-03 13:38:06
 * @since JDK1.8
 */
@Service
public class StudentService {

    @Autowired
    private StudentDao studentDao;

    /**
     * 根据id查询
     */
    public StudentEntity getById(Long id){
        return  studentDao.selectById(id);
    }

    /**
     * 分页查询
     * @author wang
     * @date 2021-06-03 13:38:06
     */
    public ResponseDTO<PageResultDTO<StudentVO>> queryByPage(StudentQueryDTO queryDTO) {
        Page page = SmartPageUtil.convert2QueryPage(queryDTO);
        IPage<StudentVO> voList = studentDao.queryByPage(page, queryDTO);
        PageResultDTO<StudentVO> pageResultDTO = SmartPageUtil.convert2PageResult(voList);
        return ResponseDTO.succData(pageResultDTO);
    }

    /**
     * 添加
     * @author wang
     * @date 2021-06-03 13:38:06
     */
    public ResponseDTO<String> add(StudentAddDTO addDTO) {
        StudentEntity entity = SmartBeanUtil.copy(addDTO, StudentEntity.class);

        //判断当前身份证号是否已经报名 若已报名 修改原纪录
        StudentVO studentVO = studentDao.getByIdCard(entity.getIdCard());

        if(studentVO != null){
            entity.setId(studentVO.getId());
            entity.setUpdateTime(new Date());
            studentDao.updateById(entity);
        }else {
            entity.setCreateTime(new Date());
            entity.setUpdateTime(new Date());
            studentDao.insert(entity);
        }

        return ResponseDTO.succ();
    }

    /**
     * 编辑
     * @author wang
     * @date 2021-06-03 13:38:06
     */
    @Transactional(rollbackFor = Exception.class)
    public ResponseDTO<String> update(StudentUpdateDTO updateDTO) {
        StudentEntity entity = SmartBeanUtil.copy(updateDTO, StudentEntity.class);
        studentDao.updateById(entity);
        entity.setUpdateTime(new Date());
        return ResponseDTO.succ();
    }

    /**
     * 删除
     * @author wang
     * @date 2021-06-03 13:38:06
     */
    @Transactional(rollbackFor = Exception.class)
    public ResponseDTO<String> deleteByIds(List<Long> idList) {
        studentDao.deleteByIdList(idList);
        return ResponseDTO.succ();
    }

    /**
     * 查询全部导出对象
     * @author wang
     * @date 2021-06-03 13:38:06
     */
    public List<StudentVO> queryAllExportData(StudentQueryDTO queryDTO) {
        return studentDao.queryAllExportData( queryDTO);
    }

    /**
     * 批量查询导出对象
     * @author wang
     * @date 2021-06-03 13:38:06
     */
    public List<StudentExcelVO> queryBatchExportData(List<Long> idList) {
        return studentDao.queryBatchExportData(idList);
    }

    /**
     * 导出word
     * @param studentVOS
     * @param response
     * @param request
     */
    public void exportWord(List<StudentVO> studentVOS, HttpServletResponse response, HttpServletRequest request) {

        String fileName = "新生入学报名登记表";
        List<XWPFDocument> wordList = new ArrayList<>();

        try{
            File file = ResourceUtils.getFile("classpath:templates/word/xsrxbbdjb.docx");

            if(studentVOS != null){
                for (StudentVO studentVO:studentVOS) {
                    Map<String,Object> map = new HashMap<>();
                    map.put("name",getTrimStr(studentVO.getName()+""));
                    map.put("gender",getTrimStr(studentVO.getGenderStr()+""));
                    map.put("birthday",getTrimStr(studentVO.getBirthdayStr()+""));
                    map.put("nation",getTrimStr(studentVO.getNation()+""));
                    map.put("koseki",getTrimStr(studentVO.getKoseki()+""));
                    map.put("address",getTrimStr(studentVO.getAddress()+""));
                    map.put("plotName",getTrimStr(studentVO.getPlotName()+""));
                    map.put("communityName",getTrimStr(studentVO.getCommunityName()+""));
                    map.put("relation",getTrimStr(studentVO.getRelation()+""));
                    map.put("premisesPermitCode",getTrimStr(studentVO.getPremisesPermitCode()+""));
                    map.put("kindergarten",getTrimStr(studentVO.getKindergarten()+""));
                    map.put("idCard",getTrimStr(studentVO.getIdCard()+""));
                    map.put("feature",getTrimStr(studentVO.getFeature()+""));
                    map.put("remark",getTrimStr(studentVO.getRemark()+""));
                    map.put("pName",getTrimStr(studentVO.getNameFather()+""));
                    map.put("pWorkUnit",getTrimStr(studentVO.getWorkUnitFather()+""));
                    map.put("pWorkAddress",getTrimStr(studentVO.getWorkAddressFather()+""));
                    map.put("pWorkTelephone",getTrimStr(studentVO.getWorkTelephoneFather()+""));
                    map.put("pHomePhone",getTrimStr(studentVO.getHomePhoneFather()+""));
                    map.put("pPhone",getTrimStr(studentVO.getPhoneFather()+""));
                    map.put("mName",getTrimStr(studentVO.getNameMather()+""));
                    map.put("mWorkUnit",getTrimStr(studentVO.getWorkUnitMather()+""));
                    map.put("mWorkAddress",getTrimStr(studentVO.getWorkAddressMather()+""));
                    map.put("mWorkTelephone",getTrimStr(studentVO.getWorkTelephoneMather()+""));
                    map.put("mHomePhone",getTrimStr(studentVO.getHomePhoneMather()+""));
                    map.put("mPhone",getTrimStr(studentVO.getPhoneMather()+""));

                    XWPFDocument doc = WordExportUtil.exportWord07(file.getPath(),map);
                    wordList.add(doc);
                }
            }

            XWPFDocument word = WordUtils.mergeWord(wordList);

            fileName += ".docx";
            fileName = RequestUtils.encodeAttachName(request,fileName);
            response.setContentType("multipart/form-data;charset=UTF-8");
            response.setHeader("Content-Disposition","attachment;filename="+ fileName);
            word.write(response.getOutputStream());

        }catch (Exception e){
            e.printStackTrace();
        }

    }

    public String getTrimStr(String str){
        if(StringUtils.isEmpty(str)||"null".equals(str)){
            return "";
        }
        return str.trim();
    }
}
