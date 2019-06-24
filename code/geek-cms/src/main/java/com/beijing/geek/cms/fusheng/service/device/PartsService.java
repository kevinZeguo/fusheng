package com.beijing.geek.cms.fusheng.service.device;

import com.beijing.geek.cms.fusheng.domain.device.PartsQueryParam;

/**
 * Created by mazeguo on 2017/6/28.
 */
public interface PartsService {
    /**
     * 查询客户的配件出库记录
     *
     * @param param
     * @return
     */
    Integer queryCustomerPartsCountByPage(PartsQueryParam param);

}
