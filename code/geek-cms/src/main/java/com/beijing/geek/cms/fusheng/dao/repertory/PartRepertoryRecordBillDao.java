package com.beijing.geek.cms.fusheng.dao.repertory;

import com.beijing.geek.cms.fusheng.domain.repertory.PartRepertoryRecord;
import com.beijing.geek.cms.fusheng.domain.repertory.PartRepertoryRecordBill;
import com.beijing.geek.cms.fusheng.domain.repertory.RepertoryQueryParam;

import java.util.List;

public interface PartRepertoryRecordBillDao {

    int deleteById(Integer id) throws Exception;


    int insert(PartRepertoryRecordBill record) throws Exception;


    PartRepertoryRecordBill selectById(Integer id) throws Exception;

    int updateById(PartRepertoryRecordBill record) throws Exception;

    /**
     * 根据出入库id查询明细
     *
     * @param repertoryRecordId
     * @return
     * @throws Exception
     */
    List<PartRepertoryRecordBill> selectByRepId(Integer repertoryRecordId) throws Exception;

    /**
     * 查询配件出入库 列表
     *
     * @param param
     * @return
     * @throws Exception
     */
    List<PartRepertoryRecordBill> selectRepertoryBillList(RepertoryQueryParam param) throws Exception;

    /**
     * 查询配件出入库数量
     *
     * @param param
     * @return
     * @throws Exception
     */
    Integer selectRepertoryBillCount(RepertoryQueryParam param) throws Exception;

    /**
     * 根据订单Id删除记录
     *
     * @param record
     * @throws Exception
     */
    void deleteByRecordId(PartRepertoryRecord record) throws Exception;
}