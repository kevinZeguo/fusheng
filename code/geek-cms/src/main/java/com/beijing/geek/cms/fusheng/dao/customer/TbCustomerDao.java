package com.beijing.geek.cms.fusheng.dao.customer;

import com.beijing.geek.cms.fusheng.domain.customer.CustomerQueryParam;
import com.beijing.geek.cms.fusheng.domain.customer.TbCustomer;
import com.beijing.geek.cms.sys.domain.user.CmsUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TbCustomerDao {

    int deleteById(@Param("cId") Integer cId, @Param("userId") Integer userId) throws Exception;

    int insert(TbCustomer record) throws Exception;

    TbCustomer selectById(Integer cId) throws Exception;

    int updateById(TbCustomer record) throws Exception;

    List<TbCustomer> selectCustomerListByPage(CustomerQueryParam param) throws Exception;

    Integer selectCustomerCountByPage(CustomerQueryParam param) throws Exception;

    /**
     * 根据客户名称查询客户信息
     *
     * @param cName
     * @return
     * @throws Exception
     */
    List<TbCustomer> selectByCName(String cName) throws Exception;
}