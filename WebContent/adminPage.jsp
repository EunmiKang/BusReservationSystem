<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title> ������ ������ </title>
	<link type="text/css" rel="stylesheet" href="adminPage.css"/>
</head>
<body>
	<form >
		<table id="addTable">
			<tr>
				<td class="left">�����</td>
				<td>
					<input type="text" class="right" name="departure"/>
				</td>
				
				<td class="left">������</td>
				<td>
					<input type="text" class="right" name="arrival"/>
				</td>
				
				<td class="left">��߽ð�</td>
				<td>
					<input type="text" class="right" name="departureTime"/>
				</td>
				
				<td class="left">�ҿ�ð�</td>
				<td>
					<input type="text" class="right" name="requiredTime"/>
				</td>
				
				<td class="left">�������</td>
				<td>
					<input type="text" class="right" name="busClass"/>
				</td>
				
				<td class="left">����</td>
				<td>
					<input type="text" class="right" name="price"/>
				</td>
				
				<td>
					<input type="submit" value="���"/>
				</td>
			</tr>
		</table>
	</form>
	
	<table id="scheduleTable">
		<tr>
			<th>�����</th>
			<th>������</th>
			<th>��߽ð�</th>
			<th>�ҿ�ð�</th>
			<th>�������</th>
			<th>����</th>
		</tr>
	</table>
</body>
</html>