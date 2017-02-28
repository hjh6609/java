<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>  
<%
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		String url = "jdbc:sqlserver://127.0.0.1:1433;DatabaseName=testdb";
		String id = "hjh1";
		String pass = "1234";
		String password ="";
	
		try{
			request.setCharacterEncoding("euc-kr");
			int idx = Integer.parseInt(request.getParameter("idx"));
			String title = request.getParameter("txtTitle");
			String content = request.getParameter("Content");
			String passw = request.getParameter("Pwd");
		
			Connection conn = DriverManager.getConnection(url,id,pass);
			Statement stmt = conn.createStatement();
		
			String sql = "SELECT PWD FROM board WHERE NUM=" + idx;
			ResultSet rs = stmt.executeQuery(sql);
		
		 if(rs.next()){
				password = rs.getString(1);
		 }
		
		 if(password.equals(passw)) {
				sql = "UPDATE board SET TITLE='" + title+ "' ,CONTENT='"+ content +"' WHERE NUM=" + idx;				
				stmt.executeUpdate(sql);
				
%>
				  <script language=javascript>
				  	self.window.alert("글이 수정되었습니다.");
				  	location.href="Board_view.jsp?idx=<%=idx%>";
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