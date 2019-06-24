package com.beijing.geek.cms.fusheng.service.repertory.impl;

import com.beijing.geek.cms.fusheng.dao.repertory.TbOutStockPartBillDao;
import com.beijing.geek.cms.fusheng.domain.repertory.RepertoryQueryParam;
import com.beijing.geek.cms.fusheng.domain.repertory.TbOutStockPartBill;
import com.beijing.geek.cms.fusheng.service.repertory.OutRepertoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by mazeguo on 2017/7/9.
 */
@Service
public class OutRepertoryServiceImpl implements OutRepertoryService {
    @Autowired
    private TbOutStockPartBillDao tbOutStockPartBillDao;
    @Override
    public Integer queryOutDetailCountByPage(RepertoryQueryParam param) throws Exception {
        return tbOutStockPartBillDao.selectOutDetailCountByPage(param);
    }

    @Override
    public List<TbOutStockPartBill> queryOutDetailListByPage(RepertoryQueryParam param) throws Exception {
        return tbOutStockPartBillDao.selectOutDetailListByPage(param);
    }

    @Override
    public Integer queryOutCountByPage(RepertoryQueryParam param) throws Exception {
        return null;
    }

    @Override
    public List<TbOutStockPartBill> queryListByPage(RepertoryQueryParam param) throws Exception {
        return null;
    }
}
