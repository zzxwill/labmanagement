<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

 



<html>
  <head>
  	<title></title>
    

  </head>
  
  <body>
  	<table>
                    <span id="SubscriptionList"><dt>订阅我的博客</dt><dd><a href="http://blog.csdn.net/xingxuelin/Rss.aspx" ><img border="0" alt="XML聚合" src="/images/xml.gif" /></a>&nbsp;&nbsp;<a href="http://feeds.feedsky.com/csdn.net/xingxuelin" target="_blank"><img border="0" alt="FeedSky" src="/images/feedsky.gif" /></a></dd><dd><a href="http://www.xianguo.com/subscribe.php?url=http://blog.csdn.net/xingxuelin/Rss.aspx" target="_blank"><img border="0" alt="订阅到鲜果" src="/images/rss_xianguo.jpg"/></a></dd><dd><a href="http://fusion.google.com/add?feedurl=http://blog.csdn.net/xingxuelin/Rss.aspx" target="_blank"><img border="0" alt="订阅到Google" src="/images/rss_google.gif"/></a></dd><dd><a href="http://www.zhuaxia.com/add_channel.php?url=http://blog.csdn.net/xingxuelin/Rss.aspx" target="_blank"><img border="0" alt="订阅到抓虾" src="/images/rss_zhuaxia.gif"/></a></dd><dd><a href="http://www.bloglines.com/sub/http://blog.csdn.net/xingxuelin/Rss.aspx" target="_blank"><img border="0" alt="订阅到BlogLines" src="/images/rss_bloglines.gif"/></a></dd><dd><a href="http://add.my.yahoo.com/rss?url=http://blog.csdn.net/xingxuelin/Rss.aspx" target="_blank"><img border="0" alt="订阅到Yahoo" src="/images/rss_yahoo.gif"/></a></dd><dd><a href="http://rss.gougou.com/find_rss.jsp?url=http://blog.csdn.net/xingxuelin/Rss.aspx" target="_blank"><img border="0" alt="订阅到GouGou" src="/images/rss_gougou.gif"/></a></dd><dd><a href="http://www.pageflakes.com/subscribe.aspx?url=http://blog.csdn.net/xingxuelin/Rss.aspx" target="_blank"><img border="0" alt="订阅到飞鸽" src="/images/rss_pageflakes.gif"/></a></dd><dd><a href="http://www.rojo.com/add-subscription?resource=http://blog.csdn.net/xingxuelin/Rss.aspx" target="_blank"><img border="0" alt="订阅到Rojo" src="/images/rss_rojo.gif"/></a></dd><dd><a href="http://www.newsgator.com/ngs/subscriber/subfext.aspx?url=http://blog.csdn.net/xingxuelin/Rss.aspx" target="_blank"><img border="0" alt="订阅到newsgator" src="/images/rss_newsgator.gif"/></a></dd><dd><a href="http://www.netvibes.com/subscribe.php?url=http://blog.csdn.net/xingxuelin/Rss.aspx" target="_blank"><img border="0" alt="订阅到netvibes" src="/images/rss_netvibes.gif"/></a></dd></span>
  		
  	</table>
  
    

//		<%session.setAttribute("g2","123"); %>
		<%session.setAttribute("name","will"); %>

   

  </body>
</html>
