package com.beijing.geek.cms.fusheng.controller.api.device;

import com.beijing.geek.cms.fusheng.domain.device.DeviceQueryParam;
import com.beijing.geek.cms.fusheng.domain.device.TbEquPart;
import com.beijing.geek.cms.fusheng.domain.device.TbEquipment;
import com.beijing.geek.cms.fusheng.service.device.DeviceService;
import com.beijing.geek.cms.sys.domain.common.ApiAjaxJson;
import com.beijing.geek.cms.sys.domain.common.SysFile;
import com.beijing.geek.cms.sys.domain.user.SysUser;
import com.beijing.geek.cms.sys.service.common.SysFileService;
import com.beijing.geek.cms.sys.service.sys.SysRightService;
import com.beijing.geek.cms.sys.service.user.UserService;
import com.beijing.geek.cms.sys.utils.CmsAjaxUtil;
import com.beijing.geek.cms.sys.utils.StringUtil;
import net.sf.json.JSONObject;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.File;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

/**
 * 设备管理
 * Created by mazeguo on 2017/6/12.
 */
@Controller
@RequestMapping("/api/device/")
public class DeviceApiController {
    private static final Logger logger = Logger.getLogger(DeviceApiController.class);
    @Autowired
    private DeviceService deviceService;
    @Autowired
    private SysRightService sysRightService;
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
    public net.sf.json.JSONObject list(String body) {
        ApiAjaxJson cusList = new ApiAjaxJson();
        try {
            //封装查询参数
            DeviceQueryParam param = (DeviceQueryParam) JSONObject.toBean(JSONObject.fromObject(body), DeviceQueryParam.class);
            if (StringUtil.isEmpty(param.getUserKey())) {
                throw new Exception("用户Key为空，不能查询设备数据");
            }
            //根据用户Key查询用户信息
            SysUser user = userService.findUserByUserKey(param.getUserKey());
            if (user == null) {
                throw new Exception("用户Key无效，不能查询设备数据");
            }
            if (StringUtil.isNotEmpty(param.geteModel())) {
                param.seteModel("%" + URLDecoder.decode(param.geteModel(), "utf-8").trim() + "%");
            }
            if (StringUtil.isNotEmpty(param.getMakeNum())) {
                param.setMakeNum("%" + URLDecoder.decode(param.getMakeNum(), "utf-8").trim() + "%");
            }
            if (StringUtil.isNotEmpty(param.getHostNum())) {
                param.setHostNum("%" + URLDecoder.decode(param.getHostNum(), "utf-8").trim() + "%");
            }
            if (StringUtil.isNotEmpty(param.getKeyword())) {
                param.setKeyword("%" + param.getKeyword() + "%");
            }

            List<Integer> userIds = sysRightService.getHasDataRightUserList(user.getUserId());
            param.setServiceEngineerList(userIds);
//            //是否为系统管理员权限
//            boolean isAdmin = sysRightService.hasRightByRoleCode(user.getUserId(), "sys_admin");
//            if (!isAdmin) {
//                param.setServiceEngineer(user.getUserId() + "");
//            }

            //查询数据总量
            Integer totalCount = deviceService.queryDeviceCountByPage(param);
            if (totalCount > 0) {
                //查询数据
                List<TbEquipment> equipments = deviceService.queryDeviceListByPage(param);
                if (equipments != null && equipments.size() > 0) {
                    //查询文件地址
                    for (TbEquipment equipment : equipments) {
                        if (StringUtil.isNotEmpty(equipment.getFileIds())) {
                            List<SysFile> fileList = sysFileService.findFilesByIds(equipment.getFileIds());
                            List<String> fileUrls = new ArrayList<>();
                            if (fileList != null && fileList.size() > 0) {
                                for (SysFile file : fileList) {
                                    fileUrls.add(domain + "/uploadFile/upload" + File.separator + file.getAppType() + File.separator + file.getFileAlias());
                                }
                            }
                            equipment.setEPicUrlList(fileUrls);
                        }
                    }

                }
                cusList.setList(equipments);
            }
            cusList.setTotalSize(totalCount);
            cusList.setSuccess(Boolean.TRUE);
            cusList.setCode(0);
            cusList.setMessage("查询成功");
        } catch (Exception e) {
            logger.error("查询设备列表失败，请求参数：" + body, e);
            cusList.setSuccess(Boolean.FALSE);
            cusList.setCode(2);
            cusList.setMessage("查询失败!");
        }
        return CmsAjaxUtil.apiToJSON(cusList);

    }

    /**
     * 查询
     *
     * @param body
     * @return
     */
    @ResponseBody
    @RequestMapping("findById.ajax")
    public net.sf.json.JSONObject findById(String body) {
        ApiAjaxJson eqResult = new ApiAjaxJson();
        try {
            //封装查询参数
            DeviceQueryParam param = (DeviceQueryParam) JSONObject.toBean(JSONObject.fromObject(body), DeviceQueryParam.class);
            if (StringUtil.isEmpty(param.getUserKey())) {
                throw new Exception("用户Key为空，不能查询设备数据");
            }
            //根据用户Key查询用户信息
            SysUser user = userService.findUserByUserKey(param.getUserKey());
            if (user == null) {
                throw new Exception("用户Key无效，不能查询设备数据");
            }
            if (param.geteId() == null) {
                throw new Exception("设备Id为空，不能查询设备数据");
            }

            TbEquipment equipment = deviceService.findById(param.geteId());
            if (equipment != null) {
                eqResult.setObj(eqResult);
            }
            eqResult.setSuccess(Boolean.TRUE);
            eqResult.setCode(0);
            eqResult.setMessage("查询成功");
        } catch (Exception e) {
            logger.error("查询设备详情失败，请求参数：" + body, e);
            eqResult.setSuccess(Boolean.FALSE);
            eqResult.setCode(2);
            eqResult.setMessage("查询失败!");
        }
        return CmsAjaxUtil.apiToJSON(eqResult);
    }


    /**
     * 查询
     *
     * @param body
     * @return
     */
    @ResponseBody
    @RequestMapping("listPart.ajax")
    public net.sf.json.JSONObject listPart(String body) {
        ApiAjaxJson cusList = new ApiAjaxJson();
        try {
            //封装查询参数
            DeviceQueryParam param = (DeviceQueryParam) JSONObject.toBean(JSONObject.fromObject(body), DeviceQueryParam.class);
            if (StringUtil.isEmpty(param.getUserKey())) {
                throw new Exception("用户Key为空，不能查询设备数据");
            }
            //根据用户Key查询用户信息
            SysUser user = userService.findUserByUserKey(param.getUserKey());
            if (user == null) {
                throw new Exception("用户Key无效，不能查询设备数据");
            }
            if (StringUtil.isNotEmpty(param.getKeyword())) {
                param.setKeyword("%" + param.getKeyword() + "%");
            }

            //查询数据总量
            Integer totalCount = deviceService.queryPartCountByPage(param);
            if (totalCount > 0) {
                //查询数据
                List<TbEquPart> partList = deviceService.queryPartListByPage(param);
                cusList.setList(partList);
            }
            cusList.setTotalSize(totalCount);
            cusList.setSuccess(Boolean.TRUE);
            cusList.setCode(0);
            cusList.setMessage("查询成功");
        } catch (Exception e) {
            logger.error("查询设备配件列表失败，请求参数：" + body, e);
            cusList.setSuccess(Boolean.FALSE);
            cusList.setCode(2);
            cusList.setMessage("查询失败!");
        }
        return CmsAjaxUtil.apiToJSON(cusList);

    }


}
