package com.beijing.geek.cms.fusheng.controller.repertory;

import com.beijing.geek.cms.fusheng.domain.repertory.PartRepertory;
import com.beijing.geek.cms.fusheng.domain.repertory.PartRepertoryRecordBill;
import com.beijing.geek.cms.fusheng.domain.repertory.RepertoryQueryParam;
import com.beijing.geek.cms.fusheng.service.repertory.RepertoryMntService;
import com.beijing.geek.cms.sys.domain.common.ListDataJson;
import com.beijing.geek.cms.sys.domain.user.CmsUser;
import com.beijing.geek.cms.sys.utils.StringUtil;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.net.URLDecoder;
import java.util.List;

/**
 * 入库管理
 *
 * @author wurui
 */
@Controller
@RequestMapping("/repertory/")
public class RepertoryController {
    private static final Logger logger = Logger.getLogger(RepertoryController.class);
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
        return "cms/fusheng/repertory/list";
    }

    /**
     * 查询入库
     */
    @RequestMapping("list.ajax")
    @ResponseBody
    public ListDataJson list(CmsUser user, RepertoryQueryParam param) {
        ListDataJson listDataJson = new ListDataJson();
        try {
            listDataJson.setPage(param.getPage());
            listDataJson.setLimit(param.getRows());
            if (StringUtil.isNotEmpty(param.getPartCode())) {
                param.setPartCode("%" + URLDecoder.decode(param.getPartCode(), "utf-8").trim() + "%");
            }
            if (StringUtil.isNotEmpty(param.getPartName())) {
                param.setPartName("%" + URLDecoder.decode(param.getPartName(), "utf-8").trim() + "%");
            }
            //查询数据总量
            Integer totalCount = repertoryMntService.queryRepertoryCount(param);
            if (totalCount > 0) {
                //查询数据
                List<PartRepertory> infoStockBills = repertoryMntService.queryRepertoryList(param);
                listDataJson.setList(infoStockBills);
            }
            listDataJson.setRecords(totalCount);

        } catch (Exception e) {
            logger.error("查询库存列表失败!", e);
        }
        return listDataJson;
    }


    /**
     * 查询入库
     */
    @RequestMapping("billList.ajax")
    @ResponseBody
    public ListDataJson billList(CmsUser user, RepertoryQueryParam param) {
        ListDataJson listDataJson = new ListDataJson();
        try {
            listDataJson.setPage(param.getPage());
            listDataJson.setPage(param.getPage());
            listDataJson.setLimit(param.getRows());
            //查询数据总量
            Integer totalCount = repertoryMntService.queryRepertoryBillCount(param);
            if (totalCount > 0) {
                //查询数据
                List<PartRepertoryRecordBill> billList = repertoryMntService.queryRepertoryBillList(param);
                listDataJson.setList(billList);
            }
            listDataJson.setRecords(totalCount);

        } catch (Exception e) {
            logger.error("查询库存列表失败!", e);
        }
        return listDataJson;
    }


    /**
     * 进入库存详情
     *
     * @param user
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("info.html")
    public String infoHtml(CmsUser user, Integer id, Model model) {
        try {
            PartRepertory partRepertory = repertoryMntService.findPartRepertoryById(id);
            model.addAttribute("repertory", partRepertory);
        } catch (Exception e) {
            logger.error("查询库存详情失败!", e);
        }
        return "cms/fusheng/repertory/info";
    }


}
