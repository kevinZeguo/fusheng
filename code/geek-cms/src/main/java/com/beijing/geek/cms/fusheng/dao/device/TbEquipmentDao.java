package com.beijing.geek.cms.fusheng.dao.device;

import java.util.List;

import com.beijing.geek.cms.fusheng.domain.customer.CustomerQueryParam;
import com.beijing.geek.cms.fusheng.domain.customer.TbCustomer;
import com.beijing.geek.cms.fusheng.domain.device.DeviceQueryParam;
import com.beijing.geek.cms.fusheng.domain.device.TbEquipment;

public interface TbEquipmentDao {
    int deleteByPrimaryKey(Integer eId)throws Exception;

    int insert(TbEquipment record)throws Exception;

    TbEquipment selectById(Integer eId) throws Exception;

    int updateByPrimaryKeySelective(TbEquipment record)throws Exception;

    int updateByPrimaryKey(TbEquipment record)throws Exception;

    List<TbEquipment> selectDeviceListByPage(DeviceQueryParam param) throws Exception;

    Integer selectDeviceCountByPage(DeviceQueryParam param) throws Exception;

    List<TbEquipment> selectByMakeNum(String makeNum)throws Exception;
}