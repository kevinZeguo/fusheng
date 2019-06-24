package com.beijing.geek.cms.fusheng.controller.server;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.beijing.geek.cms.fusheng.domain.customer.TbCustomer;
import com.beijing.geek.cms.fusheng.domain.server.ServerQueryParam;
import com.beijing.geek.cms.fusheng.service.customer.CustomerService;
import com.beijing.geek.cms.fusheng.service.device.DeviceService;
import com.beijing.geek.cms.sys.domain.common.SysAttrValue;
import com.beijing.geek.cms.sys.service.common.SysAttrService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.beijing.geek.cms.fusheng.domain.device.TbEquipment;
import com.beijing.geek.cms.fusheng.domain.server.TbMaintenance;
import com.beijing.geek.cms.fusheng.service.server.MaintenanceService;
import com.beijing.geek.cms.sys.domain.common.AjaxJson;
import com.beijing.geek.cms.sys.domain.common.ListDataJson;
import com.beijing.geek.cms.sys.domain.user.CmsUser;
import com.beijing.geek.cms.sys.service.sys.SysRightService;
import com.beijing.geek.cms.sys.utils.ObjectUtils;

/**
 * Created by mazeguo on 2017/7/9.
 */
@Controller
@RequestMapping("/server/maintenance/")
public class EquipmentMaintenanceController {
    private static final Logger logger = Logger.getLogger(EquipmentMaintenanceController.class);
    @Autowired
    private SysRightService sysRightService;

    @Autowired
    private MaintenanceService mainService;
    @Autowired
    private CustomerService customerService;
    @Autowired
    private DeviceService deviceService;

    @Autowired
    private SysAttrService sysAttrService;

    /**
     * 跳转到维保信息页
     *
     * @param user
     * @param req
     * @return
     */
    @RequestMapping("index.html")
    public String listHtml(CmsUser user, HttpServletRequest req) {
        return "cms/fusheng/server/maintenance/list";
    }

    /**
     * 查询
     *
     * @param user
     * @param param
     * @return
     */
    @ResponseBody
    @RequestMapping("list.ajax")
    public ListDataJson list(CmsUser user, ServerQueryParam param) {
        ListDataJson listData = new ListDataJson();
        try {
            listData.setPage(param.getPage());
            listData.setLimit(param.getLimit());

            List<Integer> userIds = sysRightService.getHasDataRightUserList(user.getUserId());
            param.setServiceEngineerList(userIds);
//            //是否为系统管理员权限
//            boolean isAdmin = sysRightService.hasRightByRoleCode(user.getUserId(), "sys_admin");
//            if (!isAdmin) {
//                param.setServiceEngineer(user.getUserId());
//            }

            //查询数据总量
            Integer totalCount = mainService.queryMaintenanceCountByPage(param);
            if (totalCount > 0) {
                //查询数据
                List<TbMaintenance> list = mainService.queryMaintenanceListByPage(param);///customerService.queryCustomerListByPage(param);
                listData.setList(list);
            }
            listData.setRecords(totalCount);

        } catch (Exception e) {
            logger.error("查询维保信息列表失败!", e);
        }
        return listData;
    }

    /**
     * 新增
     *
     * @param user
     * @param model
     * @return
     */
    @RequestMapping("add.html")
    public String addHtml(CmsUser user, Model model, Integer eId, Integer id, Integer customerId) {
        try {
            List<SysAttrValue> contents = sysAttrService.findByAttrGroupCode("server.maintenance.serverContents");
            model.addAttribute("contents", contents);
            TbMaintenance maintenance = mainService.findById(id);
            if (maintenance != null) {
                model.addAttribute("maintenance", maintenance);
                model.addAttribute("customerId", maintenance.getCustomerId());
                model.addAttribute("deviceId", maintenance.getDeviceId());
                model.addAttribute("add", "edit");
            } else {
                model.addAttribute("add", "add");
                model.addAttribute("deviceId", eId);
                model.addAttribute("customerId", customerId);
                if (customerId != null) {
                    TbCustomer tbCustomer = customerService.findById(customerId);
                    maintenance = new TbMaintenance();
                    if (tbCustomer != null) {
                        maintenance.setcName(tbCustomer.getcName());
                        maintenance.setcContact(tbCustomer.getContact());
                        maintenance.setcAddress(tbCustomer.getAddress());
                        maintenance.setcPhone(tbCustomer.getPhone());
                    }
                }
                if (eId != null) {
                    TbEquipment equipment = deviceService.findById(eId);
                    if (maintenance == null) {
                        maintenance = new TbMaintenance();
                    }
                    if (equipment != null) {
                        maintenance.setMakeDate(equipment.getMakeDate());
                        maintenance.seteModel(equipment.geteModel());
                        maintenance.setMotorBrand(equipment.getMotorBrand());
                        maintenance.setMakeNum(equipment.getMakeNum());
                        maintenance.setMotorMakeDate(equipment.getMotorMakeDate());
                        maintenance.setHostNum(equipment.getHostNum());
                    }
                }
                if (maintenance != null) {
                    model.addAttribute("maintenance", maintenance);
                }

            }
        } catch (Exception e) {
            logger.error("进入设备维保页面失败，设备维保Id【" + id + "】", e);
        }
        return "cms/fusheng/server/maintenance/add";
    }

