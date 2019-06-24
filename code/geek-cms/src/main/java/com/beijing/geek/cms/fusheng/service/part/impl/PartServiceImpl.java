package com.beijing.geek.cms.fusheng.service.part.impl;

import java.util.ArrayList;
import java.util.List;

import com.beijing.geek.cms.sys.domain.common.SysFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beijing.geek.cms.fusheng.dao.part.TbPartDao;
import com.beijing.geek.cms.fusheng.domain.part.PartQueryParam;
import com.beijing.geek.cms.fusheng.domain.part.TbPart;
import com.beijing.geek.cms.fusheng.service.part.PartService;
import com.beijing.geek.cms.fusheng.utils.CmsDict;
import com.beijing.geek.cms.sys.service.common.SysFileService;
import com.beijing.geek.cms.sys.utils.StringUtil;

@Service
public class PartServiceImpl implements PartService {

    @Autowired
    private TbPartDao tbPartDao;
    @Autowired
    private SysFileService sysFileService;

    @Override
    public Integer queryPartCountByPage(PartQueryParam param) throws Exception {
        // TODO Auto-generated method stub

        return tbPartDao.selectPartCountByPage(param);
    }

    @Override
    public List<TbPart> queryPartListByPage(PartQueryParam param) throws Exception {
        // TODO Auto-generated method stub
        List<TbPart> arParts = tbPartDao.selectPartListByPage(param);
        if (arParts != null && arParts.size() > 0) {
            for (int i = 0; i < arParts.size(); i++) {
                TbPart part = arParts.get(i);
                List<SysFile> sysFiles = sysFileService.findFilesByIds(part.getFileIds());
                if (sysFiles != null && sysFiles.size() > 0) {
                    StringBuffer fileNames = new StringBuffer();
                    for (SysFile file : sysFiles) {
                        if (fileNames.length() > 0) {
                            fileNames.append(",");
                        }
                        fileNames.append(file.getFileName());
                    }
                    part.setpPicFile(fileNames.toString());
                }
            }
        }
        return arParts;///tbPartDao.selectPartListByPage(param);
    }

    @Override
    public TbPart queryById(Integer pId) throws Exception {
        // TODO Auto-generated method stub
        TbPart part = tbPartDao.selectById(pId);
        if (part != null) {
            String pPic = part.getFileIds();
            if (StringUtil.isNotEmpty(pPic)) {
                String pPicFile = "";
                for (String fId : pPic.split(",")) {
                    String sFileName = sysFileService.findFileById(Integer.parseInt(fId)).getFileName();
                    pPicFile += sFileName + ",";
                }
                pPicFile = pPicFile.substring(0, pPicFile.length() - 1);
                part.setpPicFile(pPicFile);
            }
        }
        return tbPartDao.selectById(pId);
    }

    @Override
    public void addPart(TbPart part, Integer userId) throws Exception {
        // TODO Auto-generated method stub
        part.setCreator(userId);
        part.setFileIds(part.getpPic());
        tbPartDao.insert(part);
//        String pPic = part.getpPic();
//        List<Integer> arFiles = new ArrayList<>();
//        pPic = pPic.trim();
//        if (StringUtil.isNotEmpty(pPic)) {
//            for (String fId : pPic.split(",")) {
//                arFiles.add(Integer.parseInt(fId));
//            }
//        }
//        //更新文件地址
//        sysFileService.saveFileAndAppRlt(part.getpId(), CmsDict.SYS_FILE_TYPE_PART, arFiles, userId);
    }

    @Override
    public void editPart(TbPart part, Integer userId) throws Exception {
        // TODO Auto-generated method stub
//        String pPic = part.getpPic();
//        List<Integer> fileIds = new ArrayList<>();
//        pPic = pPic.trim();
//        if (StringUtil.isNotEmpty(pPic)) {
//            for (String fId : pPic.split(",")) {
//                fileIds.add(Integer.parseInt(fId));
//            }
//        }
//        //更新文件地址
//        sysFileService.saveFileAndAppRlt(part.getpId(), CmsDict.SYS_FILE_TYPE_PART, fileIds, userId);
        part.setModifier(userId);
        part.setFileIds(part.getpPic());
        tbPartDao.updateById(part);
    }

    @Override
    public void deletePart(Integer pId, Integer userId) throws Exception {
        // TODO Auto-generated method stub
        tbPartDao.deleteById(pId, userId);
    }

    @Override
    public boolean pNameIsUsed(String pName, Integer pId) throws Exception {
        List<TbPart> partList = tbPartDao.selectBypName(pName);
        if (partList == null || partList.size() == 0) {
            return false;
        } else if (partList.size() == 1) {
            if (pId != null) {
                if (partList.get(0).getpId().equals(pId)) {
                    return false;
                }
            }
        }
        return true;
    }

    @Override
    public boolean pCodeIsUsed(String pCode, Integer pId) throws Exception {
        List<TbPart> partList = tbPartDao.selectBypCode(pCode);
        if (partList == null || partList.size() == 0) {
            return false;
        } else if (partList.size() >= 1) {
            if (pId != null) {
                for (int i = 0; i < partList.size(); i++) {
                    if (partList.get(i).getpId().equals(pId)) {
                        return false;
                    }
                }
            }
        }
        return true;
    }

    @Override
    public List<TbPart> queryStoragePartList(PartQueryParam param) throws Exception {
        return tbPartDao.selectStoragePartList(param);
    }
}
