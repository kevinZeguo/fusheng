package com.beijing.geek.cms.fusheng.service.repertory.impl;

import com.beijing.geek.cms.fusheng.dao.part.TbPartDao;
import com.beijing.geek.cms.fusheng.dao.repertory.PartRepertoryDao;
import com.beijing.geek.cms.fusheng.dao.repertory.PartRepertoryRecordBillDao;
import com.beijing.geek.cms.fusheng.dao.repertory.PartRepertoryRecordDao;
import com.beijing.geek.cms.fusheng.dao.repertory.PartRepertoryRecordOutDao;
import com.beijing.geek.cms.fusheng.domain.repertory.*;
import com.beijing.geek.cms.fusheng.service.repertory.RepertoryMntService;
import com.beijing.geek.cms.fusheng.utils.CmsDict;
import com.beijing.geek.cms.fusheng.utils.FsCodeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by mazeguo on 2017/7/30.
 */
@Service
public class RepertoryMntServiceImpl implements RepertoryMntService {
    @Autowired
    private PartRepertoryDao partRepertoryDao;
    @Autowired
    private PartRepertoryRecordBillDao partRepertoryRecordBillDao;
    @Autowired
    private PartRepertoryRecordDao partRepertoryRecordDao;
    @Autowired
    private PartRepertoryRecordOutDao partRepertoryRecordOutDao;
    @Autowired
    private TbPartDao tbPartDao;


    @Override
    public void saveInRepertory(PartRepertoryRecord repertoryRecord, Integer userId) throws Exception {
        //保存入库记录表
        repertoryRecord.setCreator(userId);
        repertoryRecord.setModifier(userId);
        repertoryRecord.setCode(FsCodeUtils.getCode("FSRR"));
        repertoryRecord.setStatus(CmsDict.Repertory_status_normal);
        repertoryRecord.setRepertoryType(CmsDict.Repertory_type_in);
        partRepertoryRecordDao.insert(repertoryRecord);
        //保存入库明细表
        List<PartRepertoryRecordBill> billList = repertoryRecord.getBillList();
        for (PartRepertoryRecordBill bill : billList) {
            bill.setCreator(userId);
            bill.setModifier(userId);
            bill.setRepertoryRecordId(repertoryRecord.getId());
            partRepertoryRecordBillDao.insert(bill);
            //查询库存记录是否存在，如存在，则更新，若不存在则新增
            modifyPartRepertory(repertoryRecord.getStorageId(), bill.getpId(), bill.getNum(), userId);
        }
    }

    @Override
    @Transactional("geek-cms")
    public void editInRepertory(PartRepertoryRecord record, Integer userId) throws Exception {
        //保存入库记录表
        record.setModifier(userId);
        partRepertoryRecordDao.updateById(record);
        //保存入库明细表
        List<PartRepertoryRecordBill> billListHis = partRepertoryRecordBillDao.selectByRepId(record.getId());
        if (billListHis != null && billListHis.size() > 0) {
            //查询库存记录是否存在，如存在，则更新，若不存在则新增
            modifyPartRepertory(record.getStorageId(), billListHis.get(0).getpId(), -billListHis.get(0).getNum(), userId);
        }
        List<PartRepertoryRecordBill> billList = record.getBillList(); //删除历史的保存新的入库单
        partRepertoryRecordBillDao.deleteByRecordId(record);
        for (PartRepertoryRecordBill bill : billList) {
            bill.setCreator(userId);
            bill.setModifier(userId);
            bill.setRepertoryRecordId(record.getId());
            partRepertoryRecordBillDao.insert(bill);
            modifyPartRepertory(record.getStorageId(), bill.getpId(), bill.getNum(), userId);

        }
    }


    /**
     * 更新库存，为控制库存安全，增加 同步处理
     *
     * @param storageId
     * @param pId
     * @param num
     * @param userId
     */
    private synchronized void modifyPartRepertory(String storageId, Integer pId, Integer num, Integer userId) throws Exception {
        //根据仓库Id和配件Id查询是否存在库存
        PartRepertory partRepertory = partRepertoryDao.selectByRepIdAndPid(storageId, pId);
        if (partRepertory == null || partRepertory.getId() == null || partRepertory.getId() == 0) {
            if (num < 0) {
                throw new Exception("库存不足");
            }
            partRepertory = new PartRepertory();
            partRepertory.setStorageId(storageId);
            partRepertory.setpId(pId);
            partRepertory.setStockNum(num);
            partRepertory.setModifier(userId);
            partRepertory.setCreator(userId);
            partRepertory.setCode(FsCodeUtils.getCode("FSPR"));
            partRepertoryDao.insert(partRepertory);
        } else {
            partRepertory.setModifier(userId);
            Integer hisNum = partRepertory.getStockNum();
            if (hisNum == null || hisNum == 0) {
                if (num < 0) {
                    throw new Exception("库存不足");
                }
                partRepertory.setStockNum(num);
            } else {
                if ((hisNum + num) < 0) {
                    throw new Exception("库存不足");
                }
                partRepertory.setStockNum(hisNum + num);
            }
            partRepertoryDao.updateByStockNum(partRepertory);
        }
    }


