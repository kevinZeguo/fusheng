package com.beijing.geek.cms.fusheng.service.repertory;

import com.beijing.geek.cms.fusheng.domain.repertory.*;

import java.util.List;

/**
 * Created by mazeguo on 2017/7/30.
 */
public interface RepertoryMntService {


    /**
     * 保存入库
     *
     * @param repertoryRecord
     * @param userId
     * @throws Exception
     */
    void saveInRepertory(PartRepertoryRecord repertoryRecord, Integer userId) throws Exception;

    /**
     * 撤回入库
     *
     * @param repertoryRecordId
     * @param userId
     * @throws Exception
     */
    void cancelInRepertory(Integer repertoryRecordId, Integer userId) throws Exception;

    /**
     * 查询库存列表
     *
     * @param param
     * @return
     * @throws Exception
     */
    List<PartRepertory> queryRepertoryList(RepertoryQueryParam param) throws Exception;

    /**
     * 查询库存数量
     *
     * @param param
     * @return
     * @throws Exception
     */
    Integer queryRepertoryCount(RepertoryQueryParam param) throws Exception;

    /**
     * 查询库存明细
     *
     * @param repertoryId
     * @return
     * @throws Exception
     */
    PartRepertory queryRepertoryDetail(Integer repertoryId) throws Exception;

    /**
     * 查询出入库记录数量
     *
     * @param param
     * @return
     * @throws Exception
     */
    Integer queryRepertoryRecordCount(RepertoryQueryParam param) throws Exception;

    /**
     * 查询出入库列表
     *
     * @param param
     * @return
     * @throws Exception
     */
    List<PartRepertoryRecord> queryRepertoryRecordList(RepertoryQueryParam param) throws Exception;

    /**
     * 保存出库
     *
     * @param repertoryRecord
     * @param userId
     * @throws Exception
     */
    void saveOutRepertory(PartRepertoryRecordOut repertoryRecord, Integer userId) throws Exception;

    /**
     * 撤回出库
     *
     * @param repertoryRecordId
     * @param userId
     * @throws Exception
     */
    void cancelOutRepertory(Integer repertoryRecordId, Integer userId) throws Exception;


    /**
     * 查询出库详情
     *
     * @param repertoryRecordId
     * @throws Exception
     */
    PartRepertoryRecordOut queryOutRepertoryRecord(Integer repertoryRecordId) throws Exception;

    /**
     * 查询处理列表数量
     *
     * @param param
     * @return
     * @throws Exception
     */
    Integer queryOutRepertoryCountByPage(RepertoryQueryParam param) throws Exception;

    /**
     * 查询处理列表详情
     *
     * @param param
     * @return
     * @throws Exception
     */
    List<PartRepertoryRecordOut> queryOutRepertoryListByPage(RepertoryQueryParam param) throws Exception;

    /**
     * 查询出库详情
     *
     * @param recordId
     * @return
     * @throws Exception
     */
    PartRepertoryRecord findRecordById(Integer recordId) throws Exception;

    /**
     * 查询库存详情
     *
     * @param id
     * @return
     * @throws Exception
     */
    PartRepertory findPartRepertoryById(Integer id) throws Exception;

    /**
     * 查询配件数量
     *
     * @param param
     * @return
     * @throws Exception
     */
    Integer queryRepertoryBillCount(RepertoryQueryParam param) throws Exception;

    /**
     * 查询配件出入库详情
     *
     * @param param
     * @return
     * @throws Exception
     */
    List<PartRepertoryRecordBill> queryRepertoryBillList(RepertoryQueryParam param) throws Exception;

    /**
     * 查询配件出入库详情
     *
     * @param recordId
     * @return
     * @throws Exception
     */
    List<PartRepertoryRecordBill> queryRepertoryBillListByRecordId(Integer recordId) throws Exception;

    /**
     * 编辑入库单
     *
     * @param record
     * @param userId
     * @throws Exception
     */
    void editInRepertory(PartRepertoryRecord record, Integer userId) throws Exception;

    /**
     * 编辑出库信息
     *
     * @param record
     * @param userId
     * @throws Exception
     */
    void editOutRepertory(PartRepertoryRecordOut record, Integer userId) throws Exception;
}
