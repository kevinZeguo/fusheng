package com.beijing.geek.cms.fusheng.controller.server;

import com.beijing.geek.cms.fusheng.domain.customer.TbCustomer;
import com.beijing.geek.cms.fusheng.domain.device.TbEquipment;
import com.beijing.geek.cms.fusheng.domain.server.ServerQueryParam;
import com.beijing.geek.cms.fusheng.domain.server.TbServePolling;
import com.beijing.geek.cms.fusheng.service.customer.CustomerService;
import com.beijing.geek.cms.fusheng.service.device.DeviceService;
import com.beijing.geek.cms.fusheng.service.server.ServePollingService;
import com.beijing.geek.cms.sys.domain.common.AjaxJson;
import com.beijing.geek.cms.sys.domain.common.ListDataJson;
import com.beijing.geek.cms.sys.domain.user.CmsUser;
import com.beijing.geek.cms.sys.service.sys.SysRightService;
import com.beijing.geek.cms.sys.utils.ObjectUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by mazeguo on 2017/7/9.
 */
@Controller
@RequestMapping("/serve/polling/")
public class EquipmentPollingController {
    private static final Logger logger = Logger.getLogger(EquipmentPollingController.class);
    @Autowired
    private SysRightService sysRightService;

    @Autowired
    private ServePollingService servePollingService;
    @Autowired
    private CustomerService customerService;
    @Autowired
    private DeviceService deviceService;

    /**
     * 跳转到巡检单信息页
     *
     * @param user
     * @return
     */
    @RequestMapping("index.html")
    public String listHtml(CmsUser user) {
        return "cms/fusheng/server/polling/list";
    }

    /**
     * 取得配件信息列表
     *
     * @param user
     * @param param
     * @return
     */
    @ResponseBody
    @RequestMapping("list.ajax")
    public ListDataJson list(CmsUser user, ServerQueryParam param) {
        ListDataJson partList = new ListDataJson();
        try {
            List<Integer> userIds = sysRightService.getHasDataRightUserList(user.getUserId());
            param.setServiceEngineerList(userIds);
//            //是否为系统管理员权限
//            boolean isAdmin = sysRightService.hasRightByRoleCode(user.getUserId(), "sys_admin");
//            if (!isAdmin) {
//                param.setServiceEngineer(user.getUserId());
//            }
            partList.setPage(param.getPage());
            partList.setLimit(param.getLimit());
            Integer totalCount = servePollingService.queryPollingCountByPage(param);
            if (totalCount > 0) {
                List<TbServePolling> pollingList = servePollingService.queryPollingListByPage(param);
                partList.setList(pollingList);
            }
            partList.setRecords(totalCount);
        } catch (Exception e) {
            logger.error("查询巡检单列表！", e);
        }
        return partList;
    }

    /**
     * 新增设备巡检单
     *
     * @param user
     * @param model
     * @param customerId
     * @param eId
     * @return
     */
    @RequestMapping("add.html")
    public String addHtml(CmsUser user, Model model, Integer customerId, Integer eId, Integer id) {
        try {

            TbServePolling servePolling = servePollingService.findById(id);
            if (servePolling != null) {
                model.addAttribute("polling", servePolling);
                model.addAttribute("customerId", servePolling.getCustomerId());
                model.addAttribute("eId", servePolling.getEqId());
                model.addAttribute("add", "edit");
            } else {
                model.addAttribute("add", "add");
                model.addAttribute("customerId", customerId);
                if (customerId != null) {
                    TbCustomer tbCustomer = customerService.findById(customerId);
                    servePolling = new TbServePolling();
                    if (tbCustomer != null) {
                        servePolling.setcName(tbCustomer.getcName());
                        servePolling.setContact(tbCustomer.getContact());
                        servePolling.setPayAcct(tbCustomer.getPayAcct());
                        servePolling.setAddress(tbCustomer.getAddress());
                        servePolling.setPhone(tbCustomer.getPhone());
                    }
                }
                model.addAttribute("eId", eId);
                if (eId != null) {
                    TbEquipment equipment = deviceService.findById(eId);
                    if (servePolling == null) {
                        servePolling = new TbServePolling();
                    }
                    if (equipment != null) {
                        servePolling.seteCode(equipment.geteCode());
                        servePolling.seteName(equipment.geteName());
                        servePolling.setMakeDate(equipment.getMakeDate());
                        servePolling.seteModel(equipment.geteModel());
                        servePolling.setMotorBrand(equipment.getMotorBrand());
                        servePolling.setMakeNum(equipment.getMakeNum());
                        servePolling.setElecPanModel(equipment.getElecPanModel());
                        servePolling.setMotorMakeDate(equipment.getMotorMakeDate());
                        servePolling.setHostNum(equipment.getHostNum());
                    }
                }
                if (servePolling != null) {
                    model.addAttribute("polling", servePolling);
                }
            }
        } catch (Exception e) {
            logger.error("进入巡检单编辑页面失败！，巡检单编号=【" + id + "】", e);
        }
        return "cms/fusheng/server/polling/add";
    }

    @RequestMapping("edit.html")
    public String editHtml(Integer id, Model model) {
        model.addAttribute("add", "edit");
        try {
            TbServePolling servePolling = servePollingService.findById(id);
            if (servePolling != null) {
                model.addAttribute("polling", servePolling);
                model.addAttribute("customerId", servePolling.getCustomerId());
                model.addAttribute("eId", servePolling.getEqId());
            }
        } catch (Exception e) {
            logger.error("进入巡检单编辑页面失败！，巡检单编号=【" + id + "】", e);
        }
        return "cms/fusheng/server/polling/add";
    }

    @ResponseBody
    @RequestMapping("save.ajax")
    public AjaxJson save(CmsUser user, TbServePolling servePolling) {
        AjaxJson result = new AjaxJson();
        ///tbPart.setpPic(pPic);
        try {
            if (servePolling.getId() != null) {
                servePollingService.editServePolling(servePolling, user.getUserId());
            } else {
                servePollingService.saveServePolling(servePolling, user.getUserId());
            }
            result.setSuccess(Boolean.TRUE);
            result.setMsg("");
        } catch (Exception e) {
            logger.error("保存巡检单详情失败，入参：" + ObjectUtils.objToString(servePolling), e);
            result.setSuccess(Boolean.FALSE);
            result.setMsg(e.getMessage());
        }

        return result;
    }

    @ResponseBody
    @RequestMapping("delete.ajax")
    public AjaxJson delete(Integer id, CmsUser cmsUser) {
        AjaxJson result = new AjaxJson();

        try {
            servePollingService.deleteById(id, cmsUser.getUserId());
            result.setSuccess(Boolean.TRUE);
        } catch (Exception e) {
            logger.error("删除巡检单失败，巡检单编号=【" + id + "】：", e);
            result.setSuccess(Boolean.FALSE);
            result.setMsg(e.getMessage());
        }
        return result;
    }

    @RequestMapping("info.html")
    public String infoHtml(CmsUser user, Integer id, Model model) {
        try {
            TbServePolling servePolling = servePollingService.findById(id);
            if (servePolling != null) {
                model.addAttribute("polling", servePolling);
            }
        } catch (Exception e) {
            // TODO: handle exception
            logger.error("查询巡检单详情失败，巡检单编号=【" + id + "】：", e);
        }
        return "cms/fusheng/server/polling/info";
    }
}
