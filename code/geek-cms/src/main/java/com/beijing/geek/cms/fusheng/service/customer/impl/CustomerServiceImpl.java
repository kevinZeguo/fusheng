package com.beijing.geek.cms.fusheng.service.customer.impl;

import com.beijing.geek.cms.fusheng.dao.customer.TbCustomerDao;
import com.beijing.geek.cms.fusheng.domain.customer.CustomerQueryParam;
import com.beijing.geek.cms.fusheng.domain.customer.TbCustomer;
import com.beijing.geek.cms.fusheng.service.customer.CustomerService;
import com.beijing.geek.cms.fusheng.utils.FsCodeUtils;
import com.beijing.geek.cms.sys.domain.user.SysUser;
import com.beijing.geek.cms.sys.service.user.UserService;
import com.beijing.geek.cms.sys.utils.StringUtil;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by mazeguo on 2017/6/12.
 */
@Service
public class CustomerServiceImpl implements CustomerService {
    private static final Logger logger = Logger.getLogger(CustomerServiceImpl.class);
    @Autowired
    private TbCustomerDao tbCustomerDao;
    @Autowired
    private UserService userService;

    @Override
    public Integer queryCustomerCountByPage(CustomerQueryParam param) throws Exception {
        return tbCustomerDao.selectCustomerCountByPage(param);
    }

    @Override
    public List<TbCustomer> queryCustomerListByPage(CustomerQueryParam param) throws Exception {
        return tbCustomerDao.selectCustomerListByPage(param);
    }

    @Override
    public TbCustomer findById(Integer cId) throws Exception {
        return tbCustomerDao.selectById(cId);
    }

    @Override
    public void addCustomer(TbCustomer customer, Integer userId) throws Exception {
        customer.setcCode(FsCodeUtils.getCustomerCode());
        customer.setCreator(userId);
        customer.setModifier(userId);
        tbCustomerDao.insert(customer);
    }

    @Override
    public void editCustomer(TbCustomer customer, Integer userId) throws Exception {
        //先根据客户Id查询客户信息
        TbCustomer customerTmp = tbCustomerDao.selectById(customer.getcId());
        if (customerTmp == null) {
            throw new Exception("客户不存在，无法修改!");
        }
        customer.setcCode(customerTmp.getcCode());
        customer.setModifier(userId);
        tbCustomerDao.updateById(customer);
    }

    @Override
    public void deleteById(Integer cId, Integer userId) throws Exception {
        //先删除客户设备信息
        //然后删除客户信息
        tbCustomerDao.deleteById(cId, userId);
    }

    @Override
    public Integer[] importCustomerByExcel(File file, String fileType, Integer userId) throws Exception {
        Integer[] result = new Integer[2];
        //读取excel数据信息
        List<TbCustomer> customerList = new ArrayList<>();
        if ("xls".equals(fileType) || "XLS".equals(fileType)) {
            customerList = importXls(file);
        } else if ("xlsx".equals(fileType) || "XLSX".equals(fileType)) {
            customerList = importXlsx(file);
        }

        Integer importCount = 0;
        Integer repeatCount = 0;

        if (customerList != null && customerList.size() > 0) {
            logger.info("恭导入客户信息:" + customerList.size() + "条");
            for (TbCustomer customer : customerList) {
                if (StringUtils.isBlank(customer.getcName())) {//客户名称为空
                    repeatCount++;
                    continue;
                }
                //判断用户是否已经存在
                boolean isExist = this.cNameIsUsed(customer.getcName(), null);
                if (isExist) {//用户已经存在,跳过
                    repeatCount++;
                    continue;
                }

                //查询服务工程编号
                SysUser serviceEngineer = userService.queryUserByRealName(customer.getServiceEngineer());
                if (serviceEngineer != null) {
                    customer.setServiceEngineer(serviceEngineer.getUserId() + "");
                } else {
                    customer.setServiceEngineer(userId + "");
                }
                this.addCustomer(customer, userId);
                importCount++; //导入数量
            }
            result[0] = importCount;
            result[1] = repeatCount;
            return result;
        }
        //保存excel数据信息
        result[0] = 0;
        result[1] = 0;
        return result;
    }

