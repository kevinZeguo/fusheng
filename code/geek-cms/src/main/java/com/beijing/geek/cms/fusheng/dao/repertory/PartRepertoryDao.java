package com.beijing.geek.cms.fusheng.dao.repertory;

import com.beijing.geek.cms.fusheng.domain.repertory.PartRepertory;
import com.beijing.geek.cms.fusheng.domain.repertory.RepertoryQueryParam;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PartRepertoryDao {

    int deleteById(Integer id) throws Exception;


    int insert(PartRepertory record) throws Exception;

    PartRepertory selectById(Integer id) throws Exception;

    int updateById(PartRepertory record) throws Exception;

    PartRepertory selectByRepIdAndPid(@Param("storageId") String storageId, @Param("pId") Integer pId) throws Exception;

    void updateByStockNum(PartRepertory partRepertory) throws Exception;

    /**
     * 查询库存列表数量
     */
    Integer selectCountByPage(RepertoryQueryParam param) throws Exception;

    /**
     * 查询库存列表
     *
     * @param param
     * @return
     * @throws Exception
     */
    List<PartRepertory> selectListByPage(RepertoryQueryParam param) throws Exception;

    /**
     * 根据库存Id查询库存信息
     *
     * @param repertoryId
     * @return
     * @throws Exception
     */
    PartRepertory selectRepertoryDetail(@Param("id") Integer repertoryId) throws Exception;
}