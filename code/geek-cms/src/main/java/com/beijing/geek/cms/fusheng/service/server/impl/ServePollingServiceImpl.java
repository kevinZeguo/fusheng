package com.beijing.geek.cms.fusheng.service.server.impl;

import com.beijing.geek.cms.fusheng.dao.server.TbServePollingDao;
import com.beijing.geek.cms.fusheng.domain.server.ServerQueryParam;
import com.beijing.geek.cms.fusheng.domain.server.TbServePolling;
import com.beijing.geek.cms.fusheng.service.server.ServePollingService;
import com.beijing.geek.cms.fusheng.utils.FsCodeUtils;
import com.beijing.geek.cms.sys.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by mazeguo on 2017/8/20.
 */
@Service
public class ServePollingServiceImpl implements ServePollingService {
    @Autowired
    private TbServePollingDao tbServePollingDao;
    @Autowired
    private UserService userService;

    @Override
    public Integer queryPollingCountByPage(ServerQueryParam param) throws Exception {
        return tbServePollingDao.selectPollingCountByPage(param);
    }

    @Override
    public List<TbServePolling> queryPollingListByPage(ServerQueryParam param) throws Exception {
        List<TbServePolling> pollingList = tbServePollingDao.selectPollingListByPage(param);
        if (pollingList != null && pollingList.size() > 0) {
            for (TbServePolling polling : pollingList) {
                polling.setServiceEngineerName(userService.getUserNames(polling.getServiceEngineer()));
            }
        }
        return pollingList;
    }


    @Override
    public TbServePolling findById(Integer id) throws Exception {
        TbServePolling polling = tbServePollingDao.selectById(id);
        if (polling != null) {
            polling.setServiceEngineerName(userService.getUserNames(polling.getServiceEngineer()));
        }
        return polling;
    }

    @Override
    public void editServePolling(TbServePolling servePolling, Integer userId) throws Exception {
        servePolling.setModifier(userId);
        tbServePollingDao.updateById(servePolling);
    }

    @Override
    public void saveServePolling(TbServePolling servePolling, Integer userId) throws Exception {
        servePolling.setModifier(userId);
        servePolling.setCreator(userId);
        servePolling.setCode(FsCodeUtils.getCode("POLLING"));
        tbServePollingDao.insert(servePolling);
    }

    @Override
    public void deleteById(Integer id, Integer userId) throws Exception {
        TbServePolling debug = new TbServePolling();
        debug.setId(id);
        debug.setModifier(userId);
        tbServePollingDao.deleteById(debug);
    }
}
