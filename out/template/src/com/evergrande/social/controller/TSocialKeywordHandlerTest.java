package com.evergrande.social.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import java.io.IOException;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.evergrande.common.utils.JsonUtil;
import com.evergrande.pm.api.util.JsonClientUtil;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.evergrande.api.aop.loginCheck.LoginRequired;

import com.evergrande.social.entity.TSocialKeywordEntitySaveParam;
import com.evergrande.social.entity.TSocialKeywordEntityQueryParam;
import com.evergrande.social.entity.TSocialKeywordEntityUpdateParam;
import com.evergrande.social.entity.TSocialKeywordEntityDeleteParam;



 /**
 * @author chenzx
 * @date [Thu Jan 25 08:43:53 CST 2018]
 * @desc 
 */
 
 
public class TSocialKeywordHandlerTest {


	private String reqUrl;
	private String token;
    

	@Before
	public void setUp() throws Exception {

		token = "9xGCDFPyC/GO2Mt8+IAbIjRz3soFLg5+zanIbpOjLZo=";

		// local
		reqUrl = "http://localhost:20407";
		//dev
		//reqUrl = "http://dev.property-api.hd";

	}



    @After
    public void after() {

    }
    


	  @Test
	  public void testSave() throws Exception {
		// ???°è????
		ObjectNode paramNode = JsonUtil.createObjectNode();
		
		TSocialKeywordEntitySaveParam tSocialKeywordEntitySaveParam = new TSocialKeywordEntitySaveParam();
		
		paramNode.putPOJO("tSocialKeywordEntitySaveParam", tSocialKeywordEntitySaveParam);
		 
		String result = JsonClientUtil.request(reqUrl + "/tSocialKeyword/save", paramNode, token,LoginRequired.LoginType.NORMAL);
		System.out.println("result:"+result);
	}


	  @Test
  	  public void testSaveList() throws Exception{
  	  		// ???°è????
		ObjectNode paramNode = JsonUtil.createObjectNode();
		
		TSocialKeywordEntitySaveParam tSocialKeywordEntitySaveParam = new TSocialKeywordEntitySaveParam();
		
		TSocialKeywordEntitySaveParam tSocialKeywordEntitySaveParam2 = new TSocialKeywordEntitySaveParam();
		
		List<TSocialKeywordEntitySaveParam> listTSocialKeywordEntitySaveParam = new ArrayList<TSocialKeywordEntitySaveParam>();
		
		listTSocialKeywordEntitySaveParam.add(tSocialKeywordEntitySaveParam);
		listTSocialKeywordEntitySaveParam.add(tSocialKeywordEntitySaveParam2);
		
		paramNode.putPOJO("listTSocialKeywordEntitySaveParam", listTSocialKeywordEntitySaveParam);
		 
		String result = JsonClientUtil.request(reqUrl + "/tSocialKeyword/saveList", paramNode, token,LoginRequired.LoginType.NORMAL);
  	  	System.out.println("result:"+result);
 	  }
 
 
 	  @Test
	  public void testQueryDetail() throws Exception{
	  	  	  		// ???°è????
		ObjectNode paramNode = JsonUtil.createObjectNode();
		
		TSocialKeywordEntityQueryParam tSocialKeywordEntityQueryParam = new TSocialKeywordEntityQueryParam();
		
		paramNode.putPOJO("tSocialKeywordEntityQueryParam", tSocialKeywordEntityQueryParam);
		
		String result = JsonClientUtil.request(reqUrl + "/tSocialKeyword/queryDetail", paramNode, token,LoginRequired.LoginType.NORMAL);
		System.out.println("result:"+result);
	  }
	  

	  @Test
	  public void testQueryList() throws Exception{
	  	// ???°è????
		ObjectNode paramNode = JsonUtil.createObjectNode();
		
		TSocialKeywordEntityQueryParam tSocialKeywordEntityQueryParam = new TSocialKeywordEntityQueryParam();
		
		
		paramNode.putPOJO("tSocialKeywordEntityQueryParam", tSocialKeywordEntityQueryParam);
		
	  	String result = JsonClientUtil.request(reqUrl + "/tSocialKeyword/queryList", paramNode, token,LoginRequired.LoginType.NORMAL);
	  	System.out.println("result:"+result);
	  }
	  
	  
	  @Test
	  public void testQueryListByPage() throws Exception{
	  	ObjectNode node = JsonUtil.createObjectNode();
	  	node.put("pageSize",10);
	  	node.put("currentPage", 1);
	  	
	  	//???°è?æ»?
	  	node.put("",);
	  	
	  	ObjectNode pNode = JsonUtil.createObjectNode();
        pNode.put("param",JsonUtil.toJsonString(node));
        String request = JsonClientUtil.request(reqUrl + "/tSocialKeyword/queryList", pNode, token, LoginRequired.LoginType.MANAGER);
       	System.out.println("result:"+result);
            
	  }
	  
	  
  
  
 
	  @Test
	  public void testQueryCount() throws Exception{
	  	ObjectNode paramNode = JsonUtil.createObjectNode();
		
		TSocialKeywordEntityQueryParam tSocialKeywordEntityQueryParam = new TSocialKeywordEntityQueryParam();
		
		paramNode.putPOJO("tSocialKeywordEntityQueryParam", tSocialKeywordEntityQueryParam);
		
		String result = JsonClientUtil.request(reqUrl + "/tSocialKeyword/queryCount", paramNode, token,LoginRequired.LoginType.NORMAL);
	     System.out.println("result:"+result);
	  	
	  }
  

 	 @Test
	 public void testUpdate() throws Exception{
	 	ObjectNode paramNode = JsonUtil.createObjectNode();
		
		TSocialKeywordEntityUpdateParam tSocialKeywordEntityUpdateParam = new TSocialKeywordEntityUpdateParam();
		//è®¾ç½®ä¸»é???´æ??
		
		paramNode.putPOJO("tSocialKeywordEntityUpdateParam", tSocialKeywordEntityUpdateParam);
		
		String result = JsonClientUtil.request(reqUrl + "/tSocialKeyword/update", paramNode, token,LoginRequired.LoginType.NORMAL);
	    System.out.println("result:"+result);
		
	 }
	 
	 
	 
	 @Test
	 public void testDelete() throws Exception{
	 	ObjectNode paramNode = JsonUtil.createObjectNode();
		
		TSocialKeywordEntityDeleteParam tSocialKeywordEntityDeleteParam = new TSocialKeywordEntityDeleteParam();
		//è®¾ç½®ä¸»é???´æ??
		
		paramNode.putPOJO("tSocialKeywordEntityDeleteParam", tSocialKeywordEntityDeleteParam);
		
		String result = JsonClientUtil.request(reqUrl + "/tSocialKeyword/delete", paramNode, token,LoginRequired.LoginType.NORMAL);
	    System.out.println("result:"+result);
	 	
	 
	 }
	 
	 
	 
	 
  

 
}