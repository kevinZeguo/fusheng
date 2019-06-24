package com.beijing.geek.cms.fusheng.controller.part;

import java.net.URLDecoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.beijing.geek.cms.fusheng.domain.part.PartQueryParam;
import com.beijing.geek.cms.fusheng.domain.part.TbPart;
import com.beijing.geek.cms.fusheng.service.part.PartService;
import com.beijing.geek.cms.sys.domain.common.AjaxJson;
import com.beijing.geek.cms.sys.domain.common.ListDataJson;
import com.beijing.geek.cms.sys.domain.user.CmsUser;
import com.beijing.geek.cms.sys.utils.ObjectUtils;
import com.beijing.geek.cms.sys.utils.StringUtil;

/**
 * Created by zhangyongquan on 2017/07/06.
 */
@Controller
@RequestMapping("/part/")
public class PartController {
    private static final Logger logger = Logger.getLogger(PartController.class);
    @Autowired
    private PartService partService;

    /**
     * 跳转到配件信息页
     *
     * @param user
     * @param req
     * @return
     */
    @RequestMapping("index.html")
    public String listHtml(CmsUser user, HttpServletRequest req) {
        return "cms/fusheng/part/list";
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
    public ListDataJson list(CmsUser user, PartQueryParam param) {
        ListDataJson partList = new ListDataJson();
        try {
            if (StringUtil.isNotEmpty(param.getpCode()))///配件编号增加模糊查询
            {
                param.setpCode("%" + URLDecoder.decode(param.getpCode(), "utf-8").trim() + "%");
            }
            if (StringUtil.isNotEmpty(param.getpName()))///配件名称增加模糊查询
            {
                param.setpName("%" + URLDecoder.decode(param.getpName(), "utf-8").trim() + "%");
            }
            if (StringUtil.isNotEmpty(param.getKeyword()))///配件名称增加模糊查询
            {
                param.setKeyword("%" + URLDecoder.decode(param.getKeyword(), "utf-8").trim() + "%");
            }
            partList.setPage(param.getPage());
            partList.setLimit(param.getLimit());
            Integer totalCount = partService.queryPartCountByPage(param);
            if (totalCount > 0) {
                List<TbPart> tbPartList = partService.queryPartListByPage(param);
                partList.setList(tbPartList);
            }
            partList.setRecords(totalCount);
        } catch (Exception e) {
            logger.error("查询配件信息失败！", e);
        }
        return partList;
    }

    /**
     * 取得配件信息列表
     *
     * @param user
     * @param param
     * @return
     */
    @ResponseBody
    @RequestMapping("storagePart.ajax")
    public ListDataJson storagePart(CmsUser user, PartQueryParam param) {
        ListDataJson partList = new ListDataJson();
        try {
            if (StringUtil.isNotEmpty(param.getKeyword())) {
                param.setKeyword("%" + URLDecoder.decode(param.getKeyword(), "utf-8").trim() + "%");
            }
            partList.setPage(param.getPage());
            partList.setLimit(param.getLimit());
            List<TbPart> tbPartList = partService.queryStoragePartList(param);
            partList.setList(tbPartList);
        } catch (Exception e) {
            logger.error("查询仓库存在配件列表！", e);
        }
        return partList;
    }

    /**
     * @param pName
     * @param pId
     * @return 判断配件名称是否重复
     */
    @ResponseBody
    @RequestMapping("nameIsUsed.ajax")
    public AjaxJson nameIsUsed(String pName, Integer pId) {
        AjaxJson result = new AjaxJson();
        try {
            boolean isUsed = partService.pNameIsUsed(pName, pId);///数据库中查询名称是否重复
            result.setSuccess(!isUsed);
            result.setMsg("校验成功");
        } catch (Exception e) {
            logger.error("查询配件信息失败！", e);
            result.setMsg("校验失败");
            result.setSuccess(false);
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("codeIsUsed.ajax")
    public AjaxJson codeIsUsed(String pCode, Integer pId) {
        AjaxJson result = new AjaxJson();
        try {
            boolean isUsed = partService.pCodeIsUsed(pCode, pId);///数据库中查询件号是否重复
            result.setSuccess(!isUsed);
            result.setMsg("校验成功");
        } catch (Exception e) {
            logger.error("查询配件信息失败！", e);
            result.setMsg("校验失败");
            result.setSuccess(false);
        }
        return result;
    }

    @RequestMapping("add.html")
    public String addHtml(CmsUser user, Model model) {
        model.addAttribute("add", "add");
        return "cms/fusheng/part/add";
    }

    @RequestMapping("edit.html")
    public String editHtml(CmsUser user, HttpServletRequest req, Integer pId, Model model) {
        model.addAttribute("add", "edit");
        try {
            TbPart tbPart = partService.queryById(pId);
            if (tbPart != null) {
                model.addAttribute("part", tbPart);
            }
        } catch (Exception e) {
            logger.error("进入配件编辑页面失败！，配件编号=【" + pId + "】", e);
        }
        return "cms/fusheng/part/add";
    }

    @ResponseBody
    @RequestMapping("save.ajax")
    public AjaxJson save(CmsUser user, TbPart tbPart) {
        AjaxJson result = new AjaxJson();
        ///tbPart.setpPic(pPic);
        try {
            if (tbPart.getpId() != null) {
                partService.editPart(tbPart, user.getUserId());
            } else {
                partService.addPart(tbPart, user.getUserId());
            }
            result.setSuccess(Boolean.TRUE);
            result.setMsg("");
        } catch (Exception e) {
            logger.error("保存配件信息失败，入参：" + ObjectUtils.objToString(tbPart), e);
            result.setSuccess(Boolean.FALSE);
            result.setMsg(e.getMessage());
        }

        return result;
    }

    @ResponseBody
    @RequestMapping("delete.ajax")
    public AjaxJson delete(Integer pId, HttpServletRequest request) {
        CmsUser user = (CmsUser) request.getAttribute("cmsUser");
        AjaxJson result = new AjaxJson();

        try {
            partService.deletePart(pId, user.getUserId());
            result.setSuccess(Boolean.TRUE);
        } catch (Exception e) {
            logger.error("删除配件信息失败，配件编号=【" + pId + "】：", e);
            result.setSuccess(Boolean.FALSE);
            result.setMsg(e.getMessage());
        }
        return result;
    }

    @RequestMapping("info.html")
    public String infoHtml(CmsUser user, Integer pId, Model model) {
        try {
            TbPart tbPart = partService.queryById(pId);
            if (tbPart != null) {
                model.addAttribute("part", tbPart);
            }
        } catch (Exception e) {
            // TODO: handle exception
            logger.error("查询配件信息失败，配件编号=【" + pId + "】：", e);
        }
        return "cms/fusheng/part/info";
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
    public ListDataJson list4select(CmsUser user, PartQueryParam param) {
        ListDataJson cusList = new ListDataJson();
        try {
            if (StringUtil.isNotEmpty(param.getKeyword())) {
                param.setKeyword("%" + URLDecoder.decode(param.getKeyword(), "utf-8") + "%");
            }
            param.setStart(0);
            param.setLimit(20);
            //查询数据总量
            Integer totalCount = partService.queryPartCountByPage(param);
            if (totalCount > 0) {
                //查询数据
                List<TbPart> cmsUserList = partService.queryPartListByPage(param);
                cusList.setList(cmsUserList);
            }
            cusList.setRecords(totalCount);

        } catch (Exception e) {
            logger.error("查询配件列表失败!", e);
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
    public AjaxJson findById(Integer pId) {
        AjaxJson result = new AjaxJson();
        try {
            //查询数据总量
            TbPart part = partService.queryById(pId);
            result.setObj(part);
            result.setSuccess(Boolean.TRUE);
        } catch (Exception e) {
            logger.error("查询配件列表失败!", e);
            result.setSuccess(Boolean.FALSE);
        }
        return result;
    }
}
