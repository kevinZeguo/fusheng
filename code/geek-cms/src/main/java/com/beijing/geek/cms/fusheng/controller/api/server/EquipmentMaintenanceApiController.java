package com.beijing.geek.cms.fusheng.controller.api.server;

import com.beijing.geek.cms.fusheng.domain.customer.TbCustomer;
import com.beijing.geek.cms.fusheng.domain.device.DeviceQueryParam;
import com.beijing.geek.cms.fusheng.domain.device.TbEquipment;
import com.beijing.geek.cms.fusheng.domain.server.ServerQueryParam;
import com.beijing.geek.cms.fusheng.domain.server.TbMaintenance;
import com.beijing.geek.cms.fusheng.service.customer.CustomerService;
import com.beijing.geek.cms.fusheng.service.device.DeviceService;
import com.beijing.geek.cms.fusheng.service.server.MaintenanceService;
import com.beijing.geek.cms.sys.domain.common.AjaxJson;
import com.beijing.geek.cms.sys.domain.common.ApiAjaxJson;
import com.beijing.geek.cms.sys.domain.common.ListDataJson;
import com.beijing.geek.cms.sys.domain.common.SysFile;
import com.beijing.geek.cms.sys.domain.user.CmsUser;
import com.beijing.geek.cms.sys.domain.user.SysUser;
import com.beijing.geek.cms.sys.service.common.SysFileService;
import com.beijing.geek.cms.sys.service.sys.SysRightService;
import com.beijing.geek.cms.sys.service.user.UserService;
import com.beijing.geek.cms.sys.utils.CmsAjaxUtil;
import com.beijing.geek.cms.sys.utils.ObjectUtils;
import com.beijing.geek.cms.sys.utils.StringUtil;
import net.sf.json.JSONObject;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by mazeguo on 2017/7/9.
 */
@Controller
@RequestMapping("/api/server/maintenance/")
public class EquipmentMaintenanceApiController {
    private static final Logger logger = Logger.getLogger(EquipmentMaintenanceApiController.class);
    @Autowired
    private MaintenanceService mainService;
    @Autowired
    private UserService userService;
    @Value("${cms.domain.name}")
    private String domain;
    @Autowired
    private SysFileService sysFileService;
    /**
     * 查询
     *
     * @param body
     * @return
     */
    @ResponseBody
    @RequestMapping("list.ajax")
    public JSONObject list(String body) {
        ApiAjaxJson listData = new ApiAjaxJson();
        try {
            //封装查询参数
            ServerQueryParam param = (ServerQueryParam) JSONObject.toBean(JSONObject.fromObject(body), ServerQueryParam.class);
            if (StringUtil.isEmpty(param.getUserKey())) {
                throw new Exception("用户Key为空，不能查询设备维保记录数据");
            }
            //根据用户Key查询用户信息
            SysUser user = userService.findUserByUserKey(param.getUserKey());
            if (user == null) {
                throw new Exception("用户Key无效，不能查询设备维保记录数据");
            }
            if (param.getEqId() == null) {
                throw new Exception("设备Id为空，不能查询设备维保记录数据");
            }
            //查询数据总量
            Integer totalCount = mainService.queryMaintenanceCountByPage(param);
            if (totalCount > 0) {
                //查询数据
                List<TbMaintenance> list = mainService.queryMaintenanceListByPage(param);///customerService.queryCustomerListByPage(param);
                if (list != null && list.size() > 0) {
                    for (TbMaintenance maintenance : list) {
                        List<SysFile> fileList = sysFileService.findFilesByIds(maintenance.getFileIds());
                        List<String> fileUrls = new ArrayList<>();
                        if (fileList != null && fileList.size() > 0) {
                            for (SysFile file : fileList) {
                                fileUrls.add(domain + "/uploadFile/upload" + File.separator + file.getAppType() + File.separator + file.getFileAlias());
                            }
                        }
                        maintenance.setAttachmentList(fileUrls);
                    }
                }

                listData.setList(list);
            }
            listData.setTotalSize(totalCount);
            listData.setSuccess(Boolean.TRUE);
            listData.setCode(0);
            listData.setMessage("查询成功");
        } catch (Exception e) {
            logger.error("查询维保信息列表失败!", e);
            listData.setSuccess(Boolean.FALSE);
            listData.setCode(2);
            listData.setMessage("查询失败!");
        }
        return CmsAjaxUtil.apiToJSON(listData);
    }

