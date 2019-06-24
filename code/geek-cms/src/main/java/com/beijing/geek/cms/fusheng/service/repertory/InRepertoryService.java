package com.beijing.geek.cms.fusheng.service.repertory;

import java.util.List;

import com.beijing.geek.cms.fusheng.domain.repertory.RepertoryQueryParam;
import com.beijing.geek.cms.fusheng.domain.repertory.TbIntoStockBill;
import com.beijing.geek.cms.fusheng.domain.repertory.TbPartStockList;

/**
 * Created by mazeguo on 2017/7/9.
 */
public interface InRepertoryService {
    /**
     * 查询库存明细
     *
     * @param param
     * @return
     * @throws Exception
     */
    Integer queryInDetailCountByPage(RepertoryQueryParam param) throws Exception;

    /**
     * 查询库存明细
     *
     * @param param
     * @return
     * @throws Exception
     */
    List<TbIntoStockBill> queryInDetailListByPage(RepertoryQueryParam param) throws Exception;

    void add(TbIntoStockBill in, Integer userId) throws Exception;

    void cancelIn(TbIntoStockBill in, Integer userId) throws Exception;

    /**
     * 查询库存信息数量
     *
     * @param param
     * @return
     * @throws Exception
     */
    Integer queryStockListCountByPage(RepertoryQueryParam param) throws Exception;

    /**
     * 查询库存信息列表
     *
     * @param param
     * @return
     * @throws Exception
     */
    List<TbPartStockList> queryStockListListByPage(RepertoryQueryParam param) throws Exception;

}
