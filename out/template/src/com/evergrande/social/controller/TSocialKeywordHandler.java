package com.evergrande.social.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.evergrande.api.aop.loginCheck.LoginRequired;
import com.evergrande.api.aop.loginCheck.LoginType;
import com.evergrande.api.server.Handler;
import com.evergrande.api.server.protocol.UrlMapping;
import com.evergrande.common.CommLogger;
import com.evergrande.common.utils.JsonUtil;
import com.evergrande.common.valid.Validation;
import com.plantform.sys.syscode.entity.TSocialKeywordEntity;
import com.plantform.sys.syscode.entity.TSocialKeywordEntitySaveParam;
import com.plantform.sys.syscode.entity.TSocialKeywordEntityQueryParam;
import com.plantform.sys.syscode.entity.TSocialKeywordEntityDeleteParam;
import com.plantform.sys.syscode.entity.TSocialKeywordEntityUpdateParam;
import com.plantform.sys.syscode.service.interfaces.ITSocialKeywordService;

/**
 * @author czx
 * @date [Thu Jan 25 08:43:53 CST 2018]
 *
 */
@Component
public class TSocialKeywordHandler implements Handler
{
	private static CommLogger logger = CommLogger.getInstance(TSocialKeywordHandler.class);
	
	@Autowired
	private TSocialKeywordService tSocialKeywordSevice;
	
	/**
	 * ҳ����ת ��ҳ��ѯ
	 * @param TSocialKeywordEntitySaveParam
	 * @return	Long	
	 * @throws Exception
	 */
	@UrlMapping("/tSocialKeyword/save")
	@Validation
    @LoginRequired(loginType = LoginType.ALL)
	public String save(@NotNull TSocialKeywordEntitySaveParam tSocialKeywordEntitySaveParam) throws Exception {
		logger.info("TSocialKeywordHandler -> save ?��??:" + JsonUtil.toJsonString(TSocialKeywordEntitySaveSaveParam));
		TSocialKeywordEntity tSocialKeywordEntity = new TSocialKeywordEntity();
		BeanUtils.copyPropertiesProperties(TSocialKeywordEntitySaveParam,tSocialKeywordEntity);
		Long id = this.tSocialKeywordSevice.save(tSocialKeywordEntity);
		logger.info("TSocialKeywordHandler -> save ?��??:" + id);
		return id+"";
	}
	
	/**
	 * ����
	 * @param List<TSocialKeywordEntitySaveParam>
	 * @return boolean
	 * @throws Exception
	 */
	@UrlMapping("/tSocialKeyword/saveList")
	@Validation
    @LoginRequired(loginType = LoginType.ALL)
	public boolean saveList(@NotNull @Size(min=1)List<TSocialKeywordEntitySaveParam> listTSocialKeywordEntitySaveParam)throws Exception {
		logger.info("TSocialKeywordHandler -> saveList ?��??:" + JsonUtil.toJsonString(listTSocialKeywordEntitySaveParam));
		
		List<TSocialKeywordEntity> listTSocialKeywordEntity = new ArrayList<TSocialKeywordEntity>();
		
		for(int i = 0 ; i < listTSocialKeywordEntitySaveParam.size() ; i++){
			TSocialKeywordEntity tSocialKeywordEntity = new TSocialKeywordEntity();
			 TSocialKeywordEntitySaveParam tSocialKeywordEntitySaveParam = listTSocialKeywordEntitySaveParam.get(i);
			 BeanUtils.copyProperties(tSocialKeywordEntitySaveParam,tSocialKeywordEntity);
			listTSocialKeywordEntity.add(tSocialKeywordEntity);
		}
		
		 this.tSocialKeywordSevice.saveList(listTSocialKeywordEntity);
		 
		 logger.info("TSocialKeywordHandler -> saveList ?��??:" + true);
		 
		 return true;
	}
	
