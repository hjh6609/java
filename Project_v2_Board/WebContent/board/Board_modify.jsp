<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Board_modify</title>
</head>

<script>

	function modifyCheck()
	{
		//console.log(1111); 
	 	var form = document.modifyform;
	 
		 if( !form.Pwd.value )
		 {
			  alert( "��й�ȣ�� �����ּ���" );
			  form.Pwd.focus();
			  return;
		 }
		 
		if( !form.txtTitle.value )
		{
			  alert( "������ �����ּ���" );
			  form.txtTitle.focus();
			  return;
		}
		
		if( !form.Content.value )
		{
			  alert( "������ �����ּ���" );
			  form.Content.focus();
			  return;
		}  
			 form.submit();
	} 

</script>
<%
	request.setCharacterEncoding("euc-kr"); //�޾ƿ��� ������ �ѱ۷� ���ڵ�
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	String url = "jdbc:sqlserver://127.0.0.1:1433;DatabaseName=testdb";
	String id = "hjh1";
	String pass = "1234";
	
	String name = "";
	String password = "";
	String title = "";
	String content = "";
	int idx = Integer.parseInt(request.getParameter("idx"));
	
	try {
		
		Connection conn = DriverManager.getConnection(url,id,pass);
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT USERNAME, PWD, TITLE , CONTENT FROM board WHERE NUM=" + idx;
		ResultSet rs = stmt.executeQuery(sql);

		
		if(rs.next()){
			name = rs.getString(1);
			password = rs.getString(2);
			title = rs.getString(3);
			content = rs.getString(4);
		}
		
		rs.close();
		stmt.close();
		conn.close();

	}catch(SQLException e) {
		out.println( e.toString() );
	}
	 
%>
<body>
	<table align="center">
	<form name=modifyform method=post action="Board_modify_ok.jsp?idx=<%=idx%>">
		  <tr>
			   <td>
				    <table width="100%" cellpadding="0" cellspacing="0" border="0">
					     <tr>
						      <td align="center">����</td>
					     </tr>
				    </table>
				   <table>
					     <tr>
						      <td>&nbsp;</td>
						      <td align="center">����</td>
						      <td><input name="txtTitle" size="50" maxlength="100" value="<%=title %>"></td>
						      <td>&nbsp;</td>
					     </tr>
					     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
					     <tr>
						      <td>&nbsp;</td>
						      <td align="center">�̸�</td>
						      <td><%=name %></td>
						      <td>&nbsp;</td>
					     </tr>
					     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
					     <tr>
						      <td>&nbsp;</td>
						      <td align="center">��й�ȣ</td>
						      <td><input type="password"  name="Pwd" size="50" maxlength="50" value="<%=password%>"></td>
						      <td>&nbsp;</td>
					     </tr>
					     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
					     <tr>
						      <td>&nbsp;</td>
						      <td align="center">����</td>
						      <td><textarea name="Content" cols="50" rows="13"><%=content %></textarea></td>
						      <td>&nbsp;</td>
					     </tr>
					     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
					     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
					     <tr align="center">
					     	<td>&nbsp;</td>
					      	<td colspan="2"><input type=button value="����" OnClick="javascript:modifyCheck();">
					       	<input type=button value="���">
					      	<td>&nbsp;</td>
					     </tr>
			    </table>
			   </td>
		  </tr>
	 </form>
	 </table>
</body>
</html>