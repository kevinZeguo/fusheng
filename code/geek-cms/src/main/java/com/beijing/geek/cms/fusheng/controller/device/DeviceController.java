package com.beijing.geek.cms.fusheng.controller.device;

import com.beijing.geek.cms.fusheng.domain.device.DeviceQueryParam;
import com.beijing.geek.cms.fusheng.domain.device.TbEquPart;
import com.beijing.geek.cms.fusheng.domain.device.TbEquipment;
import com.beijing.geek.cms.fusheng.service.device.DeviceService;
import com.beijing.geek.cms.sys.domain.common.AjaxJson;
import com.beijing.geek.cms.sys.domain.common.ListDataJson;
import com.beijing.geek.cms.sys.domain.user.CmsUser;
import com.beijing.geek.cms.sys.service.sys.SysRightService;
import com.beijing.geek.cms.sys.utils.ObjectUtils;

import com.beijing.geek.cms.sys.utils.StringUtil;
import net.sf.json.JSONObject;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

import java.io.File;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

/**
 * 设备管理
 * Created by mazeguo on 2017/6/12.
 */
@Controller
@RequestMapping("/device/")
public class DeviceController {
    private static final Logger logger = Logger.getLogger(DeviceController.class);
    @Autowired
    private DeviceService deviceService;
    @Autowired
    private SysRightService sysRightService;

