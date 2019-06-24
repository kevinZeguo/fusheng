package com.beijing.geek.cms.fusheng.dao.repertory;

import com.beijing.geek.cms.fusheng.domain.repertory.PartRepertoryRecord;
import com.beijing.geek.cms.fusheng.domain.repertory.RepertoryQueryParam;

import java.util.List;

public interface PartRepertoryRecordDao {
    int deleteById(Integer id) throws Exception;

    int insert(PartRepertoryRecord record) throws Exception;

    PartRepertoryRecord selectById(Integer id) throws Exception;

    int updateById(PartRepertoryRecord record) throws Exception;

    /**
     * 更新工单状态
     *
     * @param repertoryRecord
     * @throws Exception
     */
    void updateStatus(PartRepertoryRecord repertoryRecord) throws Exception;

    /**
     * 查询入库记录数量
     * @param param
     * @return
     * @throws Exception
     */
    Integer queryRecordCountByPage(RepertoryQueryParam param)throws Exception;

    /*
    查询入库列表
     */
    List<PartRepertoryRecord> queryRecordListByPage(RepertoryQueryParam param)throws Exception;
}