    /**
     * 删除
     *
     * @return
     */
    @ResponseBody
    @RequestMapping("delete.ajax")
    public JSONObject delete(String body) {
        ApiAjaxJson result = new ApiAjaxJson();
        try {
            //封装查询参数
            ServerQueryParam param = (ServerQueryParam) JSONObject.toBean(JSONObject.fromObject(body), ServerQueryParam.class);
            if (StringUtil.isEmpty(param.getUserKey())) {
                throw new Exception("用户Key为空，不能删此记录");
            }
            //根据用户Key查询用户信息
            SysUser user = userService.findUserByUserKey(param.getUserKey());
            if (user == null) {
                throw new Exception("用户Key无效，不能删此记录");
            }
            if (param.getId() == null) {
                throw new Exception("设备Id为空，不能删此记录");
            }

            mainService.deleteById(param.getId(), user.getUserId());
            result.setSuccess(Boolean.TRUE);
            result.setCode(0);
            result.setMessage("删除成功");
        } catch (Exception e) {
            logger.error("删除维保信息失败，单据Id【" + body + "】：", e);
            result.setSuccess(Boolean.FALSE);
            result.setCode(2);
            result.setMessage("删除失败!");
        }
        return CmsAjaxUtil.apiToJSON(result);
    }

    /**
     * 维保详细信息
     *
     * @param body
     * @return
     */
    @ResponseBody
    @RequestMapping("findById.ajax")
    public JSONObject findById(String body) {
        ApiAjaxJson resultData = new ApiAjaxJson();
        try {
            //封装查询参数
            ServerQueryParam param = (ServerQueryParam) JSONObject.toBean(JSONObject.fromObject(body), ServerQueryParam.class);
            if (StringUtil.isEmpty(param.getUserKey())) {
                throw new Exception("用户Key为空，不能查询设备维保记录数据");
            }
            //根据用户Key查询用户信息
            SysUser user = userService.findUserByUserKey(param.getUserKey());
            if (user == null) {
                throw new Exception("用户Key无效，不能查询设备维保记录数据");
            }
            if (param.getId() == null) {
                throw new Exception("单据Id为空，不能查询设备维保记录数据");
            }
            TbMaintenance tbMaintenance = mainService.findById(param.getId());
            resultData.setObj(tbMaintenance);
            resultData.setSuccess(Boolean.TRUE);
            resultData.setCode(0);
            resultData.setMessage("查询成功");
        } catch (Exception e) {
            logger.error("查询维保单据详情失败!", e);
            resultData.setSuccess(Boolean.FALSE);
            resultData.setCode(2);
            resultData.setMessage("查询失败!");
        }
        return CmsAjaxUtil.apiToJSON(resultData);
    }

    /**
     * 新增维保单
     *
     * @return
     */
    @ResponseBody
    @RequestMapping("save.ajax")
    public JSONObject save(String body) {
        ApiAjaxJson resultData = new ApiAjaxJson();
        try {
            //封装查询参数
            TbMaintenance param = (TbMaintenance) JSONObject.toBean(JSONObject.fromObject(body), TbMaintenance.class);
            if (StringUtil.isEmpty(param.getUserKey())) {
                throw new Exception("用户Key为空，保存单据失败");
            }
            //根据用户Key查询用户信息
            SysUser user = userService.findUserByUserKey(param.getUserKey());
            if (user == null) {
                throw new Exception("用户Key无效，保存单据失败");
            }
            if (param.geteId() == null) {
                throw new Exception("设备ID为空，保存单据失败");
            }

            mainService.add(param, user.getUserId());
            resultData.setSuccess(Boolean.TRUE);
            resultData.setCode(0);
            resultData.setMessage("保存成功");
        } catch (Exception e) {
            logger.error("保存单据详情失败!", e);
            resultData.setSuccess(Boolean.FALSE);
            resultData.setCode(2);
            resultData.setMessage("保存失败!");
        }
        return CmsAjaxUtil.apiToJSON(resultData);
    }


    /**
     * 修改维保单
     *
     * @return
     */
    @ResponseBody
    @RequestMapping("edit.ajax")
    public JSONObject edit(String body) {
        ApiAjaxJson resultData = new ApiAjaxJson();
        try {
            //封装查询参数
            TbMaintenance param = (TbMaintenance) JSONObject.toBean(JSONObject.fromObject(body), TbMaintenance.class);
            if (StringUtil.isEmpty(param.getUserKey())) {
                throw new Exception("用户Key为空，保存单据失败");
            }
            //根据用户Key查询用户信息
            SysUser user = userService.findUserByUserKey(param.getUserKey());
            if (user == null) {
                throw new Exception("用户Key无效，保存单据失败");
            }
            if (param.getId() == null) {
                throw new Exception("单据Id为空，保存单据失败");
            }

            mainService.edit(param, user.getUserId());
            resultData.setSuccess(Boolean.TRUE);
            resultData.setCode(0);
            resultData.setMessage("修改成功");
        } catch (Exception e) {
            logger.error("修改单据详情失败!", e);
            resultData.setSuccess(Boolean.FALSE);
            resultData.setCode(2);
            resultData.setMessage("修改失败!");
        }
        return CmsAjaxUtil.apiToJSON(resultData);
    }


}
