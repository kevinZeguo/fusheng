package com.beijing.geek.cms.fusheng.service.server.impl;

import java.util.ArrayList;
import java.util.List;

import com.beijing.geek.cms.fusheng.domain.server.ServerQueryParam;
import com.beijing.geek.cms.fusheng.utils.FsCodeUtils;
import com.beijing.geek.cms.sys.domain.common.SysAttrValue;
import com.beijing.geek.cms.sys.domain.common.SysFile;
import com.beijing.geek.cms.sys.service.common.SysAttrService;
import com.beijing.geek.cms.sys.service.user.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beijing.geek.cms.fusheng.dao.server.TbMaintenanceDao;
import com.beijing.geek.cms.fusheng.domain.server.TbMaintenance;
import com.beijing.geek.cms.fusheng.service.server.MaintenanceService;
import com.beijing.geek.cms.fusheng.utils.CmsDict;
import com.beijing.geek.cms.sys.service.common.SysFileService;
import com.beijing.geek.cms.sys.utils.StringUtil;

@Service
public class MaintenanceServiceImpl implements MaintenanceService {
    private static final Logger logger = LoggerFactory.getLogger(MaintenanceServiceImpl.class);
    @Autowired
    private TbMaintenanceDao tbMainDao;
    @Autowired
    private SysFileService sysFileService;
    @Autowired
    private UserService userService;
    @Autowired
    private SysAttrService sysAttrService;


    @Override
    public Integer queryMaintenanceCountByPage(ServerQueryParam param) throws Exception {
        return tbMainDao.selectMaintenanceCountByPage(param);
    }

    @Override
    public List<TbMaintenance> queryMaintenanceListByPage(ServerQueryParam param) throws Exception {
        List<TbMaintenance> maintenances = tbMainDao.selectMaintenanceListByPage(param);
        if (maintenances != null && maintenances.size() > 0) {
            for (TbMaintenance maintenance : maintenances) {
                maintenance.setServiceEngineerName(userService.getUserNames(maintenance.getServiceEngineer()));
                List<SysAttrValue> contents = sysAttrService.findByAttrGroupCode("server.maintenance.serverContents");
                StringBuffer content = new StringBuffer();
                if (StringUtil.isNotEmpty(maintenance.getServiceContent())) {
                    String[] cs = maintenance.getServiceContent().split(",");
                    for (String c : cs) {
                        for (SysAttrValue cAttr : contents) {
                            if (String.valueOf(cAttr.getAttrId()).equals(c)) {
                                if (content != null && content.length() > 0) {
                                    content.append(",");
                                }
                                content.append(cAttr.getAttrValue());
                                continue;
                            }
                        }
                    }
                }
                if (StringUtil.isNotEmpty(maintenance.getServiceOtherContent())) {
                    if (content != null && content.length() > 0) {
                        content.append(",");
                    }
                    content.append(maintenance.getServiceOtherContent());
                }
                maintenance.setServiceContentDesc(content.toString());
//                //封装附件列表
//                List<SysFile> files = sysFileService.findFilesByIds(maintenance.getFileIds());
//                if (files != null && files.size() > 0) {
//                    List<String> urlList = new ArrayList<>();
//                    for (SysFile file : files) {
//                        urlList.add(file.getUrl());
//                    }
//                    maintenance.setAttachmentList(urlList);
//                }
            }
        }
        return maintenances;
    }

    @Override
    public void add(TbMaintenance mt, Integer userId) throws Exception {
        mt.setCreator(userId);
        mt.setModifier(userId);
        mt.setFileIds(mt.getPicIds());
        mt.setmCode(FsCodeUtils.getCode("MAINT"));
        tbMainDao.insert(mt);

//        String picIds = mt.getPicIds();
//        List<Integer> fileIds = new ArrayList<>();
//        if (StringUtil.isNotEmpty(picIds)) {
//            for (String fId : picIds.split(",")) {
//                fileIds.add(Integer.parseInt(fId));
//            }
//        }
//        //更新文件地址
//        sysFileService.saveFileAndAppRlt(mt.getId(), CmsDict.SYS_FILE_TYPE_MAINTENANCE, fileIds, userId);
    }

    @Override
    public void edit(TbMaintenance mt, Integer userId) throws Exception {
        String picIds = mt.getPicIds();
        mt.setFileIds(picIds);
//        List<Integer> fileIds = new ArrayList<>();
//        if (StringUtil.isNotEmpty(picIds)) {
//            for (String fId : picIds.split(",")) {
//                fileIds.add(Integer.parseInt(fId));
//            }
//        }
//        //更新文件地址
//        sysFileService.saveFileAndAppRlt(mt.getId(), CmsDict.SYS_FILE_TYPE_MAINTENANCE, fileIds, userId);
        mt.setModifier(userId);
        tbMainDao.updateById(mt);
    }

    @Override
    public TbMaintenance findById(Integer id) throws Exception {
        TbMaintenance maintenance = tbMainDao.selectById(id);
        if (maintenance != null) {
            maintenance.setServiceEngineerName(userService.getUserNames(maintenance.getServiceEngineer()));
            List<SysAttrValue> contents = sysAttrService.findByAttrGroupCode("server.maintenance.serverContents");
            StringBuffer content = new StringBuffer();
            if (StringUtil.isNotEmpty(maintenance.getServiceContent())) {
                String[] cs = maintenance.getServiceContent().split(",");
                for (String c : cs) {
                    for (SysAttrValue cAttr : contents) {
                        if (String.valueOf(cAttr.getAttrId()).equals(c)) {
                            if (content != null && content.length() > 0) {
                                content.append(",");
                            }
                            content.append(cAttr.getAttrValue());
                            continue;
                        }
                    }
                }
            }
            if (StringUtil.isNotEmpty(maintenance.getServiceOtherContent())) {
                if (content != null && content.length() > 0) {
                    content.append(",");
                }
                content.append(maintenance.getServiceOtherContent());
            }
            maintenance.setServiceContentDesc(content.toString());

            //封装附件列表
            List<SysFile> files = sysFileService.findFilesByIds(maintenance.getFileIds());
            if (files != null && files.size() > 0) {
                List<String> urlList = new ArrayList<>();
                for (SysFile file : files) {
                    urlList.add(file.getUrl());

                }
                maintenance.setAttachmentList(urlList);
            }

        }
        return maintenance;
    }

    @Override
    public void deleteById(Integer id, Integer userId) throws Exception {
        TbMaintenance maintenance = new TbMaintenance();
        maintenance.setId(id);
        maintenance.setModifier(userId);
        tbMainDao.deleteById(maintenance);
        this.sysFileService.deleteByAppIdAndType(id, CmsDict.SYS_FILE_TYPE_MAINTENANCE, userId);
    }

    @Override
    public boolean pCodeIsUsed(String mCode, Integer id) throws Exception {
        List<TbMaintenance> list = tbMainDao.selectByCode(mCode);
        if (list == null || list.size() == 0) {
            return false;
        } else if (list.size() >= 1) {
            if (id != null) {
                for (int i = 0; i < list.size(); i++) {
                    if (list.get(i).getId().equals(id)) {
                        return false;
                    }
                }
            }
        }
        return true;
    }
}
