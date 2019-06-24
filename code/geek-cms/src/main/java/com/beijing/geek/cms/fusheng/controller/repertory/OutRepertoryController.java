package com.beijing.geek.cms.fusheng.controller.repertory;

import com.beijing.geek.cms.fusheng.domain.repertory.PartRepertoryRecord;
import com.beijing.geek.cms.fusheng.domain.repertory.PartRepertoryRecordBill;
import com.beijing.geek.cms.fusheng.domain.repertory.PartRepertoryRecordOut;
import com.beijing.geek.cms.fusheng.domain.repertory.RepertoryQueryParam;
import com.beijing.geek.cms.fusheng.service.repertory.RepertoryMntService;
import com.beijing.geek.cms.sys.domain.common.AjaxJson;
import com.beijing.geek.cms.sys.domain.common.ListDataJson;
import com.beijing.geek.cms.sys.domain.user.CmsUser;
import com.beijing.geek.cms.sys.utils.ObjectUtils;
import com.beijing.geek.cms.sys.utils.StringUtil;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

/**
 * 出库管理
 * Created by mazeguo on 2017/7/9.
 */
@Controller
@RequestMapping("/repertory/out/")
public class OutRepertoryController {
    private static final Logger logger = Logger.getLogger(OutRepertoryController.class);
    @Autowired
    private RepertoryMntService repertoryMntService;

    /**
     * 查询客户的配件更换记录
     */
    @RequestMapping("outRepDetailList.ajax")
    @ResponseBody
    public ListDataJson outRepDetailList(CmsUser user, RepertoryQueryParam param) {
        ListDataJson listDataJson = new ListDataJson();
        try {
            param.setRepertoryType(2);//设置为出库
            listDataJson.setPage(param.getPage());
            listDataJson.setLimit(param.getRows());
            Integer totalCount = 0;
            if (param.getcId() != null || param.getRecordId() != null) {
                //分页查询客户更换记录
                totalCount = repertoryMntService.queryRepertoryBillCount(param);
            }
            if (totalCount > 0) {//更换记录不为空
                List<PartRepertoryRecordBill> tbPartlist = repertoryMntService.queryRepertoryBillList(param);
                listDataJson.setList(tbPartlist);
            }
            listDataJson.setRecords(totalCount);
        } catch (Exception e) {
            logger.error("查询客户配件更换记录失败,客户Id [" + param.getcId() + "]", e);
        }
        return listDataJson;
    }

