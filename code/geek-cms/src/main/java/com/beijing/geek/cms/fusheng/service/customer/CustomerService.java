package com.beijing.geek.cms.fusheng.service.customer;

import com.beijing.geek.cms.fusheng.domain.customer.CustomerQueryParam;
import com.beijing.geek.cms.fusheng.domain.customer.TbCustomer;
import com.beijing.geek.cms.sys.domain.user.CmsUser;

import java.io.File;
import java.util.List;

/**
 * Created by mazeguo on 2017/6/12.
 */
public interface CustomerService {
    /**
     * 查询客户数量
     *
     * @param param
     * @return
     * @throws Exception
     */
    Integer queryCustomerCountByPage(CustomerQueryParam param) throws Exception;

    /**
     * 查询客户列表
     *
     * @param param
     * @return
     * @throws Exception
     */
    List<TbCustomer> queryCustomerListByPage(CustomerQueryParam param) throws Exception;

    /**
     * 根据客户Id查询客户信息
     *
     * @param cId
     * @return
     * @throws Exception
     */
    TbCustomer findById(Integer cId) throws Exception;

    /**
     * 新增用户信息
     *
     * @param customer
     * @param userId
     * @throws Exception
     */
    void addCustomer(TbCustomer customer, Integer userId) throws Exception;

    /**
     * 编辑客户信息
     *
     * @param customer
     * @param userId
     * @throws Exception
     */
    void editCustomer(TbCustomer customer, Integer userId) throws Exception;

    /**
     * 删除客户信息
     *
     * @param cId
     * @param userId
     * @throws Exception
     */
    void deleteById(Integer cId, Integer userId) throws Exception;

    /**
     * 导入客户信息
     *
     * @param tmpFile
     * @param fileType
     * @param userId   @return
     * @throws Exception
     */
    Integer[] importCustomerByExcel(File tmpFile, String fileType, Integer userId) throws Exception;

    /**
     * 校验客户名称是否已经被使用
     *
     * @param cName
     * @param cId
     * @return
     * @throws Exception
     */
    boolean cNameIsUsed(String cName, Integer cId) throws Exception;
}
