package com.beijing.geek.cms.fusheng.dao.part;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.beijing.geek.cms.fusheng.domain.part.PartQueryParam;
import com.beijing.geek.cms.fusheng.domain.part.TbPart;

/**
 * Created by zhangyongquan on 2017/07/06.
 */
public interface TbPartDao
{
	int deleteById(@Param("pId") Integer pId, @Param("userId") Integer userId) throws Exception;
	int insert(TbPart record) throws Exception;
	int updateById(TbPart record) throws Exception;
	TbPart selectById(Integer pId) throws Exception;
	Integer selectPartCountByPage(PartQueryParam param) throws Exception;
	List<TbPart> selectPartListByPage(PartQueryParam param) throws Exception;
	List<TbPart> selectBypName(String pName) throws Exception;
	List<TbPart> selectBypCode(String pCode) throws Exception;

    /**
     * 更新库存
     * @param tbPart
     * @throws Exception
     */
    void updateStockNumById(TbPart tbPart)throws Exception;

    /**
     * 查询配件列表
     * @param param
     * @return
     * @throws Exception
     */
    List<TbPart> selectStoragePartList(PartQueryParam param)throws Exception;
}
