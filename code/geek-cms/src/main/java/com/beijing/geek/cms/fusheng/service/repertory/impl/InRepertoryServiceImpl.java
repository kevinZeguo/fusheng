package com.beijing.geek.cms.fusheng.service.repertory.impl;

import java.util.List;

import com.beijing.geek.cms.fusheng.dao.part.TbPartDao;
import com.beijing.geek.cms.fusheng.domain.part.TbPart;
import com.beijing.geek.cms.fusheng.domain.repertory.TbPartStockList;
import com.beijing.geek.cms.fusheng.utils.FsCodeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beijing.geek.cms.fusheng.dao.repertory.TbIntoStockBillMapper;
import com.beijing.geek.cms.fusheng.domain.repertory.RepertoryQueryParam;
import com.beijing.geek.cms.fusheng.domain.repertory.TbIntoStockBill;
import com.beijing.geek.cms.fusheng.service.repertory.InRepertoryService;

/**
 * Created by mazeguo on 2017/7/9.
 */
@Service
public class InRepertoryServiceImpl implements InRepertoryService {
    @Autowired
    private TbIntoStockBillMapper tbInfoStockBillMapper;
    @Autowired
    private TbPartDao tbPartDao;

    @Override
    public Integer queryInDetailCountByPage(RepertoryQueryParam param) throws Exception {
        return tbInfoStockBillMapper.queryInDetailCountByPage(param);
    }

    @Override
    public List<TbIntoStockBill> queryInDetailListByPage(RepertoryQueryParam param) throws Exception {
        return tbInfoStockBillMapper.queryInDetailListByPage(param);
    }

    @Override
    public void add(TbIntoStockBill in, Integer userId) throws Exception {
        in.setCode(FsCodeUtils.getRepertoryInCode());
        in.setCreator(userId);
        in.setModifier(userId);
        in.setStatus(1);
        tbInfoStockBillMapper.insert(in);
        //变更配件库存
        TbPart tbPart = tbPartDao.selectById(in.getpId());
        if (tbPart.getStockNum() == null) {
            tbPart.setStockNum(in.getNum());
        } else {
            tbPart.setStockNum(tbPart.getStockNum() + in.getNum());
        }
        tbPartDao.updateStockNumById(tbPart);
    }

    @Override
    public void cancelIn(TbIntoStockBill in, Integer userId) throws Exception {
        TbIntoStockBill bill = tbInfoStockBillMapper.selectById(in.getId());
        //变更配件库存
        TbPart tbPart = tbPartDao.selectById(bill.getpId());
        if (bill.getNum() > tbPart.getStockNum()) {
            throw new RuntimeException("配件已经出库，无法撤回");
        }
        tbPart.setStockNum(tbPart.getStockNum() - bill.getNum());
        tbPartDao.updateStockNumById(tbPart);
        bill.setModifier(userId);
        bill.setStatus(2);
        tbInfoStockBillMapper.updateStatus(bill);
    }

    @Override
    public Integer queryStockListCountByPage(RepertoryQueryParam param) throws Exception {
        return null;
    }

    @Override
    public List<TbPartStockList> queryStockListListByPage(RepertoryQueryParam param) throws Exception {
        return null;
    }

}
