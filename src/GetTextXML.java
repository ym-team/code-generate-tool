

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class GetTextXML {
  
 
  
  /**
   * @param args
   * @throws Exception
   */
  public static void main(String [] args) throws Exception {
    //GetTextXML.getColumnCommentByTableName("USER_CMCC_DOCTOR_MONEY_SUMMARY","usercmcc");
    
    //List<String> listTableName = Arrays.asList("user_app_advice_doctor");
    

	
    List<String> listTableName = Arrays.asList("t_social_keyword");
    String subPage = "social"; 
    GetTextXML.getColumnCommentByTableNames(listTableName,subPage);
  }
/*  <property name="url" value="jdbc:mysql://192.168.1.62:3306/ccust"/> 
  <property name="username" value="ccust"/>
  <property name="password" value="Ccust1234"/>*/
  public static Connection getMySQLConnection() throws Exception {
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://mysql-dev.hd:3301/mimidb", "dev_user", "dev_user123");
    return conn;
  }
  
  
  /**
   * 锟斤拷锟侥筹拷锟斤拷锟斤拷锟斤拷锟斤拷侄蔚锟阶拷锟�
   * @param tableName
   * @return
   * @throws Exception
   */
  public static void getColumnCommentByTableNames(List<String> listTableNames,String packag) throws Exception {
    
    Connection conn = getMySQLConnection(); 
    PreparedStatement stmt = null;
    ResultSet rs =  null;
    
    String fileText = "<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"no\"?>" +"\r\n"+
        "<?xml-stylesheet type=\"text/xsl\" href=\"PUBLIC_SCHEMA.xsl\"?>" + "\r\n" + 
        "<!DOCTYPE app-data SYSTEM \"database.dtd\">"+"\r\n" +
        "<app-data>" + "\r\n" + 
            "<database>" +  "\r\n" + 
              "<!--平台系统锟斤拷锟斤拷-->" + "\r\n" +
                "<module name=\"SYS\" chineseDescription=\"平台系统锟斤拷锟斤拷\">"+ "\r\n" + 
                  "<submodule name=\"SYS_PT_SYSTEM\" chineseDescription=\"平台系统锟斤拷锟斤拷\">"  + "\r\n";
    String allTables = "";
    for(int i = 0 ;i < listTableNames.size();i++){
      String tableName = listTableNames.get(i);
      String my_sql = "show full columns from " + tableName;
      //String oracle_sql = select * from cols where table_name = '表名（一般大写';
      stmt = conn.prepareStatement(my_sql);
      rs = stmt.executeQuery();
      
      String strTableStart = "<table name='"+tableName+"' chineseDescription='锟斤拷锟斤拷' pkg='"+packag+"' jspPath='platform/permit/userRole' >";
      String strTableEnd = "</table>";
      
      String strCol = "";
      while (rs.next()) {
    	  String colType = rs.getString("Type");
    	  System.out.println(colType);
    	  if(colType.indexOf("varchar")>=0){
    		  colType = "VARCHAR"; 
    	  }else if(colType.indexOf("bigint")>=0){
    		  colType = "BIGINT"; 
    	  }else if(colType.indexOf("timestamp")>=0){
    		  colType = "TIMESTAMP"; 
    	  }else if(colType.indexOf("decimal")>=0){
    		  colType = "DECIMAL"; 
    	  }else{
    		  colType = "INTEGER";
    	  }
    	  
       // strCol += "<column name='"+rs.getString("Field")+"'   primaryKey='true' required='true' type='"+ rs.getString("Type")+"'  chineseDescription='"+rs.getString("Comment")+"'/>"+"\r\n";
        
        strCol += "<column name='"+rs.getString("Field")+"'   primaryKey='true' required='true' type='"+colType+"'  chineseDescription='"+rs.getString("Comment")+"'/>"+"\r\n";
      } 
      
      allTables  +=  "\r\n"+strTableStart + "\r\n" + strCol + strTableEnd;
      

    }
    System.out.println("=============================");
    System.out.println(allTables);
    System.out.println("=============================");
    
    
    String half = fileText + allTables + "\r\n";
    String end = " </submodule>" + "\r\n" +      
          "</module>" + "\r\n" +   
        "</database>" + "\r\n" + 
   "</app-data>";
    
    
    String all = half + end; 
  //  System.out.println();
  //  System.out.println(all);


  // WriteFile(all);

    rs.close();
    stmt.close();
    conn.close();
    }
  
  
  public static void WriteFile(String fileText) throws Exception{
    File file = new File("F:"+File.separator+"workspace"+File.separator+"a_f_d_java"+File.separator+"codemachine"+File.separator+"schema"+File.separator+"test2.xml");
    
    //Writer out = new FileWriter(file,true,Encoding.GetEncoding.UTF-8);
    //StreamWriter sw=new StreamWriter("C:\\pp.txt", false, Encoding.UTF8);
    Writer out = new BufferedWriter( new OutputStreamWriter(new FileOutputStream(file),"UTF-8"));
    out.write(fileText);
    out.close();
  }

  
  /**db2
   * https://zhidao.baidu.com/question/244521899.html
   * 
   * */

}
