package com.beijing.geek.cms.fusheng.controller.customer;

import com.beijing.geek.cms.fusheng.domain.customer.CustomerQueryParam;
import com.beijing.geek.cms.fusheng.domain.customer.TbCustomer;
import com.beijing.geek.cms.fusheng.service.customer.CustomerService;
import com.beijing.geek.cms.sys.domain.common.AjaxJson;
import com.beijing.geek.cms.sys.domain.common.ListDataJson;
import com.beijing.geek.cms.sys.domain.user.CmsUser;
import com.beijing.geek.cms.sys.domain.user.SysUser;
import com.beijing.geek.cms.sys.service.sys.SysRightService;
import com.beijing.geek.cms.sys.service.user.UserService;
import com.beijing.geek.cms.sys.utils.ObjectUtils;
import com.beijing.geek.cms.sys.utils.StringUtil;
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
import java.util.List;

/**
 * Created by mazeguo on 2017/6/12.
 */
@Controller
@RequestMapping("/customer/")
public class CustomerController {
    private static final Logger logger = Logger.getLogger(CustomerController.class);
    @Autowired
    private CustomerService customerService;
    @Autowired
    private UserService userService;

    @Autowired
    private SysRightService sysRightService;

    /**
     * 进入客户列表
     *
     * @param user
     * @param req
     * @return
     */
    @RequestMapping("index.html")
    public String listHtml(CmsUser user, HttpServletRequest req) {
        return "cms/fusheng/customer/list";
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
    public ListDataJson list(CmsUser user, CustomerQueryParam param) {
        ListDataJson cusList = new ListDataJson();
        try {
            if (StringUtil.isNotEmpty(param.getcName())) {//客户姓名
                param.setcName("%" + URLDecoder.decode(param.getcName(), "utf-8").trim() + "%");
            }
            if (StringUtil.isNotEmpty(param.getAddress())) {//客户地址
                param.setAddress("%" + URLDecoder.decode(param.getAddress(), "utf-8").trim() + "%");
            }
            if (StringUtil.isNotEmpty(param.getContact())) {//联系人
                param.setContact("%" + URLDecoder.decode(param.getContact(), "utf-8").trim() + "%");
            }

            cusList.setPage(param.getPage());
            cusList.setLimit(param.getLimit());

            //是否为系统管理员权限
            List<Integer> userIds = sysRightService.getHasDataRightUserList(user.getUserId());
            param.setServiceEngineerList(userIds);
//            boolean isAdmin = sysRightService.hasRightByRoleCode(user.getUserId(), "sys_admin");
//            if (!isAdmin) {
//                param.setServiceEngineer(user.getUserId() + "");
//            }

            //查询数据总量
            Integer totalCount = customerService.queryCustomerCountByPage(param);
            if (totalCount > 0) {
                //查询数据
                List<TbCustomer> cmsUserList = customerService.queryCustomerListByPage(param);
                cusList.setList(cmsUserList);
            }
            cusList.setRecords(totalCount);

        } catch (Exception e) {
            logger.error("查询客户列表失败!", e);
        }
        return cusList;
    }


    /**
     * 校验客户名称是否已经被使用
     *
     * @param cName
     * @param cId
     * @return
     */
    @ResponseBody
    @RequestMapping("nameIsUsed.ajax")
    public AjaxJson nameIsUsed(String cName, Integer cId) {
        AjaxJson result = new AjaxJson();
        try {
            //查询数据总量
            boolean isUsed = customerService.cNameIsUsed(cName, cId);
            result.setSuccess(!isUsed);
            result.setMsg("校验成功");

        } catch (Exception e) {
            logger.error("查询客户列表失败!", e);
            result.setMsg("校验失败");
            result.setSuccess(false);
        }
        return result;
    }


    /**
     * 进入用户新增页面
     *
     * @param user
     * @return
     */
    @RequestMapping("add.html")
    public String addHtml(CmsUser user, Model model) {
        try {
            List<SysUser> engineers = userService.findUserListByRoleId(1);
            model.addAttribute("engineers", engineers);
        } catch (Exception e) {
            logger.error("查询服务工程师列表失败！", e);
        }
        model.addAttribute("add", "add");
        return "cms/fusheng/customer/add";
    }

    /**
     * 进入客户编辑页面
     *
     * @param user
     * @param req
     * @return
     */
    @RequestMapping("edit.html")
    public String editHtml(CmsUser user, HttpServletRequest req, Integer cId, Model model) {
        model.addAttribute("add", "edit");
        try {
            List<SysUser> engineers = userService.findUserListByRoleId(1);
            model.addAttribute("engineers", engineers);
            TbCustomer tbCustomer = customerService.findById(cId);
            if (tbCustomer != null) {
                model.addAttribute("customer", tbCustomer);
            }
        } catch (Exception e) {
            logger.error("进入客户编辑页面失败，客户Id【" + cId + "】", e);
        }
        return "cms/fusheng/customer/add";
    }

    /**
     * 保存用户信息
     *
     * @param user
     * @return
     */
    @ResponseBody
    @RequestMapping("save.ajax")
    public AjaxJson save(CmsUser user, TbCustomer customer) {
        AjaxJson result = new AjaxJson();
        try {
            if (customer.getcId() != null) {//修改用户
                customerService.editCustomer(customer, user.getUserId());
            } else {
                customerService.addCustomer(customer, user.getUserId());
            }
            result.setSuccess(Boolean.TRUE);
            result.setMsg("");
        } catch (Exception e) {
            logger.error("保存用户信息失败，入参：" + ObjectUtils.objToString(customer), e);
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
            customerService.deleteById(cId, cmsUser.getUserId());
            result.setSuccess(Boolean.TRUE);

        } catch (Exception e) {
            logger.error("查询客户信息失败，客户Id【" + cId + "】：", e);
            result.setSuccess(Boolean.FALSE);
        }
        return result;
    }

    /**
     * 客户详情页面
     *
     * @param user
     * @return
     */
    @RequestMapping("info.html")
    public String infoHtml(CmsUser user, Integer cId, Model model) {
        try {
            TbCustomer tbCustomer = customerService.findById(cId);
            if (tbCustomer != null) {
                model.addAttribute("customer", tbCustomer);
            }
        } catch (Exception e) {
            logger.error("查询客户信息失败，客户Id【" + cId + "】：", e);
        }
        return "cms/fusheng/customer/info";
    }


    /**
     * 导出客户信息
     *
     * @param user
     * @return
     */
    @ResponseBody
    @RequestMapping("importCustomer.ajax")
    public AjaxJson importCustomer(CmsUser user, @RequestParam("xlsxFile") MultipartFile file, HttpServletRequest request) {
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

            String fileDirPath = request.getSession().getServletContext().getRealPath(File.separator) + "import" + File.separator + "customer" + File.separator;
            File fileDir = new File(fileDirPath);
            if (!fileDir.exists()) {//文件不存在则创建文件
                fileDir.mkdirs();
            }
            //文件别名
            String fileType = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length());
            String fileAlias = System.currentTimeMillis() + "." + fileType;
            File tmpFile = new File(fileDirPath + fileAlias);
            file.transferTo(tmpFile);//转存文件

            Integer[] counts = customerService.importCustomerByExcel(tmpFile, fileType, user.getUserId());
            result.setMsg("成功导入" + counts[0] + "条数据,重复数据" + counts[1] + "条");
            result.setSuccess(Boolean.TRUE);
        } catch (Exception e) {
            logger.error("导入客户数据失败", e);
            result.setMsg("导入客户数据失败,失败原因" + e.getMessage());
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
    @RequestMapping("list4select.ajax")
    public ListDataJson list4select(CmsUser user, CustomerQueryParam param) {
        ListDataJson cusList = new ListDataJson();
        try {
            if (StringUtil.isNotEmpty(param.getKeyword())) {
                param.setKeyword("%" + URLDecoder.decode(param.getKeyword(), "utf-8") + "%");
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
            Integer totalCount = customerService.queryCustomerCountByPage(param);
            if (totalCount > 0) {
                //查询数据
                List<TbCustomer> cmsUserList = customerService.queryCustomerListByPage(param);
                cusList.setList(cmsUserList);
            }
            cusList.setRecords(totalCount);

        } catch (Exception e) {
            logger.error("查询客户列表失败!", e);
        }
        return cusList;
    }

    /**
     * 查询
     *
     * @param cId
     * @return
     */
    @ResponseBody
    @RequestMapping("findById.ajax")
    public AjaxJson findById(Integer cId) {
        AjaxJson result = new AjaxJson();
        try {
            //查询数据总量
            TbCustomer customer = customerService.findById(cId);
            result.setObj(customer);
            result.setSuccess(Boolean.TRUE);
        } catch (Exception e) {
            logger.error("查询客户列表失败!", e);
            result.setSuccess(Boolean.FALSE);
        }
        return result;
    }


}