    /**
     * 进入列表
     *
     * @param user
     * @param req
     * @return
     */
    @RequestMapping("index.html")
    public String listHtml(CmsUser user, HttpServletRequest req) {
        return "cms/fusheng/device/list";
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
    public ListDataJson list(CmsUser user, DeviceQueryParam param) {
        ListDataJson cusList = new ListDataJson();
        try {
            cusList.setPage(param.getPage());
            cusList.setLimit(param.getLimit());
            if (StringUtil.isNotEmpty(param.geteModel())) {
                param.seteModel("%" + URLDecoder.decode(param.geteModel(), "utf-8").trim() + "%");
            }
            if (StringUtil.isNotEmpty(param.getMakeNum())) {
                param.setMakeNum("%" + URLDecoder.decode(param.getMakeNum(), "utf-8").trim() + "%");
            }
            if (StringUtil.isNotEmpty(param.getHostNum())) {
                param.setHostNum("%" + URLDecoder.decode(param.getHostNum(), "utf-8").trim() + "%");
            }

            if (StringUtil.isNotEmpty(param.getcName())) {
                param.setcName("%" + URLDecoder.decode(param.getcName(), "utf-8").trim() + "%");
            }

            List<Integer> userIds = sysRightService.getHasDataRightUserList(user.getUserId());
            param.setServiceEngineerList(userIds);
//
//            //是否为系统管理员权限
//            boolean isAdmin = sysRightService.hasRightByRoleCode(user.getUserId(), "sys_admin");
//            if (!isAdmin) {
//                param.setServiceEngineer(user.getUserId() + "");
//            }

            //查询数据总量
            Integer totalCount = deviceService.queryDeviceCountByPage(param);
            if (totalCount > 0) {
                //查询数据
                List<TbEquipment> cmsUserList = deviceService.queryDeviceListByPage(param);
                cusList.setList(cmsUserList);
            }
            cusList.setRecords(totalCount);

        } catch (Exception e) {
            logger.error("查询客户列表失败!", e);
        }
        return cusList;
    }

    /**
     * 删除
     *
     * @return
     */
    @ResponseBody
    @RequestMapping("delete.ajax")
    public AjaxJson delete(Integer eId, HttpServletRequest request) {
        CmsUser cmsUser = (CmsUser) request.getAttribute("cmsUser");
        AjaxJson result = new AjaxJson();
        try {
            deviceService.deleteById(eId, cmsUser.getUserId());
            result.setSuccess(Boolean.TRUE);

        } catch (Exception e) {
            logger.error("删除设备信息失败，设备Id【" + eId + "】：", e);
            result.setSuccess(Boolean.FALSE);
        }
        return result;
    }

    /**
     * 保存
     *
     * @param user
     * @return
     */
    @ResponseBody
    @RequestMapping("save.ajax")
    public AjaxJson save(CmsUser user, TbEquipment equipment, Integer cId) {
        AjaxJson result = new AjaxJson();
        try {
            //设置客户Id
            equipment.setCustomerId(cId);
            if (equipment.geteId() != null) {//修改
                deviceService.edit(equipment, user.getUserId());
            } else {
                deviceService.add(equipment, user.getUserId());
            }
            result.setSuccess(Boolean.TRUE);
            result.setMsg("");
        } catch (Exception e) {
            logger.error("保存设备信息失败，入参：" + ObjectUtils.objToString(equipment), e);
            result.setSuccess(Boolean.FALSE);
            result.setMsg(e.getMessage());
        }
        return result;
    }

    /**
     * 进入新增页面
     *
     * @param user
     * @return
     */
    @RequestMapping("add.html")
    public String addHtml(CmsUser user, Model model, Integer customerId) {
        model.addAttribute("add", "add");
        model.addAttribute("customerId", customerId);
        return "cms/fusheng/device/add";
    }

    @RequestMapping("edit.html")
    public String editHtml(CmsUser user, Integer eId, Model model) {
        model.addAttribute("add", "edit");
        try {
            TbEquipment tbEquipment = deviceService.findById(eId);
            if (tbEquipment != null) {
                model.addAttribute("tbEquipment", tbEquipment);
                model.addAttribute("customerId", tbEquipment.getCustomerId());
            }
        } catch (Exception e) {
            logger.error("进入设备编辑页面失败，设备Id【" + eId + "】", e);
        }
        return "cms/fusheng/device/add";
    }


    @RequestMapping("info.html")
    public String infoHtml(CmsUser user, Integer eId, Model model) {
        model.addAttribute("add", "edit");
        try {
            TbEquipment tbEquipment = deviceService.findById(eId);
            if (tbEquipment != null) {
                model.addAttribute("tbEquipment", tbEquipment);
                model.addAttribute("customerId", tbEquipment.getCustomerId());
            }
        } catch (Exception e) {
            logger.error("进入设备编辑页面失败，设备Id【" + eId + "】", e);
        }
        return "cms/fusheng/device/info";
    }

    /**
     * 导出客户信息
     *
     * @param user
     * @return
     */
    @ResponseBody
    @RequestMapping("import.ajax")
    public AjaxJson importCustomer(CmsUser user, @RequestParam("xlsxFile") MultipartFile file, HttpServletRequest request, Integer customerId) {
        AjaxJson result = new AjaxJson();
        try {
            if (file == null) {
                throw new Exception("未找到数据文件，请重新上传文件！");
            }
            //文件名称
            logger.info(file.getOriginalFilename());

            String fileName = file.getOriginalFilename();// 获取上传文件名,包括路径
            //name = name.substring(name.lastIndexOf("\\") + 1);// 从全路径中提取文件名
            long size = file.getSize();
            if ((fileName == null || fileName.equals("")) && size == 0) {
                throw new Exception("文件内容为空，请重新上传文件！");
            }

            String fileDirPath = request.getSession().getServletContext().getRealPath(File.separator) + "import" + File.separator + "device" + File.separator;
            File fileDir = new File(fileDirPath);
            if (!fileDir.exists()) {//文件不存在则创建文件
                fileDir.mkdirs();
            }
            //文件别名
            String fileType = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length());
            String fileAlias = System.currentTimeMillis() + "." + fileType;
            File tmpFile = new File(fileDirPath + fileAlias);
            file.transferTo(tmpFile);//转存文件

            Integer[] counts = deviceService.importDeviceByExcel(tmpFile, fileType, user.getUserId(), customerId);
            result.setMsg("成功导入" + counts[0] + "条数据,已存在的" + counts[1] + "条数据");
            result.setSuccess(Boolean.TRUE);
        } catch (Exception e) {
            logger.error("导入客户数据失败", e);
            result.setMsg("导入客户数据失败,失败原因" + e.getMessage());
            result.setSuccess(Boolean.FALSE);
        }
        return result;
    }

