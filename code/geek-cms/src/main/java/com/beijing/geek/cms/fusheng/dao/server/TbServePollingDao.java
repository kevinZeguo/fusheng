package com.beijing.geek.cms.fusheng.dao.server;

import com.beijing.geek.cms.fusheng.domain.server.ServerQueryParam;
import com.beijing.geek.cms.fusheng.domain.server.TbServePolling;

import java.util.List;

/**
 * Created by mazeguo on 2017/8/13.
 */
public interface TbServePollingDao {
    Integer selectPollingCountByPage(ServerQueryParam param) throws Exception;

    List<TbServePolling> selectPollingListByPage(ServerQueryParam param) throws Exception;

    TbServePolling selectById(Integer id) throws Exception;

    void updateById(TbServePolling servePolling) throws Exception;

    void insert(TbServePolling servePolling) throws Exception;

    void deleteById(TbServePolling debug) throws Exception;
}