    @Override
    @Transactional("geek-cms")
    public void cancelInRepertory(Integer repertoryRecordId, Integer userId) throws Exception {
        //根据入库Id查询入库详情
        PartRepertoryRecord repertoryRecord = partRepertoryRecordDao.selectById(repertoryRecordId);
        if (repertoryRecord.getStatus() == CmsDict.Repertory_status_cancel.intValue()) {
            throw new Exception("工单状态以为撤回状态，无法重复撤回!");
        }

        //查询库存是否被使用
        List<PartRepertoryRecordBill> recordBillList = partRepertoryRecordBillDao.selectByRepId(repertoryRecordId);
        if (recordBillList != null && recordBillList.size() > 0) {
            for (PartRepertoryRecordBill bill : recordBillList) {
                modifyPartRepertory(repertoryRecord.getStorageId(), bill.getpId(), -bill.getNum(), userId);
            }
        }
        //更新工单状态
        repertoryRecord.setStatus(CmsDict.Repertory_status_cancel);
        repertoryRecord.setModifier(userId);
        partRepertoryRecordDao.updateStatus(repertoryRecord);


    }

    @Override
    public List<PartRepertory> queryRepertoryList(RepertoryQueryParam param) throws Exception {
        List<PartRepertory> repertoryList = partRepertoryDao.selectListByPage(param);
        if (repertoryList != null && repertoryList.size() > 0) {

            for (PartRepertory repertory : repertoryList) {
                RepertoryQueryParam queryParam = new RepertoryQueryParam();
                queryParam.setpId(repertory.getpId());
                queryParam.setStorageId(repertory.getStorageId());
                queryParam.setStart(0);
                queryParam.setLimit(100000);
                List<PartRepertoryRecordBill> bills = partRepertoryRecordBillDao.selectRepertoryBillList(queryParam);
                Integer inNum = 0;
                Integer outNum = 0;
                Double inTotalPrice = 0.0;
                Double outTotalPrice = 0.0;

                //入库信息
                if (bills != null) {
                    for (PartRepertoryRecordBill bill : bills) {
                        if (bill.getRepertoryType() == CmsDict.Repertory_type_in.intValue()) {//入库
                            inNum += bill.getNum() != null ? bill.getNum() : 0;
                            inTotalPrice += (bill.getNum() != null ? bill.getNum() : 0) * (bill.getPrice() != null ? bill.getPrice() : 0);
                        } else {//出库
                            outNum += bill.getNum() != null ? bill.getNum() : 0;
                            outTotalPrice += (bill.getTotalAmt() != null ? bill.getTotalAmt() : 0);
                        }
                    }
                    repertory.setInNum(inNum);
                    repertory.setInFee(inTotalPrice);
                    repertory.setOutNum(outNum);
                    repertory.setOutFee(outTotalPrice);
                }

                //出库信息
            }
        }
        return repertoryList;
    }

    @Override
    public Integer queryRepertoryCount(RepertoryQueryParam param) throws Exception {
        return partRepertoryDao.selectCountByPage(param);
    }

    @Override
    public PartRepertory queryRepertoryDetail(Integer repertoryId) throws Exception {
        return partRepertoryDao.selectRepertoryDetail(repertoryId);
    }

    @Override
    public Integer queryRepertoryRecordCount(RepertoryQueryParam param) throws Exception {
        return partRepertoryRecordDao.queryRecordCountByPage(param);
    }

    @Override
    public List<PartRepertoryRecord> queryRepertoryRecordList(RepertoryQueryParam param) throws Exception {
        List<PartRepertoryRecord> recordList = partRepertoryRecordDao.queryRecordListByPage(param);
        if (param.getRepertoryType() != null && param.getRepertoryType() == CmsDict.Repertory_type_in.intValue()) {
            for (PartRepertoryRecord record : recordList) {
                List<PartRepertoryRecordBill> billList = partRepertoryRecordBillDao.selectByRepId(record.getId());
                if (billList != null && billList.size() > 0) {
                    record.setpId(billList.get(0).getpId());
                    record.setpCode(billList.get(0).getpCode());
                    record.setpName(billList.get(0).getpName());
                    record.setPrice(billList.get(0).getPrice());
                    record.setSupplier(billList.get(0).getSupplier());
                    record.setNum(billList.get(0).getNum());
                }
            }
        }
        return recordList;
    }

