package com.beijing.geek.cms.fusheng.service.server;

import java.util.List;

import com.beijing.geek.cms.fusheng.domain.server.ServerQueryParam;
import com.beijing.geek.cms.fusheng.domain.server.TbMaintenance;

public interface MaintenanceService
{
	/**
     * 查询数量
     *
     * @param param
     * @return
     * @throws Exception
     */
    Integer queryMaintenanceCountByPage(ServerQueryParam param) throws Exception;

    /**
     * 查询列表
     *
     * @param param
     * @return
     * @throws Exception
     */
    List<TbMaintenance> queryMaintenanceListByPage(ServerQueryParam param) throws Exception;

    /**
     * 新增
     *
     * @param userId
     * @throws Exception
     */
    void add(TbMaintenance mt, Integer userId) throws Exception;

    /**
     * 编辑客户信息
     *
     * @param userId
     * @throws Exception
     */
    void edit(TbMaintenance mt, Integer userId) throws Exception;

    public TbMaintenance findById(Integer id) throws Exception;

    void deleteById(Integer id, Integer userId) throws Exception;

	boolean pCodeIsUsed(String pCode,Integer pId) throws Exception;
}
