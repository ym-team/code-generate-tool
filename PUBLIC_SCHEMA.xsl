<?xml version="1.0" encoding="gb2312"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl">
<xsl:template match="/">

<HTML>
 <HEAD>
  <TITLE>
   数据结构
  </TITLE>
 </HEAD>
 <BODY>
  <xsl:for-each select="app-data">
   <xsl:for-each select="database">
    <H2 ALIGN="CENTER">
      <a name="main">表目录</a><p/>
    </H2>
    <br/>
    <font color="green"><center>按所有Table名字排序(<a href="#module">点击按模块排序查看</a>)</center></font>
    <br/>
    <TABLE width="90%" cellspacing="1" cellpadding="1" ALIGN="CENTER">
     <THEAD>
      <TR bgcolor="#d7e2da">
       <TH ><font size="2.5">TABLE</font></TH>
       <TH><font size="2.5">NAME</font></TH>
       <TH><font size="2.5">PKG</font></TH>
       <TH><font size="2.5">JSPPATH</font></TH>
       <TH><font size="2.5">FUNCTION1</font></TH>
       <TH><font size="2.5">ONHELP</font></TH>
      </TR>
     </THEAD>
     <xsl:for-each select="//table" order-by="+ @name">
     <TBODY>

       <TR><xsl:attribute name="style">background-color:<xsl:eval>if(formatindex(childnumber(this),"01")%2==1)"#f2f3dd"</xsl:eval><xsl:eval>if(formatindex(childnumber(this),"01")%2==0)"#E7EBE9"</xsl:eval></xsl:attribute>
        <TD><font size="2.5"><xsl:value-of select="@chineseDescription"/></font></TD>
        <TD><font size="2.5"><a><xsl:attribute name="href">#<xsl:value-of select="@name"/></xsl:attribute><xsl:value-of select="@name"/></a></font></TD>
        <TD align="center"><font size="3"><xsl:value-of select="@pkg"/></font></TD>
        <TD align="center"><font size="3"><xsl:value-of select="@jspPath"/></font></TD>
        <TD align="center"><font size="3"><xsl:value-of select="@function1"/></font></TD>
        <TD align="center"><xsl:if test="@onHelp[.='true']"><font size="3"><xsl:value-of select="@onHelp"/></font></xsl:if></TD>
       </TR>

     </TBODY>
    </xsl:for-each>		
    </TABLE>
    <br/>
    <br/>
    <center><a name="module">按模块排序查看</a></center>
    <br/> 
