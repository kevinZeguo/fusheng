package com.beijing.geek.cms.fusheng.service.contract;

import java.util.List;

import com.beijing.geek.cms.fusheng.domain.contract.ContractQueryParam;
import com.beijing.geek.cms.fusheng.domain.contract.TbContract;

/**
 * Created by zhangyongquan on 2017/6/13.
 */
public interface ContractService {
	 /**
     * 查合同数量
     * @param param
     * @return
     * @throws Exception
     */
    Integer queryContractCountByPage(ContractQueryParam param) throws Exception;

    /**
     * 查询合同列表
     * @param param
     * @return
     * @throws Exception
     */
    List<TbContract> queryContractListByPage(ContractQueryParam param) throws Exception;
    
    /**
     * 新增合同信息
     *
     * @param contract
     * @param userId
     * @throws Exception
     */
    void addContract(TbContract contract, Integer userId) throws Exception;

    /**
     * 编辑合同信息
     *
     * @param contract
     * @param userId
     * @throws Exception
     */
    void editContract(TbContract contract, Integer userId) throws Exception;
    /**
     * 删除客户信息
     *
     * @param cId
     * @param userId
     * @throws Exception
     */
    void deleteById(Integer cId, Integer userId) throws Exception;
    
    /**
     * 根据ID查询合同信息
     * @return
     * @throws Exception
     */
    TbContract queryById(Integer cId) throws Exception;

    /**
     * 查询合同详情
     * @param cId
     * @return
     * @throws Exception
     */
    TbContract findById(Integer cId)throws Exception;
}