    @Override
    public boolean cNameIsUsed(String cName, Integer cId) throws Exception {
        List<TbCustomer> customerList = tbCustomerDao.selectByCName(cName);
        if (customerList == null || customerList.size() == 0) {
            return false; //未被占用
        }
        if (customerList.size() == 1) {
            if (cId == null) {
                return true;
            }
            if (customerList.get(0).getcId().equals(cId)) {
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
    private List<TbCustomer> importXls(File file) {
        List<TbCustomer> customerList = new ArrayList<TbCustomer>();

        InputStream is = null;
        HSSFWorkbook hWorkbook = null;
        try {
            is = new FileInputStream(file);
            hWorkbook = new HSSFWorkbook(is);
            //默认只在第一页保存数据
            HSSFSheet hSheet = hWorkbook.getSheetAt(0);

            if (null != hSheet && hSheet.getPhysicalNumberOfRows() > 1) {
                for (int i = 1; i < hSheet.getPhysicalNumberOfRows(); i++) {
                    TbCustomer customer = new TbCustomer();
                    HSSFRow hRow = hSheet.getRow(i);

                    if (hRow.getCell(0) != null) {
                        customer.setcName(hRow.getCell(0).toString().trim());
                    }
                    if (hRow.getCell(1) != null) {
                        customer.setAddress(hRow.getCell(1).toString().trim());
                    }
                    if (hRow.getCell(2) != null) {
                        customer.setContact(hRow.getCell(2).toString().trim());
                    }
                    if (hRow.getCell(3) != null) {
                        customer.setPhone(hRow.getCell(3).toString().trim());
                    }
                    if (hRow.getCell(4) != null) {
                        customer.setPayAcct(hRow.getCell(4).toString().trim());
                    }
                    if (hRow.getCell(5) != null) {
                        customer.setTaxNum(hRow.getCell(5).toString().trim());
                    }
                    if (hRow.getCell(6) != null) {
                        customer.setServiceEngineer(hRow.getCell(6).toString().trim());
                    }
                    if (hRow.getCell(7) != null) {
                        customer.setFax(hRow.getCell(7).toString().trim());
                    }
                    if (hRow.getCell(8) != null) {
                        customer.setPostCode(hRow.getCell(8).toString().trim());
                    }

                    customer.setcName(hRow.getCell(0).toString());
                    customer.setAddress(hRow.getCell(1).toString());
                    customer.setContact(hRow.getCell(2).toString());
                    customer.setPhone(hRow.getCell(3).toString());
                    customer.setPayAcct(hRow.getCell(4).toString());
                    customer.setTaxNum(hRow.getCell(5).toString());
                    customer.setServiceEngineer(hRow.getCell(6).toString());
                    customer.setFax(hRow.getCell(7).toString());
                    customer.setPostCode(hRow.getCell(8).toString());
                    customerList.add(customer);
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

        return customerList;
    }

    /**
     * 解析07 及 07以上版本excel
     *
     * @param file
     * @return
     */
    private List<TbCustomer> importXlsx(File file) {
        List<TbCustomer> customerList = new ArrayList<TbCustomer>();

        InputStream is = null;
        XSSFWorkbook xWorkbook = null;
        try {
            is = new FileInputStream(file);
            xWorkbook = new XSSFWorkbook(is);
            XSSFSheet xSheet = xWorkbook.getSheetAt(0);

            if (null != xSheet && xSheet.getPhysicalNumberOfRows() > 1) {
                for (int i = 1; i < xSheet.getPhysicalNumberOfRows(); i++) {
                    TbCustomer customer = new TbCustomer();
                    XSSFRow xRow = xSheet.getRow(i);
                    if (xRow.getCell(0) != null) {
                        customer.setcName(xRow.getCell(0).toString());
                    }
                    if (xRow.getCell(1) != null) {
                        customer.setAddress(xRow.getCell(1).toString());
                    }
                    if (xRow.getCell(2) != null) {
                        customer.setContact(xRow.getCell(2).toString());
                    }
                    if (xRow.getCell(3) != null) {
                        customer.setPhone(xRow.getCell(3).toString());
                    }
                    if (xRow.getCell(4) != null) {
                        customer.setPayAcct(xRow.getCell(4).toString());
                    }
                    if (xRow.getCell(5) != null) {
                        customer.setTaxNum(xRow.getCell(5).toString());
                    }
                    if (xRow.getCell(6) != null) {
                        customer.setServiceEngineer(xRow.getCell(6).toString());
                    }
                    if (xRow.getCell(7) != null) {
                        customer.setFax(xRow.getCell(7).toString());
                    }
                    if (xRow.getCell(8) != null) {
                        customer.setPostCode(xRow.getCell(8).toString());
                    }

                    customerList.add(customer);
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

        return customerList;
    }
}