    /**
     * 进入列表
     *
     * @param user
     * @param req
     * @return
     */
    @RequestMapping("index.html")
    public String listHtml(CmsUser user, HttpServletRequest req) {
        return "cms/fusheng/repertory/out/list";
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
            if (StringUtil.isNotEmpty(param.getCustomerKey())) {
                param.setCustomerKey("%" + URLDecoder.decode(param.getCustomerKey(), "utf-8").trim() + "%");
            }
            if (StringUtil.isNotEmpty(param.getSender())) {
                param.setSender("%" + URLDecoder.decode(param.getSender(), "utf-8").trim() + "%");
            }
            //查询数据总量
            Integer totalCount = repertoryMntService.queryOutRepertoryCountByPage(param);
            if (totalCount > 0) {
                //查询数据
                List<PartRepertoryRecordOut> infoStockBills = repertoryMntService.queryOutRepertoryListByPage(param);
                listDataJson.setList(infoStockBills);
            }
            listDataJson.setRecords(totalCount);

        } catch (Exception e) {
            logger.error("查询出库列表失败!", e);
        }
        return listDataJson;
    }

    /**
     * 新增出库
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("add.html")
    public String addHtml(Integer id, Model model) {
        try {
            if (id != null) {
                PartRepertoryRecordOut partRepertoryRecord = repertoryMntService.queryOutRepertoryRecord(id);
                model.addAttribute("record", partRepertoryRecord);
            }
        } catch (Exception e) {
            logger.error("查询出库详情失败!", e);
        }
        return "cms/fusheng/repertory/out/add";
    }

    @ResponseBody
    @RequestMapping("save.ajax")
    public AjaxJson save(CmsUser user, PartRepertoryRecordOut record, String parts) {
        AjaxJson result = new AjaxJson();
        try {
            List<PartRepertoryRecordBill> billList = getOutBill(parts);
            if (parts == null || parts.length() == 0) {
                throw new Exception("配件为空，无法保存!");
            }
            record.setBillList(billList);
            if (record.getId() != null && record.getId() > 0) {//修改
                repertoryMntService.editOutRepertory(record, user.getUserId());
            } else {
                repertoryMntService.saveOutRepertory(record, user.getUserId());
            }
            result.setSuccess(Boolean.TRUE);
            result.setMsg("");
        } catch (Exception e) {
            logger.error("保存出库信息失败，入参：" + ObjectUtils.objToString(record), e);
            result.setSuccess(Boolean.FALSE);
            result.setMsg(e.getMessage());
        }
        return result;
    }

    private List<PartRepertoryRecordBill> getOutBill(String parts) {
        List<PartRepertoryRecordBill> billList = new ArrayList<>();
        if (StringUtil.isNotEmpty(parts)) {
            billList = (List<PartRepertoryRecordBill>) net.sf.json.JSONArray.toCollection(net.sf.json.JSONArray.fromObject(parts), PartRepertoryRecordBill.class);
        }
        return billList;
    }

    /**
     * 修改出库
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("edit.html")
    public String editHtml(Integer id, Model model) {
        try {
            PartRepertoryRecordOut partRepertoryRecord = repertoryMntService.queryOutRepertoryRecord(id);
            model.addAttribute("record", partRepertoryRecord);
            RepertoryQueryParam param = new RepertoryQueryParam();
            param.setRecordId(id);
            param.setRepertoryType(2);//设置为出库
            param.setStart(1);
            param.setLimit(1000);
            List<PartRepertoryRecordBill> billList = repertoryMntService.queryRepertoryBillList(param);
            model.addAttribute("billList", billList);
        } catch (Exception e) {
            logger.error("查询出库详情失败!", e);
        }
        return "cms/fusheng/repertory/out/add";
    }


    /**
     * 进入列表
     *
     * @param id
     * @return
     */
    @RequestMapping("info.html")
    public String infoHtml(Integer id, Model model) {
        try {
            PartRepertoryRecordOut partRepertoryRecord = repertoryMntService.queryOutRepertoryRecord(id);
            RepertoryQueryParam param = new RepertoryQueryParam();
            param.setRecordId(id);
            param.setRepertoryType(2);//设置为出库
            param.setStart(0);
            param.setLimit(1000);
            List<PartRepertoryRecordBill> billList = repertoryMntService.queryRepertoryBillList(param);
            model.addAttribute("billList", billList);
            if (billList != null && billList.size() > 0) {
                Integer totalNum = 0;
                Double totalPrice = 0.0;
                for (PartRepertoryRecordBill bill : billList) {
                    totalNum += bill.getNum();
                    totalPrice += bill.getTotalAmt();
                }
                partRepertoryRecord.setTotalNum(totalNum);
                partRepertoryRecord.setTotalPrice(totalPrice);
            }
            model.addAttribute("record", partRepertoryRecord);
        } catch (Exception e) {
            logger.error("查询出库详情失败!", e);
        }
        return "cms/fusheng/repertory/out/info";
    }


    @ResponseBody
    @RequestMapping("cancelOut.ajax")
    public AjaxJson cancelOut(CmsUser user, PartRepertoryRecord record) {
        AjaxJson result = new AjaxJson();
        try {
            repertoryMntService.cancelOutRepertory(record.getId(), user.getUserId());
            result.setSuccess(Boolean.TRUE);
            result.setMsg("");
        } catch (Exception e) {
            logger.error("撤销出库失败，入参：" + ObjectUtils.objToString(record), e);
            result.setSuccess(Boolean.FALSE);
            result.setMsg(e.getMessage());
        }
        return result;
    }
}
