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
   
	   if( !form.txtName.value )   // form �� �ִ� name ���� ���� ��
	   {
	   	 	alert( "�̸��� �����ּ���" ); // ���â ���
	    	form.txtName.focus();   // form �� �ִ� name ��ġ�� �̵�
	    	return;
	   }
	   
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
	 
	  if( !form.txtCon.value )
	   {
	    	alert( "������ �����ּ���" );
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
      <td align="center">�۾���</td>
      </tr>
    </table>
   
   <table>
     <tr>
	      <td>&nbsp;</td>
	      <td align="center">����</td>
	      <td><input type="txt" name="txtTitle" size="50" maxlength="100"></td>
	      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr>
	      <td>&nbsp;</td>
	      <td align="center">�̸�</td>
	      <td><input type="txt" name="txtName" size="50" maxlength="50"></td>
	      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr>
	      <td>&nbsp;</td>
	      <td align="center">��й�ȣ</td>
	      <td><input type="password" name="Pwd" size="50" maxlength="50"></td>
	      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr>
	      <td>&nbsp;</td>
	      <td align="center">����</td>
	      <td><textarea name="txtCon" cols="50" rows="13"></textarea></td>
	      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
     <tr align="center">
	      <td height="50">&nbsp;</td>
	      <td colspan="2">
		      <input type=button  value="���" OnClick="javascript:writeCheck(); ">
		      <input type=button value="���" OnClick="javascript:history.back(-1)">
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