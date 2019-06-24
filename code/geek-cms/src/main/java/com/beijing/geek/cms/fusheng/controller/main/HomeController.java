package com.beijing.geek.cms.fusheng.controller.main;

import com.beijing.geek.cms.fusheng.service.customer.CustomerService;
import com.beijing.geek.cms.sys.domain.user.CmsUser;
import com.beijing.geek.cms.sys.service.user.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by mazeguo on 2017/6/24.
 */
@Controller
@RequestMapping("/")
public class HomeController {
    private static final Logger logger = Logger.getLogger(HomeController.class);


    /**
     * 进入客户列表
     *
     * @param user
     * @param req
     * @return
     */
    @RequestMapping("home.html")
    public String listHtml(CmsUser user, HttpServletRequest req) {

        return "fusheng/main/home";
    }

}