    /**
     * 查询 zhangyongquan
     *
     * @param user
     * @param param
     * @return
     */
    @ResponseBody
    @RequestMapping("list4select.ajax")
    public ListDataJson list4select(CmsUser user, DeviceQueryParam param) {
        ListDataJson cusList = new ListDataJson();
        try {
            if (StringUtil.isNotEmpty(param.getHostNum())) {
                param.setHostNum("%" + URLDecoder.decode(param.getHostNum(), "utf-8") + "%");
            }
            param.setStart(0);
            param.setLimit(20);


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
                List<TbEquipment> deviceList = deviceService.queryDeviceListByPage(param);
                cusList.setList(deviceList);
            }
            cusList.setRecords(totalCount);

        } catch (Exception e) {
            logger.error("查询客户列表失败!", e);
        }
        return cusList;
    }

    /**
     * 查询 zhangyongquan
     *
     * @param eId
     * @return
     */
    @ResponseBody
    @RequestMapping("findById.ajax")
    public AjaxJson findById(Integer eId) {
        AjaxJson result = new AjaxJson();
        try {
            //查询数据总量
            TbEquipment equipment = deviceService.findById(eId);
            result.setObj(equipment);
            result.setSuccess(Boolean.TRUE);
        } catch (Exception e) {
            logger.error("查询设备列表失败!", e);
            result.setSuccess(Boolean.FALSE);
        }
        return result;
    }

    /**
     * 查询
     *
     * @param user
     * @param param
     * @return
     */
    @ResponseBody
    @RequestMapping("listPart.ajax")
    public ListDataJson listPart(CmsUser user, DeviceQueryParam param) {
        ListDataJson partJson = new ListDataJson();
        try {
            partJson.setPage(param.getPage());
            partJson.setLimit(param.getLimit());
            if (StringUtil.isNotEmpty(param.getKeyword())) {
                param.setKeyword("%" + URLDecoder.decode(param.getKeyword(), "utf-8").trim() + "%");
            }
            //查询数据总量
            Integer totalCount = deviceService.queryPartCountByPage(param);
            if (totalCount > 0) {
                //查询数据
                List<TbEquPart> partList = deviceService.queryPartListByPage(param);
                partJson.setList(partList);
            }
            partJson.setRecords(totalCount);

        } catch (Exception e) {
            logger.error("查询设备配件列表失败!", e);
        }
        return partJson;
    }


    /**
     * 保存配件与设备关系
     *
     * @param user
     * @param pIds
     * @param eId
     * @return
     */
    @ResponseBody
    @RequestMapping("savePart.ajax")
    public AjaxJson savePart(CmsUser user, String pIds, Integer eId) {
        AjaxJson result = new AjaxJson();
        try {
            if (StringUtil.isNotEmpty(pIds)) {
                List<Integer> pIdlist = new ArrayList<>();
                for (String id : pIds.split(",")) {
                    if (StringUtil.isNotEmpty(id)) {
                        pIdlist.add(Integer.parseInt(id));
                    }
                }
                deviceService.saveEqParts(pIdlist, eId, user.getUserId());
            }

            result.setSuccess(Boolean.TRUE);
        } catch (Exception e) {
            result.setSuccess(false);
            result.setMsg(e.getMessage());
            logger.error("查询设备配件列表失败!", e);
        }
        return result;
    }

    /**
     * 保存配件与设备关系
     *
     * @param user
     * @param pIds
     * @param eId
     * @return
     */
    @ResponseBody
    @RequestMapping("deletePart.ajax")
    public AjaxJson deletePart(CmsUser user, String pIds, Integer eId) {
        AjaxJson result = new AjaxJson();
        try {
            if (StringUtil.isNotEmpty(pIds)) {
                List<Integer> pIdlist = new ArrayList<>();
                for (String id : pIds.split(",")) {
                    if (StringUtil.isNotEmpty(id)) {
                        pIdlist.add(Integer.parseInt(id));
                    }
                }
                deviceService.deleteEqParts(pIdlist, eId, user.getUserId());
            }
            result.setSuccess(Boolean.TRUE);
        } catch (Exception e) {
            result.setSuccess(false);
            result.setMsg(e.getMessage());
            logger.error("查询设备配件列表失败!", e);
        }
        return result;
    }

}
