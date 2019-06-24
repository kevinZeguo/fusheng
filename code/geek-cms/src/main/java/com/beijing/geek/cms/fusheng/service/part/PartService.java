package com.beijing.geek.cms.fusheng.service.part;

import java.util.List;

import com.beijing.geek.cms.fusheng.domain.part.PartQueryParam;
import com.beijing.geek.cms.fusheng.domain.part.TbPart;

/**
 * Created by zhangyongquan on 2017/07/06.
 */
public interface PartService
{
	Integer queryPartCountByPage(PartQueryParam param) throws Exception;
	List<TbPart> queryPartListByPage(PartQueryParam param) throws Exception;
	TbPart queryById(Integer pId) throws Exception;
	void addPart(TbPart part,Integer userId) throws Exception;
	void editPart(TbPart part,Integer userId) throws Exception;
	void deletePart(Integer pId,Integer userId) throws Exception;
	boolean pNameIsUsed(String pName, Integer pId) throws Exception;
	boolean pCodeIsUsed(String pCode,Integer pId) throws Exception;

    /**
     * 查询仓库下 配件列表
     * @param param
     * @return
     * @throws Exception
     */
    List<TbPart> queryStoragePartList(PartQueryParam param)throws Exception;
}
