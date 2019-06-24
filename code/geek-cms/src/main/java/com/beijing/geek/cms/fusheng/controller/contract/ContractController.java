package com.beijing.geek.cms.fusheng.controller.contract;

import java.io.OutputStream;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.beans.factory.annotation.Autowired;
import com.alibaba.fastjson.JSONObject;
import com.beijing.geek.cms.fusheng.domain.contract.ContractQueryParam;
import com.beijing.geek.cms.fusheng.domain.contract.TbContract;
import com.beijing.geek.cms.fusheng.domain.customer.TbCustomer;
import com.beijing.geek.cms.fusheng.service.contract.ContractService;
import com.beijing.geek.cms.sys.domain.common.AjaxJson;
import com.beijing.geek.cms.sys.domain.common.ListDataJson;
import com.beijing.geek.cms.sys.domain.user.CmsUser;
import com.beijing.geek.cms.sys.domain.user.SysUser;
import com.beijing.geek.cms.sys.utils.ObjectUtils;
import com.beijing.geek.cms.sys.utils.StringUtil;


/**
 * Created by zhangyongquan on 2017/6/7.
 */
@Controller
@RequestMapping("/contract/")
public class ContractController {
    private static final Logger logger = Logger.getLogger(ContractController.class);
    @Autowired
    private ContractService contractService;

    @RequestMapping("index.html")
    public String contractHtml(HttpServletRequest req) {
        return "cms/fusheng/contract/list";
    }

    /**
     * 合同 查询列表页面
     *
     * @param user
     * @return
     */
    @ResponseBody
    @RequestMapping("list.ajax")
    public ListDataJson list(CmsUser user, ContractQueryParam param) {
        ListDataJson contrListData = new ListDataJson();
        try {
            if (StringUtil.isNotEmpty(param.getContractCode())) {
                param.setContractCode("%" + URLDecoder.decode(param.getContractCode(), "utf-8").trim() + "%");
            }
            if (StringUtil.isNotEmpty(param.getCustomerName())) {
                param.setCustomerName("%" + URLDecoder.decode(param.getCustomerName(), "utf-8").trim() + "%");
            }
            contrListData.setPage(param.getPage());
            contrListData.setLimit(param.getLimit());

            //查询数据总量
            Integer totalCount = contractService.queryContractCountByPage(param);
            if (totalCount > 0) {
                //查询数据
                List<TbContract> fsContractList = contractService.queryContractListByPage(param);
                contrListData.setList(fsContractList);
            }
            contrListData.setRecords(totalCount);
        } catch (Exception e) {
            logger.error("查询合同列表失败!", e);
        }
        return contrListData;
    }

    /**
     * 进入新增页面
     *
     * @param user
     * @return
     */
    @RequestMapping("add.html")
    public String addHtml(CmsUser user, Model model) {
        model.addAttribute("add", "add");
        return "cms/fusheng/contract/add";
    }

    @RequestMapping("edit.html")
    public String editHtml(CmsUser user, HttpServletRequest req, Integer id, Model model) {
        model.addAttribute("add", "edit");
        try {
            TbContract tbContract = contractService.queryById(id);
            if (tbContract != null) {
                model.addAttribute("contract", tbContract);
                model.addAttribute("customerId", tbContract.getcId());
            }
        } catch (Exception e) {
            logger.error("进入合同编辑页面失败，合同Id【" + id + "】", e);
        }
        return "cms/fusheng/contract/add";
    }

    /**
     * 保存用户合同信息
     *
     * @param user
     * @return
     */
    @ResponseBody
    @RequestMapping("save.ajax")
    public AjaxJson save(CmsUser user, TbContract contract, Integer cId) {
        AjaxJson result = new AjaxJson();
        try {
            contract.setcId(cId);
            if (contract.getId() != null) {//修改
                contractService.editContract(contract, user.getUserId());
            } else {
                contractService.addContract(contract, user.getUserId());
            }
            result.setSuccess(Boolean.TRUE);
            result.setMsg("");
        } catch (Exception e) {
            logger.error("保存合同信息失败，入参：" + ObjectUtils.objToString(contract), e);
            result.setSuccess(Boolean.FALSE);
            result.setMsg(e.getMessage());
        }
        return result;
    }

    /**
     * 客户详情页面
     *
     * @return
     */
    @ResponseBody
    @RequestMapping("delete.ajax")
    public AjaxJson delete(Integer cId, HttpServletRequest request) {
        CmsUser cmsUser = (CmsUser) request.getAttribute("cmsUser");
        AjaxJson result = new AjaxJson();
        try {
            contractService.deleteById(cId, cmsUser.getUserId());
            result.setSuccess(Boolean.TRUE);

        } catch (Exception e) {
            logger.error("删除合同信息失败，合同Id【" + cId + "】：", e);
            result.setSuccess(Boolean.FALSE);
        }
        return result;
    }

