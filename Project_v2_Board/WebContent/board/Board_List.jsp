<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*, java.text.*"  %>
<%@ page import="java.sql.*,java.text.SimpleDateFormat,java.util.Date"%>

<%
	final int ROWSIZE = 4;
	final int BLOCK = 5;

	int pg = 1;
	
	if(request.getParameter("pg")!=null) {
		pg = Integer.parseInt(request.getParameter("pg"));
	}
	
	int start = (pg*ROWSIZE) - (ROWSIZE-1);
	int end = (pg*ROWSIZE);
	
	int allPage = 0;
	
	int startPage = ((pg-1)/BLOCK*BLOCK)+1;
	int endPage = ((pg-1)/BLOCK*BLOCK)+BLOCK;

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Board List</title>
</head>
<body>
<br /><br /><br /><br />
<%
	request.setCharacterEncoding("euc-kr"); //받아오는 값들을 한글로 인코딩	
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	String url = "jdbc:sqlserver://127.0.0.1:1433;DatabaseName=testdb";
	String id = "hjh1";
	String pass = "1234";
	int total = 0;
	
	try {
		Connection conn = DriverManager.getConnection(url,id,pass);
		Statement stmt = conn.createStatement();
		Statement stmt1 = conn.createStatement();
		String sql = "";

		String sqlCount = "SELECT COUNT(*) FROM board";
		ResultSet rs = stmt.executeQuery(sqlCount);
		
		if(rs.next()){
			total = rs.getInt(1);
		}
		
		int sort=1;
		String sqlSort = "SELECT NUM FROM board ORDER BY ref desc, step asc";
		rs = stmt.executeQuery(sqlSort);
		
		while(rs.next()){
			int stepNum = rs.getInt(1);
			sql = "UPDATE board SET STEP=" + sort + " WHERE NUM=" +stepNum;
		 	stmt1.executeUpdate(sql);
		 	sort++;
		}
		
		allPage = (int)Math.ceil(total/(double)ROWSIZE);
		
		if(endPage > allPage) {
			endPage = allPage;
		}
		
		//out.print("총 게시물 : " + total + "개");
		
		String sqlList = "SELECT NUM, USERNAME, TITLE, READ_DATE, HIT, INDENT FROM board WHERE STEP >="+start + " AND STEP <= "+ end +" ORDER BY step asc";
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
		
		int stepNum = rs.getInt(1);
		sql = "UPDATE board SET STEP=" + sort + " WHERE NUM=" +stepNum;
	 	stmt1.executeUpdate(sql);
	 	sort++;
		
		int idx = rs.getInt(1);
		String name = rs.getString(2);
		String title = rs.getString(3);
		String regdate = rs.getString(4);
		int hit = rs.getInt(5);
		int indent = rs.getInt(6);
				
		//RegDate
		String yea = "";
		String year ="";
		if ( regdate == null)
		{
			//java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
		 	//String today = formatter.format(new java.util.Date());
			//Date = today.substring(0,8);
			Date date = new Date();
			SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd"); 
			year = (String)simpleDate.format(date);
			yea = year.substring(0,10);
			
		}else{
			yea= regdate.substring(0,10) ;
		}
		
%>
  <tr height="25" align="center">
	  	<td><%=idx %></td>
	  	<td>
	  		<% 
				for(int j=0;j<indent;j++){
			%>		&nbsp;&nbsp;&nbsp;<%
				}
				if(indent!=0){
			%>		
				<img src='img/reply_icon.gif' />
			<%
				}
			%> 
			<a href="Board_view.jsp?idx=<%=idx%>"><%=title %>
			<%
				if(year.equals(yea)){
			%>
				<img src='img/new.jpg' />
			<%
				}
			%>
	  	</td>
	  	<td><%=name %></td>
	  	<td><%=yea %></td>
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
   <tr>
		<td align="center">
			<%
				if(pg>BLOCK) {
			%>
				[<a href="Board_List.jsp?pg=1">◀◀</a>]
				[<a href="Board_List.jsp?pg=<%=startPage-1%>">◀</a>]
			<%
				}
			%>
			
			<%
				for(int i=startPage; i<= endPage; i++){
					if(i==pg){
			%>
						<u><b>[<%=i %>]</b></u>
			<%
					}else{
			%>
						[<a href="Board_List.jsp?pg=<%=i %>"><%=i %></a>]
			<%
					}
				}
			%>
			
			<%
				if(endPage<allPage){
			%>
				[<a href="Board_List.jsp?pg=<%=endPage+1%>">▶</a>]
				[<a href="Board_List.jsp?pg=<%=allPage%>">▶▶</a>]
			<%
				}
			%>
		</td>
	</tr>
   <tr align="center">
   <td><a href="Board_write.jsp"><input type=button value="글쓰기"></a></td>
  </tr>
</table>
</body>
</html>