<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%
 	int idx = Integer.parseInt(request.getParameter("idx"));
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	String url = "jdbc:sqlserver://127.0.0.1:1433;DatabaseName=testdb";
	String id = "hjh1";
	String pass = "1234";
	String txtTitle = "";
	
	try {
		
			Connection conn = DriverManager.getConnection(url,id,pass);
			Statement stmt = conn.createStatement();
	
			
			String sql = "SELECT TITLE FROM board WHERE NUM=" + idx;
			ResultSet rs = stmt.executeQuery(sql);
	
	 		if(rs.next()){
	 			txtTitle = rs.getString(1);
	 		}
				
		rs.close();
		stmt.close();
		conn.close();
	 	
	} catch(SQLException e) {
	
	}
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Board_Reply</title>
</head>

<script>
	function replyCheck()
	{
		var form = document.replyform;
		 
		if( !form.txtName.value )   // form 에 있는 name 값이 없을 때
		{
			  alert( "이름을 적어주세요" ); // 경고창 띄움
			  form.txtName.focus();   // form 에 있는 name 위치로 이동
			  return;
		}
		 
		if( !form.Pwd.value )
		{
			  alert( "비밀번호를 적어주세요" );
			  form.Pwd.focus();
			  return;
		}
		 
		if( !form.txtTitle.value )
		{
			  alert( "제목을 적어주세요" );
			  form.txtTitle.focus();
			  return;
		}
		
		if( !form.Content.value )
		{
			  alert( "내용을 적어주세요" );
			  form.Content.focus();
			  return;
		}
	
	form.submit();
	} 
</script>

<body>
	<table align="center">
	<form name=replyform method=post action="Board_reply_ok.jsp?idx=<%=idx%>">
	  <tr>
		   <td>
			    <table width="100%" cellpadding="0" cellspacing="0" border="0">
				     <tr>
					      <td align="center">답글</td>
				     </tr>
			    </table>
			    <table>
				    <tr>
					      <td>&nbsp;</td>
					      <td align="center">제목</td>
					      <td><input type="text" name="txtTitle" size="50" maxlength="100" value="<%=txtTitle%>"></td>
					      <td>&nbsp;</td>
				    </tr>
				    <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
				    <tr>
					      <td>&nbsp;</td>
					      <td align="center">이름</td>
					      <td><input type="text" name="txtName" size="50" maxlength="50"></td>
					      <td>&nbsp;</td>
				    </tr>
				      <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
				    <tr>
					      <td>&nbsp;</td>
					      <td align="center">비밀번호</td>
					      <td><input type="password" name="Pwd" size="50" maxlength="50"></td>
					      <td>&nbsp;</td>
				    </tr>
				    <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
				    <tr>
					      <td>&nbsp;</td>
					      <td align="center">내용</td>
					      <td><textarea name="Content" cols="50" rows="13"></textarea></td>
					      <td>&nbsp;</td>
				    </tr>
				    <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
				    <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
				    <tr align="center" height="50">
				      	<td>&nbsp;</td>
				       	<td colspan="2"><input type=button value="등록"  OnClick="javascript:replyCheck();">
				       	<input type=button value="취소"  OnClick="javascript:history.back(-1)">
				       	<td>&nbsp;</td>
				    </tr>
			    </table>
		   </td>
	  </tr>
	  </form>
	 </table>
</body>
</html>