	/**
	 * ɾ��
	 * @param TSocialKeywordEntityQueryParam
	 * @return	TSocialKeywordEntityQueryParam
	 * @throws Exception
	 */
	@UrlMapping("/tSocialKeyword/queryDetail")
	@Validation
    @LoginRequired(loginType = LoginType.ALL)
	public TSocialKeywordEntityQueryParam queryDetail(TSocialKeywordEntityQueryParam tSocialKeywordEntityQueryParam)throws Exception{
		logger.info("TSocialKeywordHandler -> queryDetail ?��??:" + tSocialKeywordEntityQueryParam.toString());
		TSocialKeywordEntity tSocialKeywordEntity = new TSocialKeywordEntity();
		BeanUtils.copyProperties(tSocialKeywordEntityQueryParam,tSocialKeywordEntity);
		
		tSocialKeywordEntity = this.tSocialKeywordSevice.queryDetail(tSocialKeywordEntity);
		BeanUtils.copyProperties(tSocialKeywordEntity,tSocialKeywordEntityQueryParam);
		
		logger.info("TSocialKeywordHandler -> queryDetail ?��??:" + tSocialKeywordEntityQueryParam.toString());
		return tSocialKeywordEntityQueryParam;
	}
	
	
	/**@param TSocialKeywordEntityQueryParam
	 * @return List<TSocialKeywordEntityQueryParam>
	 * @throws Exception
	 */
	@UrlMapping("/tSocialKeyword/queryList")
	@Validation
    @LoginRequired(loginType = LoginType.ALL)
	public List<TSocialKeywordEntityQueryParam> queryList(TSocialKeywordEntityQueryParam tSocialKeywordEntityQueryParam)throws Exception{
		logger.info("TSocialKeywordHandler -> queryList ?��??:" + tSocialKeywordEntityQueryParam.toString());
		
		TSocialKeywordEntity tSocialKeywordEntity = new TSocialKeywordEntity();
		BeanUtils.copyProperties(tSocialKeywordEntityQueryParam,tSocialKeywordEntity);
		
		List<TSocialKeywordEntity> listTSocialKeywordEntity = this.tSocialKeywordSevice.queryList(tSocialKeywordEntity);

		List<TSocialKeywordEntityQueryParam> listTSocialKeywordEntityQueryParam = new ArrayList<TSocialKeywordEntityQueryParam>();		
		if(null != listTSocialKeywordEntity && listTSocialKeywordEntity.size()){
			for(int i = 0 ; i < listTSocialKeywordEntity.size() ; i++){
				TSocialKeywordEntityQueryParam tSocialKeywordEntityQueryParam = new tSocialKeywordEntityQueryParam();
				TSocialKeywordEntity tSocialKeywordEntity2 = listTSocialKeywordEntity.get(i);
				BeanUtils.copyProperties(tSocialKeywordEntity2,tSocialKeywordEntityQueryParam);
				listTSocialKeywordEntityQueryParam.add(tSocialKeywordEntityQueryParam);
			}
		}
		
		logger.info("TSocialKeywordHandler -> queryList ?��??:" + listTSocialKeywordEntityQueryParam.toString());
		
		return listTSocialKeywordEntityQueryParam;
		
	}
	
	
	/**@param TSocialKeywordEntityQueryParam
	 * @return List<TSocialKeywordEntityQueryParam>
	 * @throws Exception
	 */
	@UrlMapping("/tSocialKeyword/queryListByPage")
	@Validation
    @LoginRequired(loginType = LoginType.ALL)
	public List<TSocialKeywordEntityQueryParam> queryListByPage(TSocialKeywordEntityQueryParam tSocialKeywordEntityQueryParam,Page page)throws Exception{
		logger.info("TSocialKeywordHandler -> queryListByPage ?��??:" + tSocialKeywordEntityQueryParam.toString());
	
		TSocialKeywordEntity tSocialKeywordEntity = new TSocialKeywordEntity();
		BeanUtils.copyProperties(tSocialKeywordEntityQueryParam,tSocialKeywordEntity);
		
		List<TSocialKeywordEntity> listTSocialKeywordEntity = this.tSocialKeywordSevice.queryList(tSocialKeywordEntity,page);

		List<TSocialKeywordEntityQueryParam> listTSocialKeywordEntityQueryParam = new ArrayList<TSocialKeywordEntityQueryParam>();		
		if(null != listTSocialKeywordEntity && listTSocialKeywordEntity.size()){
			for(int i = 0 ; i < listTSocialKeywordEntity.size() ; i++){
				TSocialKeywordEntityQueryParam tSocialKeywordEntityQueryParam = new tSocialKeywordEntityQueryParam();
				TSocialKeywordEntity tSocialKeywordEntity2 = listTSocialKeywordEntity.get(i);
				BeanUtils.copyProperties(tSocialKeywordEntity2,tSocialKeywordEntityQueryParam);
				listTSocialKeywordEntityQueryParam.add(tSocialKeywordEntityQueryParam);
			}
		}
		
		logger.info("TSocialKeywordHandler -> queryListByPage ?��??:" + tSocialKeywordEntityQueryParam.toString());
		
		return listTSocialKeywordEntityQueryParam;
	}
	
	
	/**
	 * ɾ��
	 * @param TSocialKeywordEntityQueryParam
	 * @return	Long
	 * @throws Exception
	 */
	@UrlMapping("/tSocialKeyword/queryCount")
	@Validation
    @LoginRequired(loginType = LoginType.ALL)
	public Long queryCount(TSocialKeywordEntityQueryParam tSocialKeywordEntityQueryParam)throws Exception{
		logger.info("TSocialKeywordHandler -> queryCount ?��??:" + tSocialKeywordEntityQueryParam.toString());
		
		TSocialKeywordEntity tSocialKeywordEntity = new TSocialKeywordEntity();
		BeanUtils.copyProperties(tSocialKeywordEntityQueryParam,tSocialKeywordEntity);
		Long count = this.tSocialKeywordSevice.queryCount(tSocialKeywordEntity);
		
		logger.info("TSocialKeywordHandler -> queryCount ?��??:" + count);
		
		return count;
	}
	
	
	/**
	 * ɾ��
	 * @param TSocialKeywordEntityUpdateParam
	 * @return	boolean
	 * @throws Exception
	 */
	@UrlMapping("/tSocialKeyword/update")
	@Validation
    @LoginRequired(loginType = LoginType.ALL)
	public boolean update(TSocialKeywordEntityUpdateParam tSocialKeywordEntityUpdateParam)throws Exception{
		logger.info("TSocialKeywordHandler -> update ?��??:" + tSocialKeywordEntityUpdateParam.toString());
		
		TSocialKeywordEntity tSocialKeywordEntity = new TSocialKeywordEntity();
		BeanUtils.copyProperties(tSocialKeywordEntityUpdateParam,tSocialKeywordEntity);
		this.tSocialKeywordSevice.update(tSocialKeywordEntity);
		
		logger.info("TSocialKeywordHandler -> update ?��??:" + true);
		
		return true;
	}
	
	
	/**
	 * ɾ��
	 * @param TSocialKeywordEntityDeleteParam
	 * @return	boolean
	 * @throws Exception
	 */
	@UrlMapping("/tSocialKeyword/delete")
	@Validation
    @LoginRequired(loginType = LoginType.ALL)
	public boolean delete(TSocialKeywordEntityDeleteParam tSocialKeywordEntityDeleteParam)throws Exception{
		logger.info("TSocialKeywordHandler -> delete ?��??:" + tSocialKeywordEntityDeleteParam.toString());
		
		TSocialKeywordEntity tSocialKeywordEntity = new TSocialKeywordEntity();
		BeanUtils.copyProperties(tSocialKeywordEntityDeleteParam,tSocialKeywordEntity);
		this.tSocialKeywordSevice.delete(tSocialKeywordEntity);
		
		logger.info("TSocialKeywordHandler -> delete ?��??:" + tSocialKeywordEntityDeleteParam.toString());
		return true;
	}
	
	
	
	
}