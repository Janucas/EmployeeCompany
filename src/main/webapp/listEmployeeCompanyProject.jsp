<%@page import="com.jacaranda.model.CompanyProject"%>
<%@page import="com.jacaranda.model.Employee"%>
<%@page import="com.jacaranda.model.Company"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.jacaranda.repository.DbRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Employee Company Project</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
	<body>
		<%
		ArrayList<Company> result = null;
		try {
			result = (ArrayList<Company>) DbRepository.findAll(Company.class);
		} catch (Exception e) {
	
		}
		%>
	
	
	
		<table class="table">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Employee´s number</th>
					<th scope="col">Projects´ number</th>
	
				</tr>
			</thead>
			<%
			for (Company c : result) {
			%>
			<tr>
				<td><%=c.getName()%></td>
				<td><%=c.getEmpleados().size()%></td>
				<td><%=c.getCompanyProject().size()%></td>
			</tr>
			<thead>
				<tr>
					<th scope="col">Id</th>
					<th scope="col">Name</th>
					<th scope="col">Surname</th>
					<th scope="col">Email</th>
					<th scope="col">Gender</th>
					<th scope="col">Date of Birth</th>
	
				</tr>
			</thead>
			<%
			for (Employee e : c.getEmpleados()) {
			%>
			<tr>
				<td><%=e.getId()%></td>
				<td><%=e.getFirstName()%></td>
				<td><%=e.getLastName()%></td>
				<td><%=e.getEmail()%></td>
				<td><%=e.getGender()%></td>
				<td><%=e.getDateOfBirth()%></td>
				<td><%=e.getCompany().getName()%></td>
			</tr>
			<tr>
				<td colspan="100%"></td>
	
			</tr>
			<%
			}
			%>
			<thead>
				<tr>
					<th scope="col">Id</th>
					<th scope="col">Name</th>
					<th scope="col">Budget</th>
				</tr>
			</thead>
	
			<%
			for (CompanyProject cp : c.getCompanyProject()) {
			%>
			<tr>
				<td><%=cp.getIdProject().getId()%></td>
				<td><%=cp.getIdProject().getName()%></td>
				<td><%=cp.getIdProject().getButget()%></td>
			</tr>
	
	
	
			<%
			}
			%>
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Employee´s number</th>
					<th scope="col">Projects´ number</th>
				</tr>
			</thead>
			<%
			}
			%>
		</table>
	</body>
</html>