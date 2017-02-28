<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Board_Delete</title>
</head>

<script>
	function deleteCheck()
	{
		 var form = document.deleteform;
	 
		 if( !form.Pwd.value )
		 {
			  alert( "비밀번호를 적어주세요" );
			  form.Pwd.focus();
			  return;
		 }
			form.submit();
	}
</script>

<%
	int idx = Integer.parseInt(request.getParameter("idx"));
%>

<body>
	<table align="center">
	<form name=deleteform method=post action="Board_delete_ok.jsp?idx=<%=idx%>">
	  <tr>
		   <td>
			    <table width="100%" cellpadding="0" cellspacing="0" border="0">
					 <tr align="center">
					      <td>삭제</td>
				     </tr>
			    </table>
			   <table>
				     <tr>
					      <td>&nbsp;</td>
					      <td align="center">비밀번호</td>
					      <td><input  type="password" name="Pwd"  size="50" maxlength="100"></td>
					      <td>&nbsp;</td>
				     </tr>
					 <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
					 <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
					 <tr align="center">
					      <td>&nbsp;</td>
					      <td colspan="2"><input type=button value="삭제"  OnClick="javascript:deleteCheck();">
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