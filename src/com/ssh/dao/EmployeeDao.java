package com.ssh.dao;

import java.util.List;

import com.ssh.model.Employee;

public class EmployeeDao extends BaseDao{
	
	@SuppressWarnings("unchecked")
	public List<Employee> getAll(){
		String hql = "FROM Employee e LEFT OUTER JOIN FETCH e.department";
		//String hql = "from Employee";
		return getSession().createQuery(hql).list();	
	}
	
	public void delete(Integer Id) {
		String hql = "Delete FROM Employee e WHERE e.id = ?";
		getSession().createQuery(hql).setInteger(0, Id).executeUpdate();
	}
	
	public void saveOrUpadte(Employee employee) {
		getSession().saveOrUpdate(employee);
	}
	
}
