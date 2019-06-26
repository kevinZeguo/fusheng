package com.beijing.geek.cms.fusheng.controller.repertory;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.beijing.geek.cms.fusheng.domain.repertory.PartRepertory;
import com.beijing.geek.cms.fusheng.domain.repertory.PartRepertoryRecord;
import com.beijing.geek.cms.fusheng.domain.repertory.PartRepertoryRecordBill;
import com.beijing.geek.cms.fusheng.service.repertory.RepertoryMntService;
import com.beijing.geek.cms.fusheng.utils.CmsDict;
import com.beijing.geek.cms.sys.domain.common.AjaxJson;
import com.beijing.geek.cms.sys.utils.ObjectUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.beijing.geek.cms.fusheng.domain.repertory.RepertoryQueryParam;
import com.beijing.geek.cms.sys.domain.common.ListDataJson;
import com.beijing.geek.cms.sys.domain.user.CmsUser;
import com.beijing.geek.cms.sys.utils.StringUtil;

/**
 * 入库管理
 *
 * @author wurui
 */
@Controller
@RequestMapping("/repertory/in/")
public class InRepertoryController {
    private static final Logger logger = Logger.getLogger(InRepertoryController.class);
    @Autowired
    private RepertoryMntService repertoryMntService;

    /**
     * 进入列表
     *
     * @param user
     * @param req
     * @return
     */
    @RequestMapping("index.html")
    public String listHtml(CmsUser user, HttpServletRequest req) {
        return "cms/fusheng/repertory/in/list";
    }

    /**
     * 查询入库
     */
    @RequestMapping("list.ajax")
    @ResponseBody
    public ListDataJson inRepDetailList(CmsUser user, RepertoryQueryParam param) {
        ListDataJson listDataJson = new ListDataJson();
        try {
            listDataJson.setPage(param.getPage());
            listDataJson.setLimit(param.getLimit());
            if (StringUtil.isNotEmpty(param.getInCode())) {
                param.setInCode("%" + URLDecoder.decode(param.getInCode(), "utf-8").trim() + "%");
            }
            if (StringUtil.isNotEmpty(param.getPartCode())) {
                param.setPartCode("%" + URLDecoder.decode(param.getPartCode(), "utf-8").trim() + "%");
            }
            if (StringUtil.isNotEmpty(param.getPartKey())) {
                param.setPartKey("%" + URLDecoder.decode(param.getPartKey(), "utf-8").trim() + "%");
            }
            if (StringUtil.isNotEmpty(param.getPartName())) {
                param.setPartName("%" + URLDecoder.decode(param.getPartName(), "utf-8").trim() + "%");
            }
            if (StringUtil.isNotEmpty(param.getInDate())) {
                param.setStartDate(param.getInDate() + " 00:00:00");
                param.setEndDate(param.getInDate() + " 23:59:59");
            }
            param.setRepertoryType(CmsDict.Repertory_type_in);
            //查询数据总量
            Integer totalCount = repertoryMntService.queryRepertoryRecordCount(param);
            if (totalCount > 0) {
                //查询数据
                List<PartRepertoryRecord> infoStockBills = repertoryMntService.queryRepertoryRecordList(param);
                listDataJson.setList(infoStockBills);
            }
            listDataJson.setRecords(totalCount);

        } catch (Exception e) {
            logger.error("查询库存列表失败!", e);
        }
        return listDataJson;
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
        return "cms/fusheng/repertory/in/add";
    }


    /**
     * 编辑页面
     *
     * @param id
     * @return
     */
    @RequestMapping("edit.html")
    public String editHtml(Integer id, Model model) {
        model.addAttribute("add", "edit");
        try {
            PartRepertoryRecord repertoryRecord = repertoryMntService.findRecordById(id);
            List<PartRepertoryRecordBill> billList = repertoryMntService.queryRepertoryBillListByRecordId(id);
            if (billList != null && billList.size() > 0) {
                repertoryRecord.setPartId(billList.get(0).getpId());
                repertoryRecord.setpCode(billList.get(0).getpCode());
                repertoryRecord.setpName(billList.get(0).getpName());
                repertoryRecord.setPrice(billList.get(0).getPrice());
                repertoryRecord.setSupplier(billList.get(0).getSupplier());
                repertoryRecord.setNum(billList.get(0).getNum());
            }
            model.addAttribute("record", repertoryRecord);
        } catch (Exception e) {
            logger.error("查询入库详情失败!", e);
        }
        return "cms/fusheng/repertory/in/add";
    }

    @ResponseBody
    @RequestMapping("save.ajax")
    public AjaxJson save(CmsUser user, PartRepertoryRecord record, PartRepertoryRecordBill bill) {
        AjaxJson result = new AjaxJson();
        try {
            List<PartRepertoryRecordBill> billList = new ArrayList<>();
            billList.add(bill);
            record.setBillList(billList);
            if (record.getId() != null) {
                //编辑入库单
                repertoryMntService.editInRepertory(record, user.getUserId());
            } else {//新增入库单
                repertoryMntService.saveInRepertory(record, user.getUserId());
            }
            result.setSuccess(Boolean.TRUE);
            result.setMsg("");
        } catch (Exception e) {
            logger.error("保存入库信息失败，入参：" + ObjectUtils.objToString(record), e);
            result.setSuccess(Boolean.FALSE);
            result.setMsg(e.getMessage());
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("cancelIn.ajax")
    public AjaxJson cancelIn(CmsUser user, PartRepertoryRecord record) {
        AjaxJson result = new AjaxJson();
        try {
            repertoryMntService.cancelInRepertory(record.getId(), user.getUserId());
            result.setSuccess(Boolean.TRUE);
            result.setMsg("");
        } catch (Exception e) {
            logger.error("撤销库存失败，入参：" + ObjectUtils.objToString(record), e);
            result.setSuccess(Boolean.FALSE);
            result.setMsg(e.getMessage());
        }
        return result;
    }


    /**
     * 进入新增页面
     *
     * @param id
     * @return
     */
    @RequestMapping("info.html")
    public String infoHtml(Integer id, Model model) {
        try {
            PartRepertoryRecord repertoryRecord = repertoryMntService.findRecordById(id);
            List<PartRepertoryRecordBill> billList = repertoryMntService.queryRepertoryBillListByRecordId(id);
            if (billList != null && billList.size() > 0) {
                repertoryRecord.setPartId(billList.get(0).getpId());
                repertoryRecord.setpCode(billList.get(0).getpCode());
                repertoryRecord.setpName(billList.get(0).getpName());
                repertoryRecord.setPrice(billList.get(0).getPrice());
                repertoryRecord.setNum(billList.get(0).getNum());
                repertoryRecord.setSupplier(billList.get(0).getSupplier());
                repertoryRecord.setTotalPrice(billList.get(0).getNum() * billList.get(0).getPrice());
            }
            model.addAttribute("record", repertoryRecord);
        } catch (Exception e) {
            logger.error("查询入库详情失败!", e);
        }
        return "cms/fusheng/repertory/in/info";
    }


}
