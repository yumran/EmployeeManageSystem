package com.ssh.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;

import com.ssh.model.Employee;
import com.ssh.service.DepartmentService;
import com.ssh.service.EmployeeService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

@SuppressWarnings("serial")
public class EmployeeAction extends ActionSupport implements RequestAware,ModelDriven<Employee>,Preparable {
	
	private EmployeeService employeeService;
	private DepartmentService departmentService;
	private Integer Id;
	private InputStream inputStream;

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setId(Integer Id) {
		this.Id = Id;
	}

	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}
	
	public String save() {
		/**
		 * 添加员工
		 */
		model.setCreateTime(new Date());
		employeeService.saveOrUpdate(model);
		return "success";
	}
	public void prepareSave() {
		model = new Employee();
	}
	
	
	public String delete() {
		
		/*普通删除
		employyService。delete(Id);
		return "success";*/
		
		try {
			employeeService.delete(Id);
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		} catch (Exception e) {
			e.printStackTrace();
			try {
				inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
			} catch (UnsupportedEncodingException e1) {
				e1.printStackTrace();
			}
		}
		return "delete";
	}

	public String list() {
		request.put("employees", employeeService.getAll());
		return "list";
	}
	
	public String input() {
		request.put("departments", departmentService.getAll());
		return "input";
	}
	
	private Map<String, Object> request;

	@Override
	public void setRequest(Map<String, Object> arg0) {
		this.request = arg0;
	}

	@Override
	public void prepare() throws Exception {}
	
	private Employee model;
	
	@Override
	public Employee getModel() {
		return model;
	}
}
