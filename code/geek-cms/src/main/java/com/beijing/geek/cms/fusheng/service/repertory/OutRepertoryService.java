package com.beijing.geek.cms.fusheng.service.repertory;

import com.beijing.geek.cms.fusheng.domain.repertory.RepertoryQueryParam;
import com.beijing.geek.cms.fusheng.domain.repertory.TbOutStockPartBill;

import java.util.List;

/**
 * Created by mazeguo on 2017/7/9.
 */
public interface OutRepertoryService {
    /**
     * 查询库存明细
     *
     * @param param
     * @return
     * @throws Exception
     */
    Integer queryOutDetailCountByPage(RepertoryQueryParam param) throws Exception;

    /**
     * 查询库存明细
     *
     * @param param
     * @return
     * @throws Exception
     */
    List<TbOutStockPartBill> queryOutDetailListByPage(RepertoryQueryParam param) throws Exception;

    /**
     * 查询出库列表数量
     * @param param
     * @return
     * @throws Exception
     */
    Integer queryOutCountByPage(RepertoryQueryParam param)throws Exception;

    /**
     * 查询出库列表
     * @param param
     * @return
     * @throws Exception
     */
    List<TbOutStockPartBill> queryListByPage(RepertoryQueryParam param)throws Exception;
}
