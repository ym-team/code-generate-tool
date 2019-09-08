package com.evergrande.social.service.impl;

import java.util.ArrayList;
import java.util.List;

import java.math.BigDecimal;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import com.evergrande.common.Pagination;
import com.evergrande.common.QueryData;


import com.evergrande.social.entity.TSocialKeywordEntity;



 /**
 * @author chenzx
 * @date [Thu Jan 25 08:43:53 CST 2018]
 * @desc 
 */
 
 
public class TSocialKeywordServiceTest {


    private TSocialKeywordService tSocialKeywordSevice;
    private ApplicationContext context;
    

    @Before
    public void before() {
        context = new ClassPathXmlApplicationContext("dubbo-service-consumer.xml");
        tSocialKeywordSevice = (TSocialKeywordService) context.getBean("TSocialKeywordService");
    }



    @After
    public void after() {

    }
    


	  @Test
	  public void testSave() throws Exception {
	  	TSocialKeywordEntity  tSocialKeywordEntity = new TSocialKeywordEntity();
	  	
	  	tSocialKeywordSevice.save(tSocialKeywordEntity);
	  	
	  		  	//ä¸»é?? è¿?ä¸?è¡?
	  	System.out.println("ä¸»é?? ï¼?"+tPmExceptionToPreypayRecordEntity.getExceptionPrepayId());
	  }


	  @Test
  	  public void testSaveList() throws Exception{
  	  	List<TSocialKeywordEntity> listTSocialKeywordEntity = new ArrayList<TSocialKeywordEntity>();
  	  	TSocialKeywordEntity  tSocialKeywordEntity = new TSocialKeywordEntity();
  	  	
  	  	listTSocialKeywordEntity.add(tSocialKeywordEntity);
  	  	
  	  	TSocialKeywordEntity  tSocialKeywordEntity2 = new TSocialKeywordEntity();
  	  	
  	  	listTSocialKeywordEntity.add(tSocialKeywordEntity2);
  	  	
  	  	tSocialKeywordSevice.saveList(listTSocialKeywordEntity);
  	  	
  	  }
 
 
 	  @Test
	  public void testQueryDetail() throws Exception{
	  
	  	TSocialKeywordEntity  tSocialKeywordEntity = new TSocialKeywordEntity();
	  	
	  	tSocialKeywordEntity = tSocialKeywordSevice.queryDetail(tSocialKeywordEntity);
	  	System.out.println(tSocialKeywordEntity.toString());
	  }
	  

	  @Test
	  public void testQueryList() throws Exception{
	  	
	  	TSocialKeywordEntity  tSocialKeywordEntity = new TSocialKeywordEntity();
	  	
	  	List<TSocialKeywordEntity> listTSocialKeywordEntity = tSocialKeywordSevice.queryList(tSocialKeywordEntity);
	  	System.out.println(listTSocialKeywordEntity.toString());
	  }
	  
	  
	  @Test
	  public void testQueryListByPage() throws Exception{
	  	
	  	TSocialKeywordEntity  tSocialKeywordEntity = new TSocialKeywordEntity();
	  	
	  	Pagination page = new Pagination();
	  	page.setCurrentPage(1);
	  	page.setPageSize(5);
	  	
	  	QueryData queryListByPage = tSocialKeywordSevice.queryListByPage(tSocialKeywordEntity,page);
	  	System.out.println(queryListByPage.toString());
	  	System.out.println(queryListByPage.getDataList().toString());
	  	
	  }
	  
	  
  
  
 
	  @Test
	  public void testQueryCount() throws Exception{
	  	
	  	
	  	TSocialKeywordEntity  tSocialKeywordEntity = new TSocialKeywordEntity();
	  	
	  	Long count = tSocialKeywordSevice.queryCount(tSocialKeywordEntity);
	  	
	  	System.out.println("count:"+count);
	  }
  

 	 @Test
	 public void testUpdate() throws Exception{
	 
	 	TSocialKeywordEntity  tSocialKeywordEntity = new TSocialKeywordEntity();
	 	
	 	tSocialKeywordSevice.update(tSocialKeywordEntity);
	 	
	 }
	 
	 
	 @Test
	 public void testUpdate() throws Exception{
	 
	 	TSocialKeywordEntity  tSocialKeywordEntity = new TSocialKeywordEntity();
	 	
	 	tSocialKeywordSevice.update(tSocialKeywordEntity);
	 	
	 }
	 
	 
	 @Test
	 public void testDelete() throws Exception{
	 
	 	TSocialKeywordEntity  tSocialKeywordEntity = new TSocialKeywordEntity();
	 	
	 	tSocialKeywordSevice.delete(tSocialKeywordEntity);
	 	
	 }
	 
	 
	 
	 
  

 
}