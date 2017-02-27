<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Board_Write</title>
<script>
 function writeCheck()
 {
	console.log(111);	

  	   var form = document.writeform;
   
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
	 
	  if( !form.txtCon.value )
	   {
	    	alert( "내용을 적어주세요" );
	    	form.txtCon.focus();
	    	return;
	   }
	 
	  	//form.submit();
  }
</script>
</head>
<body>
<br /><br /><br />
<table align="center">
<form name=writeform method=post action="Board_write_ok.jsp">
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
      <td align="center">글쓰기</td>
      </tr>
    </table>
   
   <table>
     <tr>
	      <td>&nbsp;</td>
	      <td align="center">제목</td>
	      <td><input type="txt" name="txtTitle" size="50" maxlength="100"></td>
	      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr>
	      <td>&nbsp;</td>
	      <td align="center">이름</td>
	      <td><input type="txt" name="txtName" size="50" maxlength="50"></td>
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
	      <td><textarea name="txtCon" cols="50" rows="13"></textarea></td>
	      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
     <tr align="center">
	      <td height="50">&nbsp;</td>
	      <td colspan="2">
		      <input type=button  value="등록" OnClick="javascript:writeCheck(); ">
		      <input type=button value="취소" OnClick="javascript:history.back(-1)">
	      </td>
      	  <td>&nbsp;</td>
     </tr>
     </form>
    </table>
   </td>
  </tr>
 </table>
</body>
</html>