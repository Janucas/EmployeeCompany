<%@page import="java.sql.Date"%>
<%@page import="com.jacaranda.model.Employee"%>
<%@page import="com.jacaranda.repository.DbRepository"%>
<%@page import="com.jacaranda.model.Company"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Employee</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../style/style.css">
</head>

<%
ArrayList<Company> result = null;
try {
	result = (ArrayList<Company>) DbRepository.findAll(Company.class);
} catch (Exception e) {

}
%>

<body>
	<h3>Add Employee</h3>
	<form method="get">

		<div class="form-floating mb-3">
			<label for="fisrtName" class="form-label">First Name</label>
			<input type="text" class="form-control" id="fisrtName"
				name="fisrtName" placeholder="Introduce your First Name" required>
		</div>

		<div class="form-floating mb-3">
			<label for="lastName" class="form-label">Last Name</label>
			<input type="text" class="form-control" id="lastName" name="lastName"
				placeholder="Introduce your Last Name" required>
		</div>

		<div class="form-floating mb-3">
			<label for="email" class="form-label">Email</label> <input
				type="email" class="form-control" id="email" name="email"
				placeholder="Introduce your Email" required>
		</div>

		<div class="form-floating mb-3">
			<label for="gender" class="form-label">Gender(Male/Female)</label> <input
				type="text" class="form-control" id="gender" name="gender"
				placeholder="Introduce your Gender" required>
		</div>

		<div class="form-floating mb-3">
			<label for="dateOfBirth" class="form-label">Date of
				Birth</label> <input type="date" class="form-control" id="dateOfBirth"
				name="dateOfBirth" required>
		</div>

			<label for="companys" class="form-label">Company's</label> <select
				id="companys" name="companys" required>
				<%
				for (Company c : result) {
				%>
				<option><%=c.getName()%></option>
				<%
				}
				%>
			</select>
		</div>

		<div class="d-grid">
			<button class="btn btn-primary btn-lg" id="submitButton"
				type="submit" name="submit">Save</button>
		</div>
	</form>
	<%
	if (request.getParameter("submit") != null) {
		ArrayList<Employee> employes = (ArrayList<Employee>) DbRepository.findAll(Employee.class);
		DbRepository.addEntity(new Employee(employes.get(employes.size() + 1).getId() + 1,
				
		request.getParameter("fisrtName"), 
		request.getParameter("lastName"),
		request.getParameter("email"),
		request.getParameter("gender"),
		Date.valueOf(request.getParameter("dateOfBirth")),
		DbRepository.addCompany(request.getParameter("companys"))));
	}
	%>
	</div>
	</div>
	</div>
	</div>
	</div>
</body>
</html>