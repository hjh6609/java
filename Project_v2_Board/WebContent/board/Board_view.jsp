<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Board_View</title>
</head>
<body>
	<br /><br />
	<%
		request.setCharacterEncoding("euc-kr"); //받아오는 값들을 한글로 인코딩
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		String url = "jdbc:sqlserver://127.0.0.1:1433;DatabaseName=testdb";
		String id = "hjh1";
		String pass = "1234";
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		try {
			Connection conn = DriverManager.getConnection(url,id,pass);
			Statement stmt = conn.createStatement();
			
			String sql = "SELECT NUM, HIT, USERNAME, READ_DATE, TITLE, CONTENT FROM board WHERE NUM=" + idx;
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next()){
				int hit = rs.getInt(2);
				String name = rs.getString(3);
				String regdate = rs.getString(4);
				String title = rs.getString(5);
				String content = rs.getString(6);
				hit++;
				
				//RegDate
				//String Moon ="";
				//if(regdate.length() > 9){
				//	 Moon= regdate.substring(0,10);	
				//}
			
			//rs.close();
	%>
	<table align="center">
	  <tr>
		   <td>
		    <table width="100%" cellpadding="0" cellspacing="0" border="0">
		      	<tr>
		      		<td align="center">내 용</td>
		      	</tr>
		     </tr>
		    </table>
		   <table width="413">
			    <tr>
				      <td width="0">&nbsp;</td>
				      <td align="center" width="76">글번호</td>
				      <td width="319"><%=idx%></td>
				      <td width="0">&nbsp;</td>
			     </tr>
				<tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
			    <tr>
				      <td width="0">&nbsp;</td>
				      <td align="center" width="76">조회수</td>
				      <td width="319"><%=hit %></td>
				      <td width="0">&nbsp;</td>
			    </tr>
				<tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
			    <tr>
				      <td width="0">&nbsp;</td>
				      <td align="center" width="76">이름</td>
				      <td width="319"><%=name %></td>
				      <td width="0">&nbsp;</td>
			    </tr>
			    <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
			    <tr>
				      <td width="0">&nbsp;</td>
				      <td align="center" width="76">작성일</td>
				      <td width="319"><%=regdate %></td>
				      <td width="0">&nbsp;</td>
			    </tr>
			    <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
			    <tr>
			      <td width="0">&nbsp;</td>
			      <td align="center" width="76">제목</td>
			      <td width="319"><%= title %></td>
			      <td width="0">&nbsp;</td>
			    </tr>
			    <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
			    <tr>
			      <td width="0">&nbsp;</td>
			      <td width="399" colspan="2" height="200"><%=content %></td>
			    </tr>
			    <% 
					 	sql = "UPDATE board SET HIT=" + hit + " where NUM=" +idx;
					 	stmt.executeUpdate(sql);
					 	rs.close();
					 	stmt.close();
					 	conn.close();
						 	} 
						}catch(SQLException e) {
					}
					
				%>
			    <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
			    <tr height="1" bgcolor="#82B5DF"><td colspan="4" width="407"></td></tr>
			    <tr align="center" height="50">
			    	<td width="0">&nbsp;</td>
			      	<td colspan="2" width="399"><input type=button value="글쓰기" OnClick="window.location='Board_write.jsp'">
					<input type=button value="답글" OnClick="window.location='Board_reply.jsp?idx=<%=idx%>'">
					<input type=button value="목록" OnClick="window.location='Board_List.jsp'">
					<input type=button value="수정" OnClick="window.location='Board_modify.jsp?idx=<%=idx%>'">
					<input type=button value="삭제" OnClick="window.location='Board_Delete.jsp?idx=<%=idx%>'">
			      	<td width="0">&nbsp;</td>
			    </tr>
		    </table>
		   </td>
	  </tr>
	</table>
</body>
</html>