package com.beijing.geek.cms.fusheng.service.server.impl;

import com.beijing.geek.cms.fusheng.dao.server.TbServeDebugDao;
import com.beijing.geek.cms.fusheng.domain.server.ServerQueryParam;
import com.beijing.geek.cms.fusheng.domain.server.TbServeDebug;
import com.beijing.geek.cms.fusheng.service.server.ServeDebugService;
import com.beijing.geek.cms.fusheng.utils.CmsDict;
import com.beijing.geek.cms.fusheng.utils.FsCodeUtils;
import com.beijing.geek.cms.sys.domain.common.SysFile;
import com.beijing.geek.cms.sys.service.common.SysFileService;
import com.beijing.geek.cms.sys.service.user.UserService;
import com.beijing.geek.cms.sys.utils.StringUtil;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by mazeguo on 2017/8/13.
 */
@Service
public class ServeDebugServiceImpl implements ServeDebugService {

    private static final Logger logger = Logger.getLogger(ServeDebugServiceImpl.class);
    @Autowired
    private TbServeDebugDao tbServeDebugDao;
    @Autowired
    private SysFileService sysFileService;
    @Autowired
    private UserService userService;

    @Override
    public Integer queryDebugCountByPage(ServerQueryParam param) throws Exception {
        return tbServeDebugDao.selectDebugCountByPage(param);
    }

    @Override
    public List<TbServeDebug> queryDebugListByPage(ServerQueryParam param) throws Exception {
        List<TbServeDebug> serveDebugs = tbServeDebugDao.selectDebugListByPage(param);
        if (serveDebugs != null && serveDebugs.size() > 0) {
            for (TbServeDebug serveDebug : serveDebugs) {
                serveDebug.setServiceEngineerName(userService.getUserNames(serveDebug.getServiceEngineer()));
                //封装附件列表
                List<SysFile> files = sysFileService.findFilesByIds(serveDebug.getFileIds());
                if (files != null && files.size() > 0) {
                    List<String> urlList = new ArrayList<>();
                    for (SysFile file : files) {
                        urlList.add(file.getUrl());

                    }
                    serveDebug.setAttachmentList(urlList);
                    serveDebug.setPicIds(serveDebug.getFileIds());
                }

            }
        }
        return serveDebugs;
    }

    @Override
    public TbServeDebug findById(Integer id) throws Exception {
        TbServeDebug serveDebug = tbServeDebugDao.selectById(id);
        if (serveDebug != null) {
            serveDebug.setServiceEngineerName(userService.getUserNames(serveDebug.getServiceEngineer()));

            //封装附件列表
            List<SysFile> files = sysFileService.findFilesByIds(serveDebug.getFileIds());
            if (files != null && files.size() > 0) {
                List<String> urlList = new ArrayList<>();
                for (SysFile file : files) {
                    urlList.add(file.getUrl());

                }
                serveDebug.setAttachmentList(urlList);
                serveDebug.setPicIds(serveDebug.getFileIds());
            }
        }
        return serveDebug;
    }

    @Override
    public void editServeDebug(TbServeDebug serveDebug, Integer userId) throws Exception {
        serveDebug.setModifier(userId);
        serveDebug.setFileIds(serveDebug.getPicIds());
        tbServeDebugDao.updateById(serveDebug);
//        List<Integer> arFiles = new ArrayList<>();
//        if (StringUtil.isNotEmpty(serveDebug.getPicIds())) {
//            for (String fId : serveDebug.getPicIds().split(",")) {
//                arFiles.add(Integer.parseInt(fId));
//            }
//        }
//        //修改附件
//        sysFileService.saveFileAndAppRlt(serveDebug.getId(), CmsDict.SYS_FILE_TYPE_DEBUG, arFiles, userId);
    }

    @Override
    public void saveServeDebug(TbServeDebug serveDebug, Integer userId) throws Exception {
        serveDebug.setModifier(userId);
        serveDebug.setCreator(userId);
        serveDebug.setCode(FsCodeUtils.getCode("DEBUG"));
        serveDebug.setFileIds(serveDebug.getPicIds());
        tbServeDebugDao.insert(serveDebug);
//        List<Integer> arFiles = new ArrayList<>();
//        if (StringUtil.isNotEmpty(serveDebug.getPicIds())) {
//            for (String fId : serveDebug.getPicIds().split(",")) {
//                arFiles.add(Integer.parseInt(fId));
//            }
//        }
//        //修改附件
//        sysFileService.saveFileAndAppRlt(serveDebug.getId(), CmsDict.SYS_FILE_TYPE_DEBUG, arFiles, userId);
    }

    @Override
    public void deleteById(Integer id, Integer userId) throws Exception {
        TbServeDebug debug = new TbServeDebug();
        debug.setId(id);
        debug.setModifier(userId);
        tbServeDebugDao.deleteById(debug);
    }
}