    @Override
    @Transactional("geek-cms")
    public void saveOutRepertory(PartRepertoryRecordOut repertoryRecord, Integer userId) throws Exception {
        //保存出库信息
        //保存入库记录表
        repertoryRecord.setCreator(userId);
        repertoryRecord.setModifier(userId);
        repertoryRecord.setCode(FsCodeUtils.getCode("FSRR"));
        repertoryRecord.setStatus(CmsDict.Repertory_status_normal);
        repertoryRecord.setRepertoryType(CmsDict.Repertory_type_out);
        partRepertoryRecordDao.insert(repertoryRecord);

        //保存出库定义
        repertoryRecord.setRepertoryRecordId(repertoryRecord.getId());
        partRepertoryRecordOutDao.insert(repertoryRecord);

        //保存入库明细表
        List<PartRepertoryRecordBill> billList = repertoryRecord.getBillList();
        for (PartRepertoryRecordBill bill : billList) {
            //根据code 查询 配件Id
//            List<TbPart> partList = tbPartDao.selectBypCode(bill.getpCode());
//            if (partList != null && partList.size() > 0) {
//                bill.setpId(partList.get(0).getpId());
//            }
            bill.setCreator(userId);
            bill.setModifier(userId);
            bill.setRepertoryRecordId(repertoryRecord.getRepertoryRecordId());
            partRepertoryRecordBillDao.insert(bill);
            //查询库存记录是否存在，如存在，则更新，若不存在则新增
            if (bill.getNum() != null && bill.getNum() != 0) {
                modifyPartRepertory(repertoryRecord.getStorageId(), bill.getpId(), -bill.getNum(), userId);
            }
        }

    }

    @Override
    @Transactional("geek_cms")
    public void editOutRepertory(PartRepertoryRecordOut record, Integer userId) throws Exception {
        //保存出库信息
        //保存入库记录表
        record.setModifier(userId);
        partRepertoryRecordDao.updateById(record);

        //保存出库定义
        record.setRepertoryRecordId(record.getId());
        partRepertoryRecordOutDao.updateById(record);

        List<PartRepertoryRecordBill> billListHis = partRepertoryRecordBillDao.selectByRepId(record.getId());
        if (billListHis != null && billListHis.size() > 0) {
            for (PartRepertoryRecordBill bill : billListHis) {
                //查询库存记录是否存在，如存在，则更新，若不存在则新增
                modifyPartRepertory(record.getStorageId(), bill.getpId(), bill.getNum(), userId);
            }
        }
        //保存入库明细表
        List<PartRepertoryRecordBill> billList = record.getBillList();
        for (PartRepertoryRecordBill bill : billList) {
            bill.setCreator(userId);
            bill.setModifier(userId);
            bill.setRepertoryRecordId(record.getRepertoryRecordId());
            partRepertoryRecordBillDao.insert(bill);
            //查询库存记录是否存在，如存在，则更新，若不存在则新增
            if (bill.getNum() != null && bill.getNum() != 0) {
                modifyPartRepertory(record.getStorageId(), bill.getpId(), -bill.getNum(), userId);
            }
        }

    }


    @Override
    public void cancelOutRepertory(Integer repertoryRecordId, Integer userId) throws Exception {
        //根据入库Id查询入库详情
        PartRepertoryRecord repertoryRecord = partRepertoryRecordDao.selectById(repertoryRecordId);
        if (repertoryRecord.getStatus() == CmsDict.Repertory_status_cancel.intValue()) {
            throw new Exception("工单状态以为撤回状态，无法重复撤回!");
        }
        //查询库存是否被使用
        List<PartRepertoryRecordBill> recordBillList = partRepertoryRecordBillDao.selectByRepId(repertoryRecordId);
        if (recordBillList != null && recordBillList.size() > 0) {
            for (PartRepertoryRecordBill bill : recordBillList) {
                modifyPartRepertory(repertoryRecord.getStorageId(), bill.getpId(), bill.getNum(), userId);
            }
        }

        //更新工单状态
        repertoryRecord.setStatus(CmsDict.Repertory_status_cancel);
        repertoryRecord.setModifier(userId);
        partRepertoryRecordDao.updateStatus(repertoryRecord);
    }

    @Override
    public PartRepertoryRecordOut queryOutRepertoryRecord(Integer repertoryRecordId) throws Exception {
        return partRepertoryRecordOutDao.selectById(repertoryRecordId);
    }


    @Override
    public Integer queryOutRepertoryCountByPage(RepertoryQueryParam param) throws Exception {
        return partRepertoryRecordOutDao.selectOutRepertoryCountByPage(param);
    }

    @Override
    public List<PartRepertoryRecordOut> queryOutRepertoryListByPage(RepertoryQueryParam param) throws Exception {
        return partRepertoryRecordOutDao.selectOutRepertoryListByPage(param);
    }

    @Override
    public PartRepertoryRecord findRecordById(Integer recordId) throws Exception {
        return partRepertoryRecordDao.selectById(recordId);
    }

    @Override
    public PartRepertory findPartRepertoryById(Integer id) throws Exception {
        return partRepertoryDao.selectById(id);
    }

    @Override
    public Integer queryRepertoryBillCount(RepertoryQueryParam param) throws Exception {
        return partRepertoryRecordBillDao.selectRepertoryBillCount(param);
    }

    @Override
    public List<PartRepertoryRecordBill> queryRepertoryBillList(RepertoryQueryParam param) throws Exception {
        return partRepertoryRecordBillDao.selectRepertoryBillList(param);
    }

    @Override
    public List<PartRepertoryRecordBill> queryRepertoryBillListByRecordId(Integer recordId) throws Exception {
        return partRepertoryRecordBillDao.selectByRepId(recordId);
    }


}
