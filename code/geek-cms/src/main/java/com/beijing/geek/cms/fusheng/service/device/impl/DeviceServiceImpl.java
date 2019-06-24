package com.beijing.geek.cms.fusheng.service.device.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import com.beijing.geek.cms.fusheng.dao.device.TbEquPartDao;
import com.beijing.geek.cms.fusheng.domain.device.TbEquPart;
import com.beijing.geek.cms.fusheng.utils.CmsDict;
import com.beijing.geek.cms.fusheng.utils.FsCodeUtils;
import com.beijing.geek.cms.sys.domain.common.SysFile;
import com.beijing.geek.cms.sys.service.common.SysFileService;
import com.beijing.geek.cms.sys.utils.StringUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.beijing.geek.cms.fusheng.dao.device.TbEquipmentDao;
import com.beijing.geek.cms.fusheng.domain.customer.CustomerQueryParam;
import com.beijing.geek.cms.fusheng.domain.customer.TbCustomer;
import com.beijing.geek.cms.fusheng.domain.device.DeviceQueryParam;
import com.beijing.geek.cms.fusheng.domain.device.TbEquipment;
import com.beijing.geek.cms.fusheng.service.device.DeviceService;
import com.beijing.geek.cms.sys.domain.user.CmsUser;

/**
 * Created by mazeguo on 2017/6/12.
 */
@Service
public class DeviceServiceImpl implements DeviceService {
    private static final Logger logger = LoggerFactory.getLogger(DeviceServiceImpl.class);
    @Autowired
    private TbEquipmentDao tbEquipmentDao;
    @Autowired
    private SysFileService sysFileService;
    @Autowired
    private TbEquPartDao tbEquPartDao;

    @Override
    public Integer queryDeviceCountByPage(DeviceQueryParam param)
            throws Exception {
        return tbEquipmentDao.selectDeviceCountByPage(param);
    }

    @Override
    public List<TbEquipment> queryDeviceListByPage(DeviceQueryParam param)
            throws Exception {
        List<TbEquipment> equipmentList = tbEquipmentDao.selectDeviceListByPage(param);
        return equipmentList;
    }

    @Override
    public void add(TbEquipment eq, Integer userId) throws Exception {
        eq.setCreator(userId);
        eq.setModifier(userId);
        eq.seteCode(FsCodeUtils.getDeviceCode());
        eq.setFileIds(eq.getePicIds());
        tbEquipmentDao.insert(eq);

//        String ePicIds = eq.getePicIds();
//        List<Integer> fileIds = new ArrayList<>();
//        if (StringUtil.isNotEmpty(ePicIds)) {
//            for (String fId : ePicIds.split(",")) {
//                fileIds.add(Integer.parseInt(fId));
//            }
//        }
//        //更新文件地址
//        sysFileService.saveFileAndAppRlt(eq.geteId(), CmsDict.SYS_FILE_TYPE_DEVICE, fileIds, userId);

    }

    @Override
    public void edit(TbEquipment eq, Integer userId) throws Exception {
//        String ePicIds = eq.getePicIds();
//        List<Integer> fileIds = new ArrayList<>();
//        if (StringUtil.isNotEmpty(ePicIds)) {
//            for (String fId : ePicIds.split(",")) {
//                fileIds.add(Integer.parseInt(fId));
//            }
//        }
//        //更新文件地址
//        sysFileService.saveFileAndAppRlt(eq.geteId(), CmsDict.SYS_FILE_TYPE_DEVICE, fileIds, userId);
        eq.setModifier(userId);
        eq.setFileIds(eq.getePicIds());
        tbEquipmentDao.updateByPrimaryKeySelective(eq);
    }

    @Override
    public TbEquipment findById(Integer eid) throws Exception {
        return tbEquipmentDao.selectById(eid);
    }

    @Override
    public void deleteById(Integer eId, Integer userId) throws Exception {
        tbEquipmentDao.deleteByPrimaryKey(eId);
        this.sysFileService.deleteByAppIdAndType(eId, CmsDict.SYS_FILE_TYPE_DEVICE, userId);
    }

    @Override
    public Integer[] importDeviceByExcel(File file, String fileType, Integer userId, Integer customerId) throws Exception {
        Integer[] result = new Integer[2];
        //读取excel数据信息
        List<TbEquipment> deviceList = new ArrayList<TbEquipment>();
        if ("xls".equals(fileType) || "XLS".equals(fileType)) {
            deviceList = importXls(file);
        } else if ("xlsx".equals(fileType) || "XLSX".equals(fileType)) {
            deviceList = importXlsx(file);
        }
        Integer importCount = 0;
        Integer repeatCount = 0;

        if (deviceList != null && deviceList.size() > 0) {
            for (TbEquipment tbEquipment : deviceList) {
                if (StringUtil.isEmpty(tbEquipment.getMakeNum())) {
                    repeatCount++;
                    continue;
                }
                tbEquipment.seteCode(FsCodeUtils.getDeviceCode());
                tbEquipment.setCustomerId(customerId);
                //判断用户是否已经存在
                boolean isExist = this.makeNumIsUsed(tbEquipment.getMakeNum(), null);
                if (isExist) {//用户已经存在,跳过
                    repeatCount++;
                    continue;
                }
                this.add(tbEquipment, userId);
                importCount++;
            }
            result[0] = importCount;
            result[1] = repeatCount;
            return result;
        }
        //保存excel数据信息
        //保存excel数据信息
        result[0] = 0;
        result[1] = 0;
        return result;
    }

