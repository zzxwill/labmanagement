<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%@ include file="head.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>申请友情链接</title>
<link href="../base.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style2 {
	color: #CC0000;
	font-size: 11pt;
}
-->
</style>
</head>
<body>
<table width="900" border="0" align="center" cellspacing="2">
  <tr> 
    <td width="900px"><br></td>
  </tr>
  <tr> 
    <td bgcolor="#CCCC99" height="6"></td>
  </tr>
  <tr> 
    <td bgcolor="#DEEFE2"> 
    	&nbsp;申请友情链接：&nbsp; 
    <a href='index.jsp'>[返回主页]</a>
   </td>
  </tr>
  <tr> 
    <td> <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height="3"></td>
        </tr>
        <tr> 
          <td height="100" align="center" valign="top">
		  <form name="form1" method="post" action="flink.php">
		  	<input type='hidden' name='dopost' value='save'>
		      <table width="98%"  border="0" cellspacing="1" cellpadding="3">
                <tr> 
                  <td height="8" colspan="2"></td>
                </tr>
                
                <tr> 
                  <td width="19%" height="25">网址：</td>
                  <td width="81%"><input name="url" type="text" id="url" value="http://" size="30"></td>
                </tr>
                <tr> 
                  <td height="25">网站名称：</td>
                  <td><input name="webname" type="text" id="webname" size="30"></td>
                </tr>
                
                <tr> 
                  <td height="25">网站简况：</td>
                  <td><textarea name="msg" cols="50" rows="4" id="msg"></textarea></td>
                </tr>
                <tr> 
                  <td height="25">站长Email：</td>
                  <td><input name="email" type="text" id="email" size="30"></td>
                </tr>
                <tr> 
                  <td height="25">网站类型：</td>
                  <td> <select name="typeid" id="typeid">
                      	<option value='1'>综合网站</option>
	<option value='2'>娱乐类</option>
	<option value='3'>教育类</option>
	<option value='4'>计算机类</option>
	<option value='5'>电子商务</option>
	<option value='6'>网上信息</option>
	<option value='7'>论坛类</option>
	<option value='8'>其它类型</option>
                    </select> </td>
                </tr>
                <tr> 
                  <td height="51">&nbsp;</td>
                  
                  
<script   language="JavaScript">   
  function   noregist(){   
  alert("您的链接申请也已成功,请等待管理员审核批准!");   
  open("http://localhost:8080/labmanagement/jsp/applyLink.jsp","");
  window.opener=null;self.close();
  
  }   
  </script> 
  
  <td><input type="button" value="提 交" onclick="noregist();">
                  <!--input type="submit" name="Submit" value=" 提 交 ">  -->
                    　 　 
                    <input type="reset" name="Submit" value=" 重 置 "></td>
                </tr>
              </table>
		  </form>
			</td>
        </tr>
        <tr> 
          <td height="3"></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td bgcolor="#CCCC99" height="6"></td>
  </tr>
  <tr> 
    <td align="center" height="30">
    </td>
  </tr>
</table>
	</td>
  </tr>
  <tr>
    <td height="20">&nbsp;</td>
  </tr>
</table>


<!-- SiteSearch Google --> 

</body>
</html> 