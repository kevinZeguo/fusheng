package com.beijing.geek.cms.fusheng.controller.server;

import com.beijing.geek.cms.fusheng.domain.customer.TbCustomer;
import com.beijing.geek.cms.fusheng.domain.device.TbEquipment;
import com.beijing.geek.cms.fusheng.domain.server.ServerQueryParam;
import com.beijing.geek.cms.fusheng.domain.server.TbServeDebug;
import com.beijing.geek.cms.fusheng.service.customer.CustomerService;
import com.beijing.geek.cms.fusheng.service.device.DeviceService;
import com.beijing.geek.cms.fusheng.service.server.ServeDebugService;
import com.beijing.geek.cms.fusheng.utils.CmsDict;
import com.beijing.geek.cms.sys.domain.common.AjaxJson;
import com.beijing.geek.cms.sys.domain.common.ListDataJson;
import com.beijing.geek.cms.sys.domain.common.SysFile;
import com.beijing.geek.cms.sys.domain.user.CmsUser;
import com.beijing.geek.cms.sys.service.common.SysFileService;
import com.beijing.geek.cms.sys.service.sys.SysRightService;
import com.beijing.geek.cms.sys.utils.ObjectUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by mazeguo on 2017/7/9.
 */
@Controller
@RequestMapping("/serve/debugeq/")
public class EquipmentDebugController {
    private static final Logger logger = Logger.getLogger(EquipmentDebugController.class);
    @Autowired
    private SysRightService sysRightService;

    @Autowired
    private ServeDebugService serveDebugService;
    @Autowired
    private CustomerService customerService;
    @Autowired
    private DeviceService deviceService;
//    @Autowired
//    private SysFileService sysFileService;

    /**
     * 跳转到调试单信息页
     *
     * @param user
     * @return
     */
    @RequestMapping("index.html")
    public String listHtml(CmsUser user) {
        return "cms/fusheng/server/debugeq/list";
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
            Integer totalCount = serveDebugService.queryDebugCountByPage(param);
            if (totalCount > 0) {
                List<TbServeDebug> debugList = serveDebugService.queryDebugListByPage(param);
                partList.setList(debugList);
            }
            partList.setRecords(totalCount);
        } catch (Exception e) {
            logger.error("查询调试单列表！", e);
        }
        return partList;
    }

    /**
     * 新增设备调试单
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
            TbServeDebug serveDebug = serveDebugService.findById(id);
            if (serveDebug != null) {
                model.addAttribute("serveDebug", serveDebug);
                model.addAttribute("customerId", serveDebug.getCustomerId());
                model.addAttribute("eId", serveDebug.getEqId());
                model.addAttribute("add", "edit");
            } else {
                model.addAttribute("add", "add");
                model.addAttribute("customerId", customerId);
                model.addAttribute("eId", eId);
                if (customerId != null) {
                    TbCustomer tbCustomer = customerService.findById(customerId);
                    serveDebug = new TbServeDebug();
                    if (tbCustomer != null) {
                        serveDebug.setcName(tbCustomer.getcName());
                        serveDebug.setContact(tbCustomer.getContact());
                        serveDebug.setPayAcct(tbCustomer.getPayAcct());
                        serveDebug.setAddress(tbCustomer.getAddress());
                        serveDebug.setPhone(tbCustomer.getPhone());
                    }
                }
                model.addAttribute("eId", eId);
                if (eId != null) {
                    TbEquipment equipment = deviceService.findById(eId);
                    if (serveDebug == null) {
                        serveDebug = new TbServeDebug();
                    }
                    if (equipment != null) {
                        serveDebug.seteCode(equipment.geteCode());
                        serveDebug.seteName(equipment.geteName());
                        serveDebug.setMakeDate(equipment.getMakeDate());
                        serveDebug.seteModel(equipment.geteModel());
                        serveDebug.setMotorBrand(equipment.getMotorBrand());
                        serveDebug.setMakeNum(equipment.getMakeNum());
                        serveDebug.setElecPanModel(equipment.getElecPanModel());
                        serveDebug.setMotorMakeDate(equipment.getMotorMakeDate());
                        serveDebug.setHostNum(equipment.getHostNum());
                    }
                }
                if (serveDebug != null) {
                    model.addAttribute("serveDebug", serveDebug);
                }
            }
        } catch (Exception e) {
            logger.error("进入调试单编辑页面失败！，调试单编号=【" + id + "】", e);
        }
        return "cms/fusheng/server/debugeq/add";
    }

    @RequestMapping("edit.html")
    public String editHtml(Integer id, Model model) {
        model.addAttribute("add", "edit");
        try {
            TbServeDebug serveDebug = serveDebugService.findById(id);
            if (serveDebug != null) {
                model.addAttribute("serveDebug", serveDebug);
                model.addAttribute("customerId", serveDebug.getCustomerId());
                model.addAttribute("eId", serveDebug.getEqId());
            }
        } catch (Exception e) {
            logger.error("进入调试单编辑页面失败！，调试单编号=【" + id + "】", e);
        }
        return "cms/fusheng/server/debugeq/add";
    }

    @ResponseBody
    @RequestMapping("save.ajax")
    public AjaxJson save(CmsUser user, TbServeDebug serveDebug) {
        AjaxJson result = new AjaxJson();
        ///tbPart.setpPic(pPic);
        try {
            if (serveDebug.getId() != null) {
                serveDebugService.editServeDebug(serveDebug, user.getUserId());
            } else {
                serveDebugService.saveServeDebug(serveDebug, user.getUserId());
            }
            result.setSuccess(Boolean.TRUE);
            result.setMsg("");
        } catch (Exception e) {
            logger.error("保存调试单详情失败，入参：" + ObjectUtils.objToString(serveDebug), e);
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
            serveDebugService.deleteById(id, cmsUser.getUserId());
            result.setSuccess(Boolean.TRUE);
        } catch (Exception e) {
            logger.error("删除调试单失败，调试单编号=【" + id + "】：", e);
            result.setSuccess(Boolean.FALSE);
            result.setMsg(e.getMessage());
        }
        return result;
    }

    @RequestMapping("info.html")
    public String infoHtml(CmsUser user, Integer id, Model model) {
        try {
            TbServeDebug serveDebug = serveDebugService.findById(id);
            if (serveDebug != null) {

                model.addAttribute("serveDebug", serveDebug);
            }
        } catch (Exception e) {
            // TODO: handle exception
            logger.error("查询调试单详情失败，调试单编号=【" + id + "】：", e);
        }
        return "cms/fusheng/server/debugeq/info";
    }
}
