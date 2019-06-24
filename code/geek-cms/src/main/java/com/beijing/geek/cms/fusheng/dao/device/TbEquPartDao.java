package com.beijing.geek.cms.fusheng.dao.device;

import com.beijing.geek.cms.fusheng.domain.device.DeviceQueryParam;
import com.beijing.geek.cms.fusheng.domain.device.TbEquPart;

import java.util.List;

public interface TbEquPartDao {

    /**
     * 保存配件信息
     *
     * @param part
     * @throws Exception
     */
    void insert(TbEquPart part) throws Exception;

    /**
     * 删除设备配件
     *
     * @param part
     * @throws Exception
     */
    void deleteById(TbEquPart part) throws Exception;

    /**
     * 查询配件数量
     *
     * @param param
     * @return
     * @throws Exception
     */
    Integer selectPartCountByPage(DeviceQueryParam param) throws Exception;

    /**
     * 查询配件列表
     *
     * @param param
     * @return
     * @throws Exception
     */
    List<TbEquPart> selectPartListByPage(DeviceQueryParam param) throws Exception;

    /**
     * 删除配件
     *
     * @param part
     * @throws Exception
     */
    void deletePart(TbEquPart part) throws Exception;
}
