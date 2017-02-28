<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("euc-kr"); //받아오는 값들을 한글로 인코딩
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	String url = "jdbc:sqlserver://127.0.0.1:1433;DatabaseName=testdb";
	String id = "hjh1";
	String pass = "1234";
	String Pwd = null;
	int idx = Integer.parseInt(request.getParameter("idx"));
	String passw = request.getParameter("Pwd");
	
	out.print(idx);
	
	try{
				
		Connection conn = DriverManager.getConnection(url,id,pass);
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT PWD FROM board WHERE NUM=" + idx;
		ResultSet rs = stmt.executeQuery(sql);
		
		 if(rs.next()){
				Pwd = rs.getString(1);
		 }
		 
		 if(Pwd.equals(passw)) {
			   			
			sql = "DELETE FROM board WHERE NUM=" + idx;	
			stmt.executeUpdate(sql);	 
%>
  			<script language=javascript>
   				self.window.alert("해당 글을 삭제하였습니다.");
   				location.href="Board_List.jsp";
  			</script>

<%
		rs.close();
		stmt.close();
		conn.close();
		
		 } else { 
%>
			<script language=javascript>
			 self.window.alert("비밀번호를 틀렸습니다.");
				location.href="javascript:history.back()";
			</script>
<%		
		 }
 	} catch(SQLException e) {
		out.println( e.toString() );
	} 
%>