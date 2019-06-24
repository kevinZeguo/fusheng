package com.beijing.geek.cms.fusheng.service.contract.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beijing.geek.cms.fusheng.dao.contract.TbContractDao;
import com.beijing.geek.cms.fusheng.domain.contract.ContractQueryParam;
import com.beijing.geek.cms.fusheng.domain.contract.TbContract;
import com.beijing.geek.cms.fusheng.service.contract.ContractService;
import com.beijing.geek.cms.fusheng.utils.CmsDict;
import com.beijing.geek.cms.sys.domain.common.SysFile;
import com.beijing.geek.cms.sys.service.common.SysFileService;
import com.beijing.geek.cms.sys.utils.StringUtil;


/**
 * Created by zhangyongquan on 2017/6/13.
 */
@Service
public class ContractServiceImpl implements ContractService {
    @Autowired
    private TbContractDao tbContractDao;
    @Autowired
    private SysFileService sysFileService;

    @Override
    public Integer queryContractCountByPage(ContractQueryParam param) throws Exception {
        // TODO Auto-generated method stub
        return tbContractDao.selectContractCountByPage(param);
    }

    @Override
    public List<TbContract> queryContractListByPage(ContractQueryParam param) throws Exception {
        // TODO Auto-generated method stub

        return tbContractDao.selectContractListByPage(param);
    }

    @Override
    public void addContract(TbContract contract, Integer userId) throws Exception {
        contract.setCreator(userId);
        contract.setFileIds(contract.getContractFile());
        tbContractDao.insert(contract);
//        String contractFile = contract.getContractFile();
//        List<Integer> arFiles = new ArrayList<>();
//        if (StringUtil.isNotEmpty(contractFile)) {
//            for (String fId : contractFile.split(",")) {
//                arFiles.add(Integer.parseInt(fId));
//            }
//        }
//        //更新文件地址
//        sysFileService.saveFileAndAppRlt(contract.getId(), CmsDict.SYS_FILE_TYPE_CONTRACT, arFiles, userId);
    }

    @Override
    public void editContract(TbContract contract, Integer userId) throws Exception {
        String contractFile = contract.getContractFile();
        contract.setFileIds(contractFile);
//        List<Integer> fileIds = new ArrayList<>();
//        if (StringUtil.isNotEmpty(contractFile)) {
//            for (String fId : contractFile.split(",")) {
//                fileIds.add(Integer.parseInt(fId));
//            }
//        }
//        //更新文件地址
//        sysFileService.saveFileAndAppRlt(contract.getId(), CmsDict.SYS_FILE_TYPE_CONTRACT, fileIds, userId);
        contract.setModifier(userId);
        tbContractDao.updateById(contract);
    }

    @Override
    public void deleteById(Integer cId, Integer userId) throws Exception {
        //先删除客户设备信息
        //然后删除客户信息
        tbContractDao.deleteById(cId, userId);
    }

    @Override
    public TbContract queryById(Integer cId) throws Exception {
        TbContract contract = tbContractDao.selectById(cId);
        if (contract != null) {
            List<SysFile> arFiles = sysFileService.findFilesByIds(contract.getFileIds());
            StringBuffer contractFile = new StringBuffer();
            if (arFiles != null && arFiles.size() > 0) {
                for (int i = 0; i < arFiles.size(); i++) {
                    if (contractFile != null) {
                        contractFile.append(",");
                    }
                    contractFile.append(arFiles.get(i).getFileName());
                }
                contract.setContractFile(contractFile.toString());
                contract.setContractFileId(contract.getFileIds());
            }
        }
        return contract;
    }

    @Override
    public TbContract findById(Integer cId) throws Exception {
        return tbContractDao.selectById(cId);
    }
}
