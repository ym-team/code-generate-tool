package com.evergrande.social.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.evergrande.common.Pagination;
import com.evergrande.common.QueryData;

import com.evergrande.social.entity.TSocialKeywordEntity;
import com.evergrande.social.service.interfaces.ITSocialKeywordService;


 /**
 * @author  chenzx
 * @date [Thu Jan 25 08:43:53 CST 2018]
 * @desc  敏感�? Service TSocialKeywordServiceImpl
 */
 
 
public class TSocialKeywordServiceImpl implements TSocialKeywordService {

  @Autowired
  private TSocialKeywordMapper tSocialKeywordMapper;
  
  
     /**
	   * �鿴����
	   * @param List<TSocialKeywordEntity>
	   * @return	TSocialKeywordEntity
	 */
  @Override
  public long save(TSocialKeywordEntity tSocialKeywordEntity) {
	int count = this.tSocialKeywordMapper.save(tSocialKeywordEntity);
    return tSocialKeywordEntity.getPkId();
  }
  
   /**
	   * �鿴����
	   * @param List<TSocialKeywordEntity>
	   * @return	TSocialKeywordEntity
	 */
  @Override
  public int saveList(List<TSocialKeywordEntity> listTSocialKeywordEntity) {
	int count = this.tSocialKeywordMapper.saveList(listTSocialKeywordEntity);
    return count;
  }

  
  
  	/**
	   * �鿴����
	   * @param tSocialKeywordEntity
	   * @return	TSocialKeywordEntity
	   */
	@Override
	public TSocialKeywordEntity queryDetail(TSocialKeywordEntity tSocialKeywordEntity) {
		tSocialKeywordEntity = this.tSocialKeywordMapper.queryDetail(tSocialKeywordEntity);
		return tSocialKeywordEntity;
	}
  
	/**
	 * ����ҳ��ѯ�б�
	 * @param tSocialKeywordEntity
	 * @return	List<TSocialKeywordEntity>
	 */
	@Override
	public List<TSocialKeywordEntity> queryList(TSocialKeywordEntity tSocialKeywordEntity){
		List<TSocialKeywordEntity> listTSocialKeywordEntity = this.tSocialKeywordMapper.queryList(tSocialKeywordEntity);
		return listTSocialKeywordEntity;
	}
	  
	/**
	 * ��ҳ��ѯ�б�
	 * @param tSocialKeywordEntity
	 * @param page
	 * @return List<TSocialKeywordEntity>
	 */
	 @Override
	public QueryData queryListByPage(TSocialKeywordEntity tSocialKeywordEntity,Pagination page) {
		List<TSocialKeywordEntity> listTSocialKeywordEntity = new ArrayList<TSocialKeywordEntity>();
		QueryData queryData = new QueryData();
		Long count = this.queryCount(tSocialKeywordEntity);
		if(null != count && count > 0){
			listTSocialKeywordEntity =  this.tSocialKeywordMapper.queryListByPage(tSocialKeywordEntity,page);
		}
		
		queryData.setCurrPage(page.getCurrentPage());
		queryData.setDataList(listTSocialKeywordEntity);
		queryData.setTotalCount(Integer.valueOf(count.toString()));
	    queryData.build();
		queryData.setPageSize(page.getPageSize());
	
		return queryData;
	}
	  
	/**
	 * �޸Ļ��߼�ɾ��
	 * @param tSocialKeywordEntity
	 * @return
	 */
	 @Override
	public int update(TSocialKeywordEntity tSocialKeywordEntity) {
		this.tSocialKeywordMapper.update(tSocialKeywordEntity);
	}
	  
	 /**
	  * ����ɾ��
	  * @param tSocialKeywordEntity
	  */
	  @Override
	public int delete(TSocialKeywordEntity tSocialKeywordEntity){
		this.tSocialKeywordMapper.delete(tSocialKeywordEntity);
	}
	
	/**
	  * ����ɾ��
	  * @param tSocialKeywordEntity
	  */
	 @Override
	public Long queryCount(TSocialKeywordEntity tSocialKeywordEntity){
		return this.tSocialKeywordMapper.queryCount(tSocialKeywordEntity);
	}
	
}