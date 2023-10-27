<%@page import="java.sql.Date"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.jacaranda.model.CompanyProject"%>
<%@page import="com.jacaranda.model.Employee"%>
<%@page import="com.jacaranda.model.Company"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.jacaranda.repository.DbRepository"%>
<%@page import="java.sql.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Añadir cine</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<%
//Intento ver si me ha puesto los datos para añadir un nuevo cine
	try{
		
		Employee e = new Employee(Integer.valueOf(request.getParameter("id")),request.getParameter("firstName"),request.getParameter("lastName"),request.getParameter("email"),request.getParameter("gender"),Date.parse(request.getParameter("dateOfBirth")));
		DbRepository.addEmployee(e);
	}catch(Exception e){
		//Dos posibibilidades que no me haya pasado o que haya fallado al añadir.
	}
%>
<form>
  <div class="form-group row">
    <label for="id" class="col-4 col-form-label">Id</label> 
    <div class="col-8">
      <input id="id" name="id" type="text" class="form-control">
    </div>
  </div>
  <div class="form-group row">
    <label for="firstName" class="col-4 col-form-label">firstName</label> 
    <div class="col-8">
      <input id="firstName" name="firstName" type="text" class="form-control">
    </div>
  </div>
  <div class="form-group row">
    <label for="lastName" class="col-4 col-form-label">lastName</label> 
    <div class="col-8">
      <input id="lastName" name="lastName" type="text" class="form-control">
    </div>
  </div> 
  <div class="form-group row">
    <label for="email" class="col-4 col-form-label">email</label> 
    <div class="col-8">
      <input id="email" name="email" type="text" class="form-control">
    </div>
  </div>
  <div class="form-group row">
    <label for="gender" class="col-4 col-form-label">gender</label> 
    <div class="col-8">
      <input id="gender" name="gender" type="text" class="form-control">
    </div>
  </div>
  <div class="form-group row">
    <label for="dateOfBirth" class="col-4 col-form-label">dateOfBirth</label> 
    <div class="col-8">
      <input id="dateOfBirth" name="dateOfBirth" type="text" class="form-control">
    </div>
  </div>
  <div class="form-group row">
    <div class="offset-4 col-8">
      <button name="submit" type="submit" class="btn btn-primary">Submit</button>
    </div>
  </div>
</form>
</body>
</html>