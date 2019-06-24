package com.beijing.geek.cms.fusheng.service.server;

import com.beijing.geek.cms.fusheng.domain.server.ServerQueryParam;
import com.beijing.geek.cms.fusheng.domain.server.TbServeDebug;

import java.util.List;

/**
 * Created by mazeguo on 2017/8/13.
 */
public interface ServeDebugService {
    /**
     * 查询调试单数量
     *
     * @param param
     * @return
     * @throws Exception
     */
    Integer queryDebugCountByPage(ServerQueryParam param) throws Exception;

    /**
     * 查询调试单列表
     *
     * @param param
     * @return
     * @throws Exception
     */
    List<TbServeDebug> queryDebugListByPage(ServerQueryParam param) throws Exception;

    /**
     * 查询调试单详情
     *
     * @param id
     * @return
     * @throws Exception
     */
    TbServeDebug findById(Integer id) throws Exception;

    /**
     * 编辑调试单
     *
     * @param serveDebug
     * @param userId
     * @throws Exception
     */
    void editServeDebug(TbServeDebug serveDebug, Integer userId) throws Exception;

    /**
     * 保存调试单
     *
     * @param serveDebug
     * @param userId
     * @throws Exception
     */
    void saveServeDebug(TbServeDebug serveDebug, Integer userId) throws Exception;

    /**
     * 删除调试单
     *
     * @param id
     * @param userId
     * @throws Exception
     */
    void deleteById(Integer id, Integer userId) throws Exception;
}
