package com.beijing.geek.cms.fusheng.dao.server;

import com.beijing.geek.cms.fusheng.domain.server.ServerQueryParam;
import com.beijing.geek.cms.fusheng.domain.server.TbServeDebug;

import java.util.List;

/**
 * Created by mazeguo on 2017/8/13.
 */
public interface TbServeDebugDao {
    Integer selectDebugCountByPage(ServerQueryParam param)throws Exception;

    List<TbServeDebug> selectDebugListByPage(ServerQueryParam param)throws Exception;

    TbServeDebug selectById(Integer id)throws Exception;

    void updateById(TbServeDebug serveDebug)throws Exception;

    void insert(TbServeDebug serveDebug)throws Exception;

    void deleteById(TbServeDebug debug)throws Exception;
}
