package com.evergrande.social.service.interfaces;

import java.util.List;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.evergrande.common.Pagination;
import com.evergrande.common.QueryData;
import com.evergrande.common.valid.Validation;
import com.evergrande.social.entity.TSocialKeywordEntity;

/**
 * @author chenzx
 * @date [Thu Jan 25 08:43:53 CST 2018]
 * @desc 敏感�?  Service
 */
 
public interface TSocialKeywordService {


	/**
	   * ����
	   * @param tSocialKeywordEntity
	   * @return
	   */
	@Validation
	public long save(@NotNull TSocialKeywordEntity  tSocialKeywordEntity);
	
	
	

	/**
	   * ����
	   * @param tSocialKeywordEntity
	   * @return
	   */
	@Validation   
	public int saveList(@NotNull @Size(min = 1)List<TSocialKeywordEntity>  listTSocialKeywordEntity);
	

  	 /**
	   * �鿴����
	   * @param tSocialKeywordEntity
	   * @return TSocialKeywordEntity
	   */
	@Validation	   
	public TSocialKeywordEntity queryDetail(TSocialKeywordEntity tSocialKeywordEntity);
  
	/**
	 * ����ҳ�б�
	 * @param tSocialKeywordEntity
	 * @return List<TSocialKeywordEntity>
	 */
	@Validation
	public List<TSocialKeywordEntity> queryList(TSocialKeywordEntity tSocialKeywordEntity);
	  
	/**
	 * ��ҳ��ѯ�б�
	 * @param tSocialKeywordEntity
	 * @param page
	 * @return List<TSocialKeywordEntity>
	 */
	@Validation
	public QueryData queryListByPage(TSocialKeywordEntity tSocialKeywordEntity,@NotNull Pagination page);
	  
	/**
	 *�޸Ļ��߼�ɾ�� pk_id?��??
	 * @param tSocialKeywordEntity
	 * @return
	 */
	@Validation
	public int update(@NotNull TSocialKeywordEntity tSocialKeywordEntity);
	  
	 /**
	  * ����h��
	  * @param tSocialKeywordEntity
	  */
	@Validation
	public int delete(TSocialKeywordEntity tSocialKeywordEntity);
	
	/**
	  * ����h��
	  * @param tSocialKeywordEntity
	  */
	@Validation
	public Long queryCount(TSocialKeywordEntity tSocialKeywordEntity);
	  
     
  	
  
}