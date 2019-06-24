package com.beijing.geek.cms.fusheng.dao.repertory;

import java.util.List;

import com.beijing.geek.cms.fusheng.domain.repertory.RepertoryQueryParam;
import com.beijing.geek.cms.fusheng.domain.repertory.TbIntoStockBill;

public interface TbIntoStockBillMapper {
    int insert(TbIntoStockBill record)throws Exception;
    TbIntoStockBill selectById(Integer id);

    int updateById(TbIntoStockBill record);
    
    public Integer queryInDetailCountByPage(RepertoryQueryParam param);
    
    public List<TbIntoStockBill> queryInDetailListByPage(RepertoryQueryParam param);

    void updateStatus(TbIntoStockBill bill)throws Exception;
}