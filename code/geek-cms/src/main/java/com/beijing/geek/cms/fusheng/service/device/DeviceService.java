package com.beijing.geek.cms.fusheng.service.device;

import java.io.File;
import java.util.List;

import com.beijing.geek.cms.fusheng.domain.device.DeviceQueryParam;
import com.beijing.geek.cms.fusheng.domain.device.TbEquPart;
import com.beijing.geek.cms.fusheng.domain.device.TbEquipment;

/**
 * Created by mazeguo on 2017/6/12.
 */
public interface DeviceService {
    /**
     * 查询数量
     *
     * @param param
     * @return
     * @throws Exception
     */
    Integer queryDeviceCountByPage(DeviceQueryParam param) throws Exception;

    /**
     * 查询列表
     *
     * @param param
     * @return
     * @throws Exception
     */
    List<TbEquipment> queryDeviceListByPage(DeviceQueryParam param) throws Exception;

    /**
     * 新增
     *
     * @param userId
     * @throws Exception
     */
    void add(TbEquipment eq, Integer userId) throws Exception;

    /**
     * 编辑客户信息
     *
     * @param userId
     * @throws Exception
     */
    void edit(TbEquipment eq, Integer userId) throws Exception;

    public TbEquipment findById(Integer eid) throws Exception;

    void deleteById(Integer eId, Integer userId) throws Exception;

    Integer[] importDeviceByExcel(File tmpFile, String fileType, Integer userId, Integer customerId) throws Exception;

    /**
     * 查询设备下的配件数量
     *
     * @param param
     * @return
     * @throws Exception
     */
    Integer queryPartCountByPage(DeviceQueryParam param) throws Exception;

    /**
     * 查询设备配件列表
     *
     * @param param
     * @return
     * @throws Exception
     */
    List<TbEquPart> queryPartListByPage(DeviceQueryParam param) throws Exception;

    /**
     * 保存设备配件
     * @param pIdlist
     * @param eId
     * @param userId
     * @throws Exception
     */
    void saveEqParts(List<Integer> pIdlist, Integer eId, Integer userId)throws Exception;

    /**
     * 删除设备配件
     */
    void deleteEqParts(List<Integer> pIdlist, Integer eId, Integer userId)throws Exception;
}
