package com.evergrande.social.model;
import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;
import java.util.List;
import com.evergrande.common.utils.JsonUtil;


/**
 * @author czx
 * @date [Thu Jan 25 08:43:53 CST 2018]
 * @desc 敏感�?
 */
public class TSocialKeywordModel implements Serializable {


	private static final long serialVersionUID = 1L;

      
    /** 
    *  
    */
    private int id;
      
    /** 
    *  内容
    */
    private String content;
      
    /** 
    *  0-停用 1-启用
    */
    private int status;
      
    /** 
    *  备注
    */
    private String mark;
      
    /** 
    *  创建时间
    */
    private long createTime;
      
    /** 
    *  �?后修改时�?
    */
    private long modifyTime;
    
    /**
    * TSocialKeyword���캯��
    */
	public TSocialKeywordModel() {
        super();
    }


    
    /**
    *   id  get
    * @return int
    */
    public int getId() {
        return id;
    }

    /**
    *  id  set
    */
    public void setId(int id) {
        this.id = id;
    }    
        
    
    /**
    *  内容 content  get
    * @return String
    */
    public String getContent() {
        return content;
    }

    /**
    * 内容 content  set
    */
    public void setContent(String content) {
        this.content = content;
    }    
        
    
    /**
    *  0-停用 1-启用 status  get
    * @return int
    */
    public int getStatus() {
        return status;
    }

    /**
    * 0-停用 1-启用 status  set
    */
    public void setStatus(int status) {
        this.status = status;
    }    
        
    
    /**
    *  备注 mark  get
    * @return String
    */
    public String getMark() {
        return mark;
    }

    /**
    * 备注 mark  set
    */
    public void setMark(String mark) {
        this.mark = mark;
    }    
        
    
    /**
    *  创建时间 create_time  get
    * @return long
    */
    public long getCreateTime() {
        return createTime;
    }

    /**
    * 创建时间 create_time  set
    */
    public void setCreateTime(long createTime) {
        this.createTime = createTime;
    }    
        
    
    /**
    *  �?后修改时�? modify_time  get
    * @return long
    */
    public long getModifyTime() {
        return modifyTime;
    }

    /**
    * �?后修改时�? modify_time  set
    */
    public void setModifyTime(long modifyTime) {
        this.modifyTime = modifyTime;
    }    
        


	/**
	* 主�??ids ?��?in ?��??
	*/
	private List<Long> listPkId;

	/**
	* 主�??ids ?��?in ?��??
	*/
	public List<Long> getListPkId() {
		return listPkId;
	}

	/**
	* 主�??ids ?��?in ?��??
	*/
	public void setListPkId(List<Long> listPkId) {
		this.listPkId = listPkId;
	}


  	//JSON 
   	public String toString() {
		return JsonUtil.toJsonString(this);
   	}
   	
   	
   	
   	


 /**
 TSocialKeywordModel tSocialKeywordModel = new TSocialKeywordModel;
   tSocialKeywordModel.setId (id);//
   tSocialKeywordModel.setContent (content);//内容
   tSocialKeywordModel.setStatus (status);//0-停用 1-启用
   tSocialKeywordModel.setMark (mark);//备注
   tSocialKeywordModel.setCreateTime (createTime);//创建时间
   tSocialKeywordModel.setModifyTime (modifyTime);//�?后修改时�?
 */
 
 
  /**
 TSocialKeywordModel tSocialKeywordModel = new TSocialKeywordModel;
   tSocialKeywordModel.setId ("");//
   tSocialKeywordModel.setContent ("内容");//内容
   tSocialKeywordModel.setStatus ("0-停用 1-启用");//0-停用 1-启用
   tSocialKeywordModel.setMark ("备注");//备注
   tSocialKeywordModel.setCreateTime ("创建时间");//创建时间
   tSocialKeywordModel.setModifyTime ("�?后修改时�?");//�?后修改时�?
 */


}