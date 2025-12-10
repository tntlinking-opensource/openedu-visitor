package net.lab1024.smartadmin.module.business.visitorManager.visitors.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import net.lab1024.smartadmin.common.constant.ResponseCodeConst;
import net.lab1024.smartadmin.common.domain.PageResultDTO;
import net.lab1024.smartadmin.common.domain.ResponseDTO;
import net.lab1024.smartadmin.module.business.visitorManager.reviewer.dao.ReviewerDao;
import net.lab1024.smartadmin.module.business.visitorManager.visitors.dao.VisitorsRecordDao;
import net.lab1024.smartadmin.module.business.visitorManager.visitors.domain.dto.VisitorsRecordAddDTO;
import net.lab1024.smartadmin.module.business.visitorManager.visitors.domain.dto.VisitorsRecordCountQueryDTO;
import net.lab1024.smartadmin.module.business.visitorManager.visitors.domain.dto.VisitorsRecordUpdateDTO;
import net.lab1024.smartadmin.module.business.visitorManager.visitors.domain.dto.VisitorsRecordQueryDTO;
import net.lab1024.smartadmin.module.business.visitorManager.visitors.domain.entity.VisitorsRecordEntity;
import net.lab1024.smartadmin.module.business.visitorManager.visitors.domain.vo.VisitorsRecordVO;
import net.lab1024.smartadmin.module.business.visitorManager.visitors.domain.vo.VisitorsRecordExcelVO;
import net.lab1024.smartadmin.module.system.employee.EmployeeDao;
import net.lab1024.smartadmin.module.system.employee.domain.bo.EmployeeBO;
import net.lab1024.smartadmin.module.system.employee.domain.dto.EmployeeDTO;
import net.lab1024.smartadmin.module.system.employee.domain.vo.EmployeeVO;
import net.lab1024.smartadmin.module.system.login.domain.RequestTokenBO;
import net.lab1024.smartadmin.util.SmartPageUtil;
import net.lab1024.smartadmin.util.SmartBeanUtil;
import net.lab1024.smartadmin.util.SmartRequestTokenUtil;
import net.lab1024.smartadmin.util.encrypt.EncryptUtilForBase64;
import net.lab1024.smartadmin.util.qrCode.TwoDimensionCodeUtil;
import net.lab1024.smartadmin.util.weChat.pushMessage.SendVisitorApplyMsg;
import net.lab1024.smartadmin.util.weChat.pushMessage.SendVisitorApplyShMsg;
import net.lab1024.smartadmin.util.weChat.pushMessage.SendVisitorNoticeMsg;
import org.apache.commons.io.IOUtils;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * [ 访客记录表 ]
 *
 * @author wang
 * @version 1.0
 * @company 彦致信息
 * @copyright (c)  彦致信息Inc. All rights reserved.
 * @date 2021-07-12 09:50:19
 * @since JDK1.8
 */
@Service
public class VisitorsRecordService {

    public final static int VISITOR_SHZT_DSH = 0;
    public final static int VISITOR_SHZT_YTG = 1;
    public final static int VISITOR_SHZT_WTG = -1;

    @Autowired
    private ReviewerDao reviewerDao;

    @Autowired
    private VisitorsRecordDao visitorsRecordDao;

    @Autowired
    private EmployeeDao employeeDao;

    @Value("${file-upload-service.path}")
    private String fileParentPath;

    @Value("${visitor.h5.url:http://localhost:5678/visitor}")
    private String h5Url;

    /**
     * 分页查询
     *
     * @author wang
     * @date 2021-07-12 09:50:19
     */
    public ResponseDTO<PageResultDTO<VisitorsRecordVO>> queryByPage(VisitorsRecordQueryDTO queryDTO) {

        //获取登陆用户信息
        RequestTokenBO requestTokenBO = SmartRequestTokenUtil.getThreadLocalUser();
        if (requestTokenBO != null) {
            EmployeeBO employeeBO = requestTokenBO.getEmployeeBO();
            if (employeeBO != null && !employeeBO.getIsSuperman()) {
                // 不是系统管理员的只能看到自己部门的申请信息
                queryDTO.setDepartmentId(employeeBO.getDepartmentId());
            }
        }


        Page page = SmartPageUtil.convert2QueryPage(queryDTO);
        IPage<VisitorsRecordVO> voList = visitorsRecordDao.queryByPage(page, queryDTO);
        PageResultDTO<VisitorsRecordVO> pageResultDTO = SmartPageUtil.convert2PageResult(voList);

        return ResponseDTO.succData(pageResultDTO);
    }

