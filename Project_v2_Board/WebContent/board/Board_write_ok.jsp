<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*"%> 
<%
	//out.println("1111");

	request.setCharacterEncoding("UTF-8"); //�޾ƿ��� ������ �ѱ۷� ���ڵ��մϴ�.
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	String url = "jdbc:sqlserver://127.0.0.1:1433;DatabaseName=testdb";
	String id = "hjh1";
	String pass = "1234";

	
	String txtName = request.getParameter("txtName"); //write.jsp���� name�� �Է��� �����Ͱ�
	String Pwd = request.getParameter("Pwd");//write.jsp���� password�� �Է��� �����Ͱ�
	String txtTitle = request.getParameter("txtTitle"); //write.jsp���� title�� �Է��� �����Ͱ�
	String txtCon = request.getParameter("txtCon"); //write.jsp���� memo�� �Է��� �����Ͱ�
	
	try {	
		Connection conn = DriverManager.getConnection(url,id,pass);
		
		String sql = "INSERT INTO board(USERNAME,PWD,TITLE,CONTENT) VALUES(?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, txtName);
		pstmt.setString(2, Pwd);
		pstmt.setString(3, txtTitle);
		pstmt.setString(4, txtCon);
		
		pstmt.execute();
		pstmt.close();
		
		conn.close();
} catch(SQLException e) {
	out.println( e.toString() );
	} 

%>
 
<script>
   self.window.alert("�Է��� ���� �����Ͽ����ϴ�.");
   location.href="Board_List.jsp"; 
</script>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>