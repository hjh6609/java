<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*"%> 
<%
	//out.println("1111");

	request.setCharacterEncoding("euc-kr"); //�޾ƿ��� ������ �ѱ۷� ���ڵ�
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	String url = "jdbc:sqlserver://127.0.0.1:1433;DatabaseName=testdb";
	String id = "hjh1";
	String pass = "1234";

	
	String txtName = request.getParameter("txtName"); //write.jsp���� name�� �Է��� �����Ͱ�
	String Pwd = request.getParameter("Pwd");//write.jsp���� password�� �Է��� �����Ͱ�
	String txtTitle = request.getParameter("txtTitle"); //write.jsp���� title�� �Է��� �����Ͱ�
	String txtCon = request.getParameter("txtCon"); //write.jsp���� memo�� �Է��� �����Ͱ�
	int max = 0;
	
	try {	
		Connection conn = DriverManager.getConnection(url,id,pass);
		
		Statement stmt = conn.createStatement();
		String sql = "SELECT MAX(NUM) FROM board";
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			max=rs.getInt(1);
		}
		
		sql = "INSERT INTO board(USERNAME,TITLE,CONTENT,READ_DATE,PWD,HIT, REF) VALUES(?,?,?,GETDATE(),?,0,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, txtName);
		pstmt.setString(2, txtTitle);
		pstmt.setString(3, txtCon);
		pstmt.setString(4, Pwd);
		pstmt.setInt(5, max+1);
		
		out.println(pstmt);
		
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