    @Override
    public Integer queryPartCountByPage(DeviceQueryParam param) throws Exception {
        return tbEquPartDao.selectPartCountByPage(param);
    }

    @Override
    public List<TbEquPart> queryPartListByPage(DeviceQueryParam param) throws Exception {
        List<TbEquPart> parts = tbEquPartDao.selectPartListByPage(param);

        return parts;
    }

    @Override
    public void saveEqParts(List<Integer> pIdlist, Integer eId, Integer userId) throws Exception {
        for (Integer id : pIdlist) {
            TbEquPart part = new TbEquPart();
            part.setpId(id);
            part.seteId(eId);
            part.setCreator(userId);
            part.setModifier(userId);
            tbEquPartDao.insert(part);
        }
    }

    @Override
    public void deleteEqParts(List<Integer> pIdlist, Integer eId, Integer userId) throws Exception {
        for (Integer id : pIdlist) {
            TbEquPart part = new TbEquPart();
            part.setpId(id);
            part.seteId(eId);
            part.setModifier(userId);
            tbEquPartDao.deletePart(part);
        }
    }

    private boolean makeNumIsUsed(String makeNum, Integer eId) throws Exception {
        List<TbEquipment> equipments = tbEquipmentDao.selectByMakeNum(makeNum);
        if (equipments == null || equipments.size() == 0) {
            return false; //未被占用
        }
        if (equipments.size() == 1) {
            if (eId == null) {
                return true;
            }
            if (equipments.get(0).geteId().equals(eId)) {
                return false;
            }
            return true;
        }
        return true;
    }

    /**
     * 解析 07 版本之前的excel
     *
     * @param file
     * @return
     */
    private List<TbEquipment> importXls(File file) {
        List<TbEquipment> deviceList = new ArrayList<TbEquipment>();
        InputStream is = null;
        HSSFWorkbook hWorkbook = null;
        try {
            is = new FileInputStream(file);
            hWorkbook = new HSSFWorkbook(is);
            //默认只在第一页保存数据
            HSSFSheet hSheet = hWorkbook.getSheetAt(0);

            if (null != hSheet && hSheet.getPhysicalNumberOfRows() > 1) {
                for (int i = 1; i < hSheet.getPhysicalNumberOfRows(); i++) {
                    TbEquipment tb = new TbEquipment();
                    HSSFRow hRow = hSheet.getRow(i);
                    tb.seteModel(hRow.getCell(0).toString());
                    tb.setMakeNum(hRow.getCell(1).toString());
                    tb.setHostNum(hRow.getCell(2).toString());
                    tb.setOldHostNum(hRow.getCell(3).toString());
                    tb.setMotorBrand(hRow.getCell(4).toString());
                    tb.setElecPanModel(hRow.getCell(5).toString());
                    tb.setMotorMakeDate(hRow.getCell(6).getDateCellValue());
                    tb.setMachineryNumber(hRow.getCell(7).toString());
                    tb.setMotorModel(hRow.getCell(8).toString());
                    tb.setRegularCheck((int) hRow.getCell(9).getNumericCellValue());
                    tb.setCheckMonths((int) hRow.getCell(10).getNumericCellValue());
                    tb.setNote(hRow.getCell(11).toString());
                    deviceList.add(tb);
                }
            }
        } catch (Exception e) {
            logger.error("解析07之前版本excel失败", e);
        } finally {
            if (null != is) {
                try {
                    is.close();
                } catch (Exception e) {
                    logger.error("解析07之前版本excel失败", e);
                }
            }

            if (null != hWorkbook) {
                try {
                    hWorkbook.close();
                } catch (Exception e) {
                    logger.error("解析07之前版本excel失败", e);
                }
            }
        }

        return deviceList;
    }

    /**
     * 解析07 及 07以上版本excel
     *
     * @param file
     * @return
     */
    private List<TbEquipment> importXlsx(File file) {
        List<TbEquipment> deviceList = new ArrayList<TbEquipment>();

        InputStream is = null;
        XSSFWorkbook xWorkbook = null;
        try {
            is = new FileInputStream(file);
            xWorkbook = new XSSFWorkbook(is);
            XSSFSheet xSheet = xWorkbook.getSheetAt(0);

            if (null != xSheet && xSheet.getPhysicalNumberOfRows() > 1) {
                for (int i = 1; i < xSheet.getPhysicalNumberOfRows(); i++) {
                    XSSFRow xRow = xSheet.getRow(i);
                    TbEquipment tb = new TbEquipment();
                    tb.seteModel(xRow.getCell(0).toString());
                    tb.setMakeNum(xRow.getCell(1).toString());
                    tb.setHostNum(xRow.getCell(2).toString());
                    tb.setOldHostNum(xRow.getCell(3).toString());
                    tb.setMotorBrand(xRow.getCell(4).toString());
                    tb.setElecPanModel(xRow.getCell(5).toString());
                    tb.setMotorMakeDate(xRow.getCell(6).getDateCellValue());
                    tb.setMachineryNumber(xRow.getCell(7).toString());
                    tb.setMotorModel(xRow.getCell(8).toString());
                    tb.setRegularCheck((int) xRow.getCell(9).getNumericCellValue());
                    tb.setCheckMonths((int) xRow.getCell(10).getNumericCellValue());
                    tb.setNote(xRow.getCell(11).toString());
                    deviceList.add(tb);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (null != is) {
                try {
                    is.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

            if (null != xWorkbook) {
                try {
                    xWorkbook.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }

        return deviceList;
    }

}
