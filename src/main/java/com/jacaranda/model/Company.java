package com.jacaranda.model;

import java.util.List;
import java.util.Objects;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name="company")
public class Company {
	@Id
	private int id;
	private String name;
	private String address;
	private String city;
	
	@OneToMany(mappedBy="company")
	private List<Employee> Employees;
	
	@OneToMany(mappedBy="company")
	private List<CompanyProject> companyProject;
	
	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}
	
	public List<Employee> getEmpleados(){
		return Employees;
	}


	@Override
	public int hashCode() {
		return Objects.hash(id);
	}
	
	public List<CompanyProject> getCompanyProject() {
        return companyProject;
    }


    public void setCompanyProject(List<CompanyProject> companyProject) {
        this.companyProject = companyProject;
    }


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Company other = (Company) obj;
		return id == other.id;
	}


	@Override
	public String toString() {
		return "Company [id=" + id + ", name=" + name + ", address=" + address + ", city=" + city + "]";
	}
	
	

}