　　<xsl:for-each select="module">
   <table align="center" width="90%">
   <tr bgcolor="#d7e2da">
   <td align="center"><b>模块名称：<xsl:value-of select="@chineseDescription"/>(<xsl:value-of select="@name"/>)</b></td>
   </tr>
   </table>
   <TABLE width="90%" cellspacing="1" cellpadding="1" ALIGN="CENTER">
     <THEAD>
      <TR bgcolor="#d7e2da">
       <TH><font size="2.5">TABLE</font></TH>
       <TH><font size="2.5">NAME</font></TH>
       <TH><font size="2.5">PKG</font></TH>
       <TH><font size="2.5">JSPPATH</font></TH>
       <TH><font size="2.5">FUNCTION1</font></TH>
       <TH><font size="2.5">ONHELP</font></TH>
      </TR>
     </THEAD>
     <TBODY>
   <xsl:for-each select="submodule">
      <xsl:for-each order-by="+ @name" select="table">
       <TR><xsl:attribute name="style">background-color:<xsl:eval>if(formatindex(childnumber(this),"01")%2==1)"#f2f3dd"</xsl:eval><xsl:eval>if(formatindex(childnumber(this),"01")%2==0)"#E7EBE9"</xsl:eval></xsl:attribute>
        <TD><font size="2.5"><xsl:value-of select="@chineseDescription"/></font></TD>
        <TD><font size="2.5"><a><xsl:attribute name="href">#<xsl:value-of select="@name"/></xsl:attribute><xsl:value-of select="@name"/></a></font></TD>
        <TD align="center"><font size="3"><xsl:value-of select="@pkg"/></font></TD>
        <TD align="center"><font size="3"><xsl:value-of select="@jspPath"/></font></TD>
        <TD align="center"><font size="3"><xsl:value-of select="@function1"/></font></TD>
        <TD align="center"><xsl:if test="@onHelp[.='true']"><font size="3"><xsl:value-of select="@onHelp"/></font></xsl:if></TD>
       </TR>
      </xsl:for-each>
      </xsl:for-each>	<!--submodule-->
     </TBODY>
         </TABLE>
    </xsl:for-each>		<!--module-->

   <xsl:for-each select="module">
   <xsl:for-each select="submodule">
      <xsl:for-each select="table">
       <h5 ALIGN="CENTER">
        <xsl:for-each select="rem">
         <font color="green"><xsl:value-of select="."/><p/></font>
        </xsl:for-each>
       </h5>
       <H5 ALIGN="CENTER">
        <a><xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute>
        <xsl:value-of select="@chineseDescription"/>
         (<xsl:value-of select="@name"/>)</a><br/>
         package:<xsl:value-of select="@pkg"/>　　jspPath:<xsl:value-of select="@jspPath"/>　　function1:<xsl:value-of select="@function1"/>　　<a href="#main">返回</a>
       </H5>


       <TABLE  cellspacing="1" cellpadding="1" ALIGN="CENTER">
        <THEAD>
         <TR bgcolor="#d7e2da">
          <TH><font size="2.5">序号</font></TH><TH><font size="2.5">name</font></TH><TH><font size="2.5">primaryKey</font></TH><TH><font size="2.5">required</font></TH>
          <TH>type</TH><TH><font size="2.5">默认值</font></TH><TH><font size="2.5">汉字列名</font></TH><TH><font size="2.5">有效值</font></TH><TH><font size="2.5">queryShow</font></TH><TH><font size="2.5">isGet</font></TH><TH><font size="2.5">readOnlyU</font></TH><TH><font size="2.5">readOnlyI</font></TH><TH><font size="2.5">Note</font></TH>
         </TR>
        </THEAD>
        <TBODY>
         <xsl:for-each select="column">    
          <TR><xsl:attribute name="style">background-color:<xsl:eval>if(formatindex(childnumber(this),"01")%2==1)"#f2f3dd"</xsl:eval><xsl:eval>if(formatindex(childnumber(this),"01")%2==0)"#E7EBE9"</xsl:eval></xsl:attribute>
           <TD><font size="2.5"><xsl:eval>formatindex(childnumber(this),"01")</xsl:eval></font></TD>
           <TD><font size="2.5"><xsl:value-of select="@name"/></font></TD>
           <TD><font size="2.5"><xsl:if test="@primaryKey[.='true']"><xsl:value-of select="@primaryKey"/></xsl:if></font></TD>
           <TD><font size="2.5"><xsl:if test="@required[.='true']"><xsl:value-of select="@required"/></xsl:if></font></TD>
           <TD><font size="2.5"><xsl:value-of select="@type"/><xsl:if test="@size[.!='']">(<xsl:value-of select="@size"/>)</xsl:if></font></TD>
           <TD><font size="2.5"><xsl:value-of select="@default"/></font></TD>
           <TD><font size="2.5"><xsl:value-of select="@chineseDescription"/></font></TD>
           <TD><font size="2.5"><xsl:value-of select="@enumValue"/></font></TD>
           <TD><font size="2.5"><xsl:if test="@queryShow[.='true']"><xsl:value-of select="@queryShow"/></xsl:if></font></TD>
           <TD><font size="2.5"><xsl:if test="@isGet[.='true']"><xsl:value-of select="@isGet"/></xsl:if></font></TD>
           <TD><font size="2.5"><xsl:if test="@readOnlyU[.='true']"><xsl:value-of select="@readOnlyU"/></xsl:if></font></TD>
           <TD><font size="2.5"><xsl:if test="@readOnlyI[.='true']"><xsl:value-of select="@readOnlyI"/></xsl:if></font></TD>
           <TD><font size="2.5"><xsl:value-of select="@note"/></font></TD>
          </TR>
         </xsl:for-each>
        </TBODY>
       </TABLE>

       <xsl:for-each select="foreign-key" >
        <h5 ALIGN="CENTER">
         foreignTable=<a><xsl:attribute name="href">#<xsl:value-of select="@foreignTable"/></xsl:attribute><xsl:value-of select="@foreignTable"/></a>
         <xsl:if test="@showCol[.!='']">　showCol=<xsl:value-of select="@showCol"/></xsl:if>
         <xsl:if test="@onInsert[.!='none']">　onInsert=<xsl:value-of select="@onInsert"/></xsl:if>
         <xsl:if test="@onUpdate[.!='none']">　onUpdate=<xsl:value-of select="@onUpdate"/></xsl:if>
         <xsl:if test="@noSql[.!='false']">　noSql=<xsl:value-of select="@noSql"/></xsl:if>
         <xsl:if test="@typeCol[.!='']">　typeCol=<xsl:value-of select="@typeCol"/></xsl:if>
         <xsl:if test="@typeValue[.!='']">　typeValue=<xsl:value-of select="@typeValue"/></xsl:if>
	
         <TABLE  width="50%" cellspacing="1" cellpadding="1" ALIGN="CENTER">
          <THEAD>
   	   <TR bgcolor="#d7e2da">
    	    <TH>local</TH><TH>foreign</TH> 
   	   </TR>
  	  </THEAD>
   	  <TBODY>
  	   <xsl:for-each select="reference">
   	    <TR><xsl:attribute name="style">background-color:<xsl:eval>if(formatindex(childnumber(this),"01")%2==1)"#f2f3dd"</xsl:eval><xsl:eval>if(formatindex(childnumber(this),"01")%2==0)"#E7EBE9"</xsl:eval></xsl:attribute>
    	     <TD><font size="2.5"><xsl:value-of select="@local"/></font></TD>
    	     <TD><font size="2.5"><xsl:value-of select="@foreign"/></font></TD>
   	    </TR>
  	   </xsl:for-each>  
 	  </TBODY>
	 </TABLE>
	</h5>
       </xsl:for-each>
       <xsl:if test="family">
       <center><font size="4"><b>Family</b></font></center>
       <TABLE cellspacing="1" cellpadding="1" ALIGN="CENTER">
  	<THEAD>
   	 <TR bgcolor="#d7e2da">
    	  <TH>childTable</TH><TH>childLocal</TH><TH>childForeign</TH><TH>parentLocal</TH><TH>parentForeign</TH> 
   	 </TR>
  	</THEAD>
  	<TBODY>
   	 <xsl:for-each select="family"> 
    	  <TR><xsl:attribute name="style">background-color:<xsl:eval>if(formatindex(childnumber(this),"01")%2==1)"#f2f3dd"</xsl:eval><xsl:eval>if(formatindex(childnumber(this),"01")%2==0)"#E7EBE9"</xsl:eval></xsl:attribute>
     	   <TD><font size="2.5"><xsl:value-of select="@childTable"/></font></TD>
     	   <TD><font size="2.5"><xsl:value-of select="@childLocal"/></font></TD>
     	   <TD><font size="2.5"><xsl:value-of select="@childForeign"/></font></TD>
     	   <TD><font size="2.5"><xsl:value-of select="@parentLocal"/></font></TD>
     	   <TD><font size="2.5"><xsl:value-of select="@parentForeign"/></font></TD>
    	  </TR>  
   	 </xsl:for-each>
  	</TBODY>
       </TABLE>
      </xsl:if>
     </xsl:for-each>
    </xsl:for-each>
    </xsl:for-each>
    </xsl:for-each>
   </xsl:for-each>
  </BODY>
 </HTML>
</xsl:template>
</xsl:stylesheet>
