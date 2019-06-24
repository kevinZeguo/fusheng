package com.beijing.geek.cms.fusheng.dao.repertory;

import com.beijing.geek.cms.fusheng.domain.repertory.RepertoryQueryParam;
import com.beijing.geek.cms.fusheng.domain.repertory.TbOutStockPartBill;

import java.util.List;

/**
 * Created by mazeguo on 2017/7/9.
 */
public interface TbOutStockPartBillDao {
    /**
     * 查询库存明细数量
     *
     * @param param
     * @return
     * @throws Exception
     */
    Integer selectOutDetailCountByPage(RepertoryQueryParam param) throws Exception;

    /**
     * 查询库存明细列表
     *
     * @param param
     * @return
     * @throws Exception
     */
    List<TbOutStockPartBill> selectOutDetailListByPage(RepertoryQueryParam param) throws Exception;
}