    /**
     * 编辑
     *
     * @param user
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("edit.html")
    public String editHtml(CmsUser user, Integer id, Model model) {
        model.addAttribute("add", "edit");
        try {
            TbMaintenance maintenance = mainService.findById(id);
            List<SysAttrValue> contents = sysAttrService.findByAttrGroupCode("server.maintenance.serverContents");
            model.addAttribute("contents", contents);
            if (maintenance != null) {
                model.addAttribute("maintenance", maintenance);
                model.addAttribute("customerId", maintenance.getCustomerId());
                model.addAttribute("deviceId", maintenance.getDeviceId());
            }
        } catch (Exception e) {
            logger.error("进入设备维保页面失败，设备维保Id【" + id + "】", e);
        }
        return "cms/fusheng/server/maintenance/add";
    }

    /**
     * 删除
     *
     * @return
     */
    @ResponseBody
    @RequestMapping("delete.ajax")
    public AjaxJson delete(Integer mId, HttpServletRequest request) {
        CmsUser cmsUser = (CmsUser) request.getAttribute("cmsUser");
        AjaxJson result = new AjaxJson();
        try {
            mainService.deleteById(mId, cmsUser.getUserId());
            result.setSuccess(Boolean.TRUE);

        } catch (Exception e) {
            logger.error("删除维保信息失败，单据Id【" + mId + "】：", e);
            result.setSuccess(Boolean.FALSE);
        }
        return result;
    }

    /**
     * 维保详细信息
     *
     * @param user
     * @param model
     * @return
     */
    @RequestMapping("info.html")
    public String infoHtml(CmsUser user, Integer id, Model model) {
        try {
            TbMaintenance maintenance = mainService.findById(id);
            if (maintenance != null) {
                model.addAttribute("maintenance", maintenance);
            }
        } catch (Exception e) {
            logger.error("进入设备维保页面失败，设备维保Id【" + id + "】", e);
        }
        return "cms/fusheng/server/maintenance/info";
    }

    /**
     * 保存
     *
     * @param user
     * @return
     */
    @ResponseBody
    @RequestMapping("save.ajax")
    public AjaxJson save(CmsUser user, TbMaintenance maintenance, Integer cId, Integer eId) {
        AjaxJson result = new AjaxJson();
        try {
            //设置客户Id
            maintenance.setCustomerId(cId);
            maintenance.setDeviceId(eId);
            if (maintenance.getId() != null) {//修改
                mainService.edit(maintenance, user.getUserId());
            } else {
                mainService.add(maintenance, user.getUserId());
            }
            result.setSuccess(Boolean.TRUE);
            result.setMsg("");
        } catch (Exception e) {
            logger.error("保存设备信息失败，入参：" + ObjectUtils.objToString(maintenance), e);
            result.setSuccess(Boolean.FALSE);
            result.setMsg(e.getMessage());
        }
        return result;
    }


    @ResponseBody
    @RequestMapping("codeIsUsed.ajax")
    public AjaxJson codeIsUsed(Integer id, String mCode) {
        AjaxJson result = new AjaxJson();
        try {
            boolean isUsed = mainService.pCodeIsUsed(mCode, id);///数据库中查询件号是否重复
            result.setSuccess(!isUsed);
            result.setMsg("校验成功");
        } catch (Exception e) {
            logger.error("查询维保信息失败！", e);
            result.setMsg("校验失败");
            result.setSuccess(false);
        }
        return result;
    }
}
