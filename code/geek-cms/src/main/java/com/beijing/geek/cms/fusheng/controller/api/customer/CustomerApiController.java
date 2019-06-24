package com.beijing.geek.cms.fusheng.controller.api.customer;

import com.alibaba.fastjson.JSON;
import com.beijing.geek.cms.fusheng.domain.customer.CustomerQueryParam;
import com.beijing.geek.cms.fusheng.domain.customer.TbCustomer;
import com.beijing.geek.cms.fusheng.service.customer.CustomerService;
import com.beijing.geek.cms.sys.domain.common.ApiAjaxJson;
import com.beijing.geek.cms.sys.domain.user.SysUser;
import com.beijing.geek.cms.sys.service.sys.SysRightService;
import com.beijing.geek.cms.sys.service.user.UserService;
import com.beijing.geek.cms.sys.utils.CmsAjaxUtil;
import com.beijing.geek.cms.sys.utils.StringUtil;
import net.sf.json.JSONObject;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.net.URLDecoder;
import java.util.List;

/**
 * Created by mazeguo on 2017/6/12.
 */
@Controller
@RequestMapping("/api/customer/")
public class CustomerApiController {
    private static final Logger logger = Logger.getLogger(CustomerApiController.class);
    @Autowired
    private CustomerService customerService;
    @Autowired
    private UserService userService;

    @Autowired
    private SysRightService sysRightService;

    /**
     * 查询
     *
     * @param body
     * @return
     */
    @ResponseBody
    @RequestMapping("list.ajax")
    public JSONObject list(String body) {
        ApiAjaxJson cusList = new ApiAjaxJson();
        try {
            //封装查询参数
            CustomerQueryParam param = (CustomerQueryParam) JSONObject.toBean(JSONObject.fromObject(body), CustomerQueryParam.class);
            if (StringUtil.isEmpty(param.getUserKey())) {
                throw new Exception("用户Key为空，不能查询客户数据");
            }

            //根据用户Key查询用户信息
            SysUser user = userService.findUserByUserKey(param.getUserKey());
            if (user == null) {
                throw new Exception("用户Key无效，不能查询客户数据");
            }
            if (StringUtil.isNotEmpty(param.getcName())) {//客户姓名
                param.setcName("%" + URLDecoder.decode(param.getcName(), "utf-8").trim() + "%");
            }
            if (StringUtil.isNotEmpty(param.getAddress())) {//客户地址
                param.setAddress("%" + URLDecoder.decode(param.getAddress(), "utf-8").trim() + "%");
            }
            if (StringUtil.isNotEmpty(param.getContact())) {//联系人
                param.setContact("%" + URLDecoder.decode(param.getContact(), "utf-8").trim() + "%");
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
            Integer totalCount = customerService.queryCustomerCountByPage(param);
            if (totalCount > 0) {
                //查询数据
                List<TbCustomer> cmsUserList = customerService.queryCustomerListByPage(param);
                cusList.setList(cmsUserList);
            }
            cusList.setTotalSize(totalCount);
            cusList.setSuccess(Boolean.TRUE);
            cusList.setCode(0);
            cusList.setMessage("查询成功");
        } catch (Exception e) {
            logger.error("查询客户列表失败，请求参数：" + body, e);
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
    public JSONObject findById(String body) {
        ApiAjaxJson result = new ApiAjaxJson();
        try {
            //封装查询参数
            CustomerQueryParam param = (CustomerQueryParam) JSONObject.toBean(JSONObject.fromObject(body), CustomerQueryParam.class);
            if (StringUtil.isEmpty(param.getUserKey())) {
                throw new Exception("用户Key为空，不能查询客户数据");
            }
            //根据用户Key查询用户信息
            SysUser user = userService.findUserByUserKey(param.getUserKey());
            if (user == null) {
                throw new Exception("用户Key无效，不能查询客户数据");
            }

            //查询数据总量
            TbCustomer customer = customerService.findById(param.getcId());
            result.setObj(customer);
            result.setSuccess(Boolean.TRUE);
            result.setCode(0);
            result.setMessage("查询成功");
        } catch (Exception e) {
            logger.error("查询客户列表失败,请求参数:" + body, e);
            result.setSuccess(Boolean.FALSE);
            result.setCode(2);
            result.setMessage("查询失败!");
        }
        return CmsAjaxUtil.apiToJSON(result);
    }


}
