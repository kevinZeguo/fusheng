package com.beijing.geek.cms.fusheng.service.server;

import com.beijing.geek.cms.fusheng.domain.server.ServerQueryParam;
import com.beijing.geek.cms.fusheng.domain.server.TbServePolling;

import java.util.List;

/**
 * Created by mazeguo on 2017/8/13.
 */
public interface ServePollingService {
    /**
     * 分页查询调试单数量
     *
     * @param param
     * @return
     * @throws Exception
     */
    Integer queryPollingCountByPage(ServerQueryParam param) throws Exception;

    /**
     * 分页查询调试单列表
     *
     * @param param
     * @return
     * @throws Exception
     */
    List<TbServePolling> queryPollingListByPage(ServerQueryParam param) throws Exception;

    /**
     * 查询调试单详情
     *
     * @param id
     * @return
     * @throws Exception
     */
    TbServePolling findById(Integer id) throws Exception;

    /**
     * 编辑调试单
     *
     * @param servePolling
     * @param userId
     * @throws Exception
     */
    void editServePolling(TbServePolling servePolling, Integer userId) throws Exception;

    /**
     * 保存调试单
     *
     * @param servePolling
     * @param userId
     * @throws Exception
     */
    void saveServePolling(TbServePolling servePolling, Integer userId) throws Exception;

    /**
     * 根据Id删除调试单
     *
     * @param id
     * @param userId
     * @throws Exception
     */
    void deleteById(Integer id, Integer userId) throws Exception;
}
