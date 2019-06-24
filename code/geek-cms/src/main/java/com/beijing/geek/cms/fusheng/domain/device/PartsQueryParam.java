package com.beijing.geek.cms.fusheng.domain.device;

import com.beijing.geek.cms.sys.domain.common.ListQueryPojo;

/**
 * Created by mazeguo on 2017/6/29.
 */
public class PartsQueryParam extends ListQueryPojo {
    private Integer cId;//客户Id

    public Integer getcId() {
        return cId;
    }

    public void setcId(Integer cId) {
        this.cId = cId;
    }
}
