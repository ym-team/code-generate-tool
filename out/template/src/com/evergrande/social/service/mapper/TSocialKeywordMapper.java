package com.evergrande.social.dao.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.evergrande.common.Pagination;

import com.evergrande.social.entity.TSocialKeywordEntity;

/**
 * @author czx
 * @date [Thu Jan 25 08:43:53 CST 2018]
 * @desc  ÊïèÊÑüËØ?
 */
 
public interface TSocialKeywordMapper{
	
		/**
	   * ?∞Â?
	   * @param tSocialKeywordEntity
	   * @return
	   * @throws Exception
	   */
	public int save(@Param("tSocialKeywordEntity")TSocialKeywordEntity  tSocialKeywordEntity);
	
	
	

	/**
	   * ?πÈ???∞Â?
	   * @param tSocialKeywordEntity
	   * @return
	   * @throws Exception
	   */
	public int saveList(@Param("listTSocialKeywordEntity")List<TSocialKeywordEntity>  listTSocialKeywordEntity);
	

  	 /**
	   * ?•Ë?¢Ë????
	   * @param tSocialKeywordEntity
	   * @return
	   * @throws Exception
	   */
	public TSocialKeywordEntity queryDetail(@Param("tSocialKeywordEntity")TSocialKeywordEntity tSocialKeywordEntity);
  
	/**
	 * ?•Ë?¢Â??Ë°? 
	 * @param tSocialKeywordEntity
	 * @return
	 * @throws Exception
	 */
	public List<TSocialKeywordEntity> queryList(@Param("tSocialKeywordEntity")TSocialKeywordEntity tSocialKeywordEntity);
	  
	/**
	 * ??È°µÊ?•Ë?¢Â??Ë°? 
	 * @param tSocialKeywordEntity
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<TSocialKeywordEntity> queryListByPage(@Param("tSocialKeywordEntity")TSocialKeywordEntity tSocialKeywordEntity,@Param("page")Pagination page);
	  
	/**
	 * ?¥Ê??
	 * @param tSocialKeywordEntity
	 * @return
	 * @throws Exception
	 */
	public int update(@Param("tSocialKeywordEntity")TSocialKeywordEntity tSocialKeywordEntity);
	  
	 /**
	  * ?©Á??????
	  * @param tSocialKeywordEntity
	  * @throws Exception
	  */
	public int delete(@Param("tSocialKeywordEntity")TSocialKeywordEntity tSocialKeywordEntity);
	
	/**
	  * ?•Ë?¢Ê?ªÊ??
	  * @param tSocialKeywordEntity
	  * @throws Exception
	  */
	public Long queryCount(@Param("tSocialKeywordEntity")TSocialKeywordEntity tSocialKeywordEntity);
	
	
	  
     

}