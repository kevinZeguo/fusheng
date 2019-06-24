package com.beijing.geek.cms.fusheng.dao.repertory;

import com.beijing.geek.cms.fusheng.domain.repertory.RepertoryQueryParam;
import com.beijing.geek.cms.fusheng.domain.repertory.TbPartStockList;

import java.util.List;

public interface TbPartStockListDao {
    int insert(TbPartStockList record)throws Exception;
    TbPartStockList selectById(Integer id);

    int updateById(TbPartStockList stockList);
    
    public Integer queryInDetailCountByPage(RepertoryQueryParam param);
    
    public List<TbPartStockList> queryInDetailListByPage(RepertoryQueryParam param);

    void updateStockNum(TbPartStockList stockList)throws Exception;
}