    /**
     * 添加
     *
     * @author wang
     * @date 2021-07-12 09:50:19
     */
    public ResponseDTO<String> add(VisitorsRecordAddDTO addDTO) {
        VisitorsRecordEntity entity = SmartBeanUtil.copy(addDTO, VisitorsRecordEntity.class);
        entity.setShzt(VISITOR_SHZT_DSH);
        entity.setCreateTime(new Date());
        entity.setUpdateTime(new Date());
        //对身份证号码 手机号码进行加密
        entity.setIdCard(EncryptUtilForBase64.encode(entity.getIdCard()));
        entity.setPhone(EncryptUtilForBase64.encode(entity.getPhone()));
        visitorsRecordDao.insert(entity);
        //获取部门下审核人信息
        List<EmployeeVO> employeeVOS = reviewerDao.getShrByDeptId(entity.getDepartmentId());

        //推送消息到公众平台

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        if (employeeVOS != null && employeeVOS.size() != 0) {
            for (EmployeeVO employeeVO : employeeVOS) {
                try {
                    SendVisitorApplyMsg.send_template_message(
                            employeeVO.getOpenid(),
                            entity.getName(),
                            entity.getRemark(),
                            sdf.format(entity.getVisitorsTime()),
                            entity.getPhone(),
                            entity.getCompanyName()
                    );
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }

        return ResponseDTO.succ();
    }

    /**
     * 编辑
     *
     * @author wang
     * @date 2021-07-12 09:50:19
     */
    @Transactional(rollbackFor = Exception.class)
    public ResponseDTO<String> update(VisitorsRecordUpdateDTO updateDTO) {
        VisitorsRecordEntity entity = SmartBeanUtil.copy(updateDTO, VisitorsRecordEntity.class);
        visitorsRecordDao.updateById(entity);
        return ResponseDTO.succ();
    }

    /**
     * 删除
     *
     * @author wang
     * @date 2021-07-12 09:50:19
     */
    @Transactional(rollbackFor = Exception.class)
    public ResponseDTO<String> deleteByIds(List<Long> idList) {
        visitorsRecordDao.deleteByIdList(idList);
        return ResponseDTO.succ();
    }

    /**
     * 查询全部导出对象
     *
     * @author wang
     * @date 2021-07-12 09:50:19
     */
    public List<VisitorsRecordExcelVO> queryAllExportData(VisitorsRecordQueryDTO queryDTO) {
        return visitorsRecordDao.queryAllExportData(queryDTO);
    }

    /**
     * 批量查询导出对象
     *
     * @author wang
     * @date 2021-07-12 09:50:19
     */
    public List<VisitorsRecordExcelVO> queryBatchExportData(List<Long> idList) {
        return visitorsRecordDao.queryBatchExportData(idList);
    }

    public ResponseDTO<String> updateById(VisitorsRecordUpdateDTO updateDTO) {

        //生成一人一码
        generateQrCode(updateDTO);
        visitorsRecordDao.update(updateDTO.getId(), updateDTO.getShzt(), updateDTO.getShyj(), updateDTO.getQrCode());

        ResponseDTO<VisitorsRecordVO> visitorsRecordVO = getById(updateDTO.getId());

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //通知家长审核结果
        try {
            if (visitorsRecordVO.getData() != null) {
                VisitorsRecordVO data = visitorsRecordVO.getData();
                //公众号消息提醒
                String firstStr = "未通过";
                if (updateDTO.getShzt() == 1) {
                    firstStr = "已通过";
                }
                firstStr = "您的申请" + firstStr;

                //通知家长审核结果
                SendVisitorApplyShMsg.send_template_message(
                        data.getOpenid(),
                        firstStr,
                        simpleDateFormat2.format(new Date()),
                        data.getName(),
                        data.getCompanyName(),
                        simpleDateFormat.format(data.getVisitorsTime()),
                        data.getRemark()
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        //通知被访问教师
        try {
            if (visitorsRecordVO.getData() != null) {
                VisitorsRecordVO data = visitorsRecordVO.getData();
                //公众号消息提醒
                if (updateDTO.getShzt() == 1) {
                    //通知被访问教师
                    Long employeeId = visitorsRecordVO.getData().getEmployeeId();
                    EmployeeDTO employeeDTO = employeeDao.getEmployeeById(employeeId);
                    SendVisitorNoticeMsg.send_template_message(
                            employeeDTO.getOpenid(),
                            "您有一条新的来访通知",
                            data.getName(),
                            data.getRemark(),
                            simpleDateFormat2.format(data.getVisitorsTime())
                    );

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return ResponseDTO.succ();
    }

    public ResponseDTO<List<VisitorsRecordVO>> getByOpenId(String openId) {
        List list = visitorsRecordDao.getByOpenId(openId);
        return ResponseDTO.succData(list);
    }

    public ResponseDTO<VisitorsRecordVO> getById(Long id) {
        return ResponseDTO.succData(visitorsRecordDao.getById(id));

    }


    public ResponseDTO<Integer> getApplyCount(String openId) {
        return ResponseDTO.succData(visitorsRecordDao.getApplyCount(openId));
    }

    public XSSFWorkbook getWorkbook(VisitorsRecordQueryDTO visitorsRecordQueryDTO) {
        List<VisitorsRecordExcelVO> recordVOList = visitorsRecordDao.queryAllExportData(visitorsRecordQueryDTO);

        XSSFWorkbook workbook = new XSSFWorkbook();
        XSSFSheet sheet = workbook.createSheet();

        sheet.setColumnWidth(0, 15 * 256);
        sheet.setColumnWidth(1, 15 * 256);
        sheet.setColumnWidth(2, 15 * 256);
        sheet.setColumnWidth(3, 8 * 256);
        sheet.setColumnWidth(4, 20 * 256);
        sheet.setColumnWidth(5, 20 * 256);
        sheet.setColumnWidth(6, 30 * 256);
        sheet.setColumnWidth(7, 10 * 256);
        sheet.setColumnWidth(9, 25 * 256);
        sheet.setColumnWidth(10, 15 * 256);
        sheet.setColumnWidth(11, 10 * 256);
        sheet.setColumnWidth(12, 15 * 256);
        sheet.setColumnWidth(13, 25 * 256);
        sheet.setColumnWidth(14, 15 * 256);

        XSSFFont fontT1 = workbook.createFont();
        fontT1.setFontName("微软雅黑");
        fontT1.setFontHeightInPoints((short) 12);
        XSSFCellStyle titleStyle1 = workbook.createCellStyle();
        titleStyle1.setFont(fontT1);
        titleStyle1.setAlignment(HorizontalAlignment.CENTER);
        titleStyle1.setVerticalAlignment(VerticalAlignment.CENTER);
        titleStyle1.setWrapText(true);

        XSSFFont titleFont = workbook.createFont();
        titleFont.setFontHeightInPoints((short) 10);
        titleFont.setColor(new XSSFColor(java.awt.Color.white));
        titleFont.setFontName("微软雅黑");
        XSSFCellStyle titleStyle = workbook.createCellStyle();
        titleStyle.setFont(titleFont);
        titleStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        titleStyle.setFillForegroundColor(new XSSFColor(new java.awt.Color(71, 119, 231)));
        titleStyle.setAlignment(HorizontalAlignment.CENTER);
        titleStyle.setVerticalAlignment(VerticalAlignment.CENTER);
        titleStyle.setWrapText(true);

        XSSFFont font = workbook.createFont();
        font.setFontName("微软雅黑");
        font.setFontHeightInPoints((short) 10);
        XSSFCellStyle cellStyle = workbook.createCellStyle();
        cellStyle.setFont(font);
        cellStyle.setAlignment(HorizontalAlignment.CENTER);
        cellStyle.setVerticalAlignment(VerticalAlignment.CENTER);
        cellStyle.setWrapText(true);

        String[] titleArr = new String[]{
                "姓名", "电话", "省份", "城市", "身份证号", "公司", "情况说明",
                "是否发热", "访校时间", "部门",
                "教师", "访校原因", "审核状态", "审核意见"
        };

        int num = 0;
        XSSFRow row = sheet.createRow(num);
        row.setHeight((short) 500);
        for (int i = 0; i < titleArr.length; i++) {
            row.createCell(i).setCellStyle(titleStyle1);
        }

        sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 14));
        row.getCell(0).setCellValue("访校审核记录表");

        num++;

        row = sheet.createRow(num);
        for (int i = 0; i < titleArr.length; i++) {
            row.createCell(i).setCellStyle(titleStyle);
            row.getCell(i).setCellValue(titleArr[i]);
        }

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        for (VisitorsRecordExcelVO visitorsRecordExcelVO : recordVOList) {

            num++;
            row = sheet.createRow(num);
            for (int i = 0; i < titleArr.length; i++) {
                row.createCell(i).setCellStyle(cellStyle);
                row.getCell(i).setCellValue(titleArr[i]);
            }

            String qksm = "";
            String isFr = "";
            String shzt = "";
            if (visitorsRecordExcelVO.getSpecialCase() == 1) {
                qksm = "未离开上海/抵达上海14天以上";
            } else {
                qksm = "抵达上海不满14天";
            }
            if (visitorsRecordExcelVO.getIsFr() == 0) {
                isFr = "否";
            } else {
                isFr = "是";
            }
            if (visitorsRecordExcelVO.getShzt() == -1) {
                shzt = "未通过";
            } else if (visitorsRecordExcelVO.getShzt() == 0) {
                shzt = "待审核";
            } else if (visitorsRecordExcelVO.getShzt() == 1) {
                shzt = "已通过";
            }
            row.getCell(0).setCellValue(getTrimStr(visitorsRecordExcelVO.getName() + ""));
            row.getCell(1).setCellValue(getTrimStr(visitorsRecordExcelVO.getPhone() + ""));
            row.getCell(2).setCellValue(getTrimStr(visitorsRecordExcelVO.getProvinceName() + ""));
            row.getCell(3).setCellValue(getTrimStr(visitorsRecordExcelVO.getCityName() + ""));
            row.getCell(4).setCellValue(getTrimStr(visitorsRecordExcelVO.getIdCard() + ""));
            row.getCell(5).setCellValue(getTrimStr(visitorsRecordExcelVO.getCompanyName() + ""));
            //修改 情况说明 发热 承诺字段
            row.getCell(6).setCellValue(getTrimStr(qksm + ""));
            row.getCell(7).setCellValue(getTrimStr(isFr + ""));

            row.getCell(8).setCellValue(getTrimStr(sdf.format(visitorsRecordExcelVO.getVisitorsTime()) + ""));
            row.getCell(9).setCellValue(getTrimStr(visitorsRecordExcelVO.getDepartmentName() + ""));
            row.getCell(10).setCellValue(getTrimStr(visitorsRecordExcelVO.getEmployeeName() + ""));
            row.getCell(11).setCellValue(getTrimStr(visitorsRecordExcelVO.getRemark() + ""));
            // 审核状态字段要修改
            row.getCell(12).setCellValue(shzt);

            row.getCell(13).setCellValue(getTrimStr(visitorsRecordExcelVO.getShyj() + ""));
        }
        return workbook;
    }

    private String getTrimStr(String str) {
        if (StringUtils.isEmpty(str) || "null".equals(str)) {
            return "";
        }
        return str.trim();
    }

    public ResponseDTO<String> uploadItineraryCode(MultipartFile multipartFile) {

        OutputStream os = null;
        InputStream is = null;

        String filePath = fileParentPath + "itineraryCode/";
        File directory = new File(filePath);
        if (!directory.exists()) {
            // 目录不存在，新建
            directory.mkdirs();
        }

        String fileName = UUID.randomUUID().toString().replaceAll("-", "") + ".png";

        //下载文件到指定目录
        try {
            is = multipartFile.getInputStream();
            os = new FileOutputStream(filePath + fileName);
            os.write(IOUtils.toByteArray(is));

        } catch (Exception e) {
            e.printStackTrace();
            return ResponseDTO.wrap(ResponseCodeConst.SYSTEM_ERROR);
        } finally {
            IOUtils.closeQuietly(os);
        }

        return ResponseDTO.succData(fileName);
    }

    public void downloadImg(String fileName, HttpServletResponse response) {
        OutputStream os = null;
        InputStream is = null;

        String filePath = fileParentPath + "itineraryCode/" + fileName;
        try {
            is = new FileInputStream(filePath);
            os = response.getOutputStream();
            os.write(IOUtils.toByteArray(is));
            response.setContentType("image/png");
            os.flush();
        } catch (Exception e) {
            e.printStackTrace();
            IOUtils.closeQuietly(os);
            IOUtils.closeQuietly(is);
        }
    }

    /**
     * 生成一人一码
     *
     * @return
     */
    public void generateQrCode(VisitorsRecordUpdateDTO updateDTO) {
        OutputStream os = null;
        InputStream is = null;
        try {
            String filePath = fileParentPath + "itineraryCode/";
            File directory = new File(filePath);
            if (!directory.exists()) {
                // 目录不存在，新建
                directory.mkdirs();
            }

            String fileName = UUID.randomUUID().toString().replaceAll("-", "") + ".png";

            String content = h5Url + "/#/visitorManage/visitorConfirm/" + updateDTO.getId();
            String path = filePath + fileName;

            //二维码背景颜色 默认白色
            int backColor = 0xFFFFFF;
            //二维码主体颜色 红色
            int foreColor = 0xFF0000;

            if (updateDTO.getShzt() == 1) {
                //审核通过 生成绿码
                foreColor = 0x008000;
            }
            //生成二维码
            TwoDimensionCodeUtil.stringToImage(content, path, 500, 500, backColor, foreColor);
            updateDTO.setQrCode(fileName);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 清除时间超过上传时间超过30天的行程码、健康码
     */
    //@Scheduled(cron = "0/5 * * * * ?")
    @Scheduled(cron = "0 0 12 * * ?")
    public void clearHealthCodeAndItineraryCode() {

        Calendar cal = Calendar.getInstance();
        //获取上个月的日期（上个月的今天）
        cal.setTime(new Date());
        cal.add(Calendar.MONTH, -1);
        Date date = cal.getTime();

        //获取所有访客信息
        List<VisitorsRecordVO> visitorsRecordVOS = visitorsRecordDao.getAll();
        if (visitorsRecordVOS != null && visitorsRecordVOS.size() != 0) {
            for (VisitorsRecordVO visitorsRecordVO : visitorsRecordVOS) {
                if (visitorsRecordVO.getCreateTime() == null) {
                    continue;
                }
                //时间超过一个月删除行程码 健康码
                if (visitorsRecordVO.getCreateTime().getTime() < date.getTime()) {
                    String itineraryCode = visitorsRecordVO.getItineraryCode();
                    String healthCode = visitorsRecordVO.getHealthCode();

                    String itineraryCodeFilePath = fileParentPath + "itineraryCode/" + itineraryCode;
                    String healthCodeFilePath = fileParentPath + "itineraryCode/" + healthCode;
                    File itineraryCodeFile = new File(itineraryCodeFilePath);
                    File healthCodeFile = new File(healthCodeFilePath);
                    if (itineraryCodeFile.exists()) {
                        itineraryCodeFile.delete();
                    }
                    if (healthCodeFile.exists()) {
                        healthCodeFile.delete();
                    }
                }
            }
        }
    }

    /**
     * 访客确认 保安扫码
     *
     * @param id
     * @param temp
     * @return
     */
    public ResponseDTO<String> confirm(Long id, String temp) {
        try {
            if (id != null) {
                visitorsRecordDao.updateTemp(id, temp);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseDTO.wrap(ResponseCodeConst.SYSTEM_ERROR);
        }


        return ResponseDTO.succ();
    }

    /**
     * 访客确认 保安扫码
     *
     * @param id
     * @param temp
     * @return
     */
    public ResponseDTO<Map<String, Object>> visitorCount(VisitorsRecordCountQueryDTO countQueryDTO) {
        Map<String, Object> maps = new LinkedHashMap<>();
        List<VisitorsRecordVO> visitorsRecordVOS = visitorsRecordDao.visitorCount(countQueryDTO);

        Map<String, Integer> hjMap = new HashMap<>();
        hjMap.put("count", 0);
        hjMap.put("num1", 0);
        hjMap.put("num2", 0);
        hjMap.put("num3", 0);
        hjMap.put("num4", 0);


        if (visitorsRecordVOS != null && visitorsRecordVOS.size() != 0) {
            for (VisitorsRecordVO visitorsRecordVO : visitorsRecordVOS) {
                String departmentName = visitorsRecordVO.getDepartmentName();
                Integer shzt = visitorsRecordVO.getShzt();
                Integer affirmStatus = visitorsRecordVO.getAffirmStatus();
                if (!maps.containsKey(departmentName)) {
                    Map<String, Integer> map = new HashMap<>();
                    //申请总数
                    map.put("count", 0);
                    //通过人数
                    map.put("num1", 0);
                    //未通过人数
                    map.put("num2", 0);
                    //待审核人数
                    map.put("num3", 0);
                    //确认人数
                    map.put("num4", 0);
                    maps.put(departmentName, map);
                }
                Map<String, Integer> map = (Map<String, Integer>) maps.get(departmentName);
                map.put("count", map.get("count") + 1);
                hjMap.put("count", hjMap.get("count") + 1);
                if (1 == shzt) {
                    map.put("num1", map.get("num1") + 1);
                    hjMap.put("num1", hjMap.get("num1") + 1);
                } else if (-1 == shzt) {
                    map.put("num2", map.get("num2") + 1);
                    hjMap.put("num2", hjMap.get("num2") + 1);
                } else if (0 == shzt) {
                    map.put("num3", map.get("num3") + 1);
                    hjMap.put("num3", hjMap.get("num3") + 1);
                }
                if (affirmStatus != null && 1 == affirmStatus) {
                    map.put("num4", map.get("num4") + 1);
                    hjMap.put("num4", hjMap.get("num4") + 1);
                }
                maps.put(departmentName, map);
            }
        }
        maps.put("合计", hjMap);
        return ResponseDTO.succData(maps);
    }
}
