package com.beijing.geek.cms.fusheng.dao.server;

import java.util.List;

import com.beijing.geek.cms.fusheng.domain.server.ServerQueryParam;
import com.beijing.geek.cms.fusheng.domain.server.TbMaintenance;

public interface TbMaintenanceDao
{
    int deleteById(TbMaintenance maintenance);
    TbMaintenance selectById(Integer id);
    int insert(TbMaintenance maintenance);
    int updateById(TbMaintenance maintenance);
    Integer selectMaintenanceCountByPage(ServerQueryParam queryParam) throws Exception;
    List<TbMaintenance> selectMaintenanceListByPage(ServerQueryParam queryParam) throws Exception;

    List<TbMaintenance> selectByCode(String pCode) throws Exception;
}
