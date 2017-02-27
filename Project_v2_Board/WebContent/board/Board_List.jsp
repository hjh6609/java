<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Board List</title>
</head>
<body>
<br /><br /><br /><br />
<%
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	String url = "jdbc:sqlserver://127.0.0.1:1433;DatabaseName=testdb";
	String id = "hjh1";
	String pass = "1234";
	int total = 0;
	
	try {
		Connection conn = DriverManager.getConnection(url,id,pass);
		Statement stmt = conn.createStatement();

		String sqlCount = "SELECT COUNT(*) FROM board";
		ResultSet rs = stmt.executeQuery(sqlCount);
		
		if(rs.next()){
			total = rs.getInt(1);
		}
		rs.close();
		//out.print("총 게시물 : " + total + "개");
		
		String sqlList = "SELECT NUM, USERNAME, TITLE, READ_DATE, PWD, HIT from board order by NUM DESC";
		rs = stmt.executeQuery(sqlList);
		
%>
<table width="700" cellpadding="0" cellspacing="0" border="0" align="center">
  <tr height="5"><td width="5"></td></tr>
	   <td width="73" align="center" >번호</td>
	   <td width="379" align="center">제목</td>
	   <td width="73" align="center">작성자</td>
	   <td width="164" align="center">작성일</td>
	   <td width="58" >조회수</td>
  </tr>
  
 <%
	if(total==0) 
	{
%>
	<tr align="center" bgcolor="#FFFFFF" height="30">
	   <td colspan="6">등록된 글이 없습니다.</td>
	</tr>
<% 
	} else{
	while(rs.next()) {
		
		int idx = rs.getInt(1);
		String name = rs.getString(2);
		String title = rs.getString(3);
		String regdate = rs.getString(4);
		int hit = rs.getInt(5);
		
		//RegDate
		String Moon ="";
		if(regdate.length() > 9){
			 Moon= regdate.substring(0,10);	
		}
	
%>
  <tr height="25" align="center">
  	<td><%=idx %></td>
  	<td><%=title %></td>
  	<td><%=name %></td>
  	<td><%=Moon %></td>
  	<td><%=hit %></td>
  </tr>
  <tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>
<%
			}
	}
 	rs.close();
 	stmt.close();
 	conn.close();
}catch(SQLException e){
	out.println(e.toString() );
}
 %>
  <tr height="1" bgcolor="#82B5DF"><td colspan="6" width="752"></td></tr>
</table>
	 
<table width="100%" cellpadding="0" cellspacing="0" border="0">
   <tr><td colspan="4" height="5"></td></tr>
   <tr align="center">
   <td><input type=button value="글쓰기"></td>
  </tr>
</table>
</body>
</html>