    /**
     * 合同详情页面
     *
     * @param user
     * @return
     */
    @RequestMapping("info.html")
    public String infoHtml(CmsUser user, Integer id, Model model) {
        try {
            TbContract tbContract = contractService.queryById(id);
            if (tbContract != null) {
                model.addAttribute("contract", tbContract);
            }
        } catch (Exception e) {
            logger.error("查询合同信息失败，合同Id【" + id + "】：", e);
        }
        return "cms/fusheng/contract/info";
    }

    /**
     * 客户详情页面
     *
     * @return
     */
    @ResponseBody
    @RequestMapping("findById.ajax")
    public AjaxJson findById(Integer cId, HttpServletRequest request) {
        AjaxJson result = new AjaxJson();
        try {
            TbContract contract = contractService.findById(cId);
            result.setSuccess(Boolean.TRUE);
            result.setObj(contract);
        } catch (Exception e) {
            logger.error("查询合同详情失败，合同Id【" + cId + "】：", e);
            result.setSuccess(Boolean.FALSE);
        }
        return result;
    }

    /**
     * 合同 查询列表页面
     *
     * @param user
     * @return
     */
    @RequestMapping("export.html")
    public void export(CmsUser user, ContractQueryParam param, HttpServletRequest request, HttpServletResponse response) {
        OutputStream outputStream = null;
        SXSSFWorkbook wb = null;
        try {
            if (StringUtil.isNotEmpty(param.getContractCode())) {
                param.setContractCode("%" + URLDecoder.decode(param.getContractCode(), "utf-8").trim() + "%");
            }
            if (StringUtil.isNotEmpty(param.getCustomerName())) {
                param.setCustomerName("%" + URLDecoder.decode(param.getCustomerName(), "utf-8").trim() + "%");
            }
            // 创建Excel工作簿和工作表表头
            wb = new SXSSFWorkbook(500);
            Sheet sh = wb.createSheet("合同列表");
            String[] headers = new String[]{"客户名称", "合同编号(甲方)", "合同编号(乙方)", "合同类型", "价格", "是否已回款", "是否发货", "是否已开发票"};
            Row header = sh.createRow(0);
            // 设置表头样式和字体
            CellStyle style = wb.createCellStyle();
            style.setFillForegroundColor(HSSFColor.LIGHT_YELLOW.index);
            style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
            style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
            style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
            style.setBorderRight(HSSFCellStyle.BORDER_THIN);
            style.setBorderTop(HSSFCellStyle.BORDER_THIN);
            style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
            Font font = wb.createFont();
            font.setColor(HSSFColor.BLACK.index);
            font.setFontHeightInPoints((short) 11);
            font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
            style.setFont(font);
            // 设置表头
            for (int i = 0; i < headers.length; i++) {
                Cell cell = header.createCell(i);
                cell.setCellType(Cell.CELL_TYPE_STRING);
                cell.setCellStyle(style);
                cell.setCellValue(headers[i]);
            }

            //查询合同列表
            param.setStart(0);
            param.setLimit(100000);
            List<TbContract> fsContractList = contractService.queryContractListByPage(param);
            if (fsContractList != null && fsContractList.size() > 0) {
                for (int i = 0; i < fsContractList.size(); i++) {
                    TbContract contract = fsContractList.get(i);
                    Row row = sh.createRow(i + 1);
                    String[] rowData = new String[headers.length];
                    rowData[0] = contract.getcName(); // 客户名称
                    rowData[1] = contract.getaCode();
                    rowData[2] = contract.getbCode();
                    rowData[3] = contract.getType() == 1 ? "采购合同" : "销售合同";
                    rowData[4] = contract.getPrice() + "";
                    rowData[5] = contract.getIsCashBack() == 1 ? "是" : "否";
                    rowData[6] = contract.getIsSendGoods() == 1 ? "是" : "否";
                    rowData[7] = contract.getIsOpenInvoice() == 1 ? "是" : "否";
                    for (int j = 0; j < rowData.length; j++) {
                        Cell cell = row.createCell(j);
                        cell.setCellType(Cell.CELL_TYPE_STRING);
                        cell.setCellValue(rowData[j]);
                    }
                }
            }
            outputStream = response.getOutputStream();
            response.setContentType("application/x-msdownload");
            response.setHeader("Content-disposition", "attachment;" + "filename=" + new String("合同列表".getBytes("GBK"), "ISO8859-1") + System.currentTimeMillis() + ".xlsx");
            wb.write(outputStream);
            outputStream.flush();

        } catch (Exception e) {
            logger.error("导出合同列表到Excel出现问题。", e);
        } finally {
            if (outputStream != null) {
                try {
                    outputStream.close();
                } catch (Exception e) {
                    logger.error("关闭文件流失败!", e);
                }
            }
            if (wb != null) {
                wb.dispose();
            }
        }
        logger.info("导出合同列表成功！");
    }


    private String dataToString(Object obj, String defaultValue) {
        if (obj == null) return defaultValue;
        return obj.toString();
    }

}
