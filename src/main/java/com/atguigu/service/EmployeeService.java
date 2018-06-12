package com.atguigu.service;

import com.atguigu.bean.Employee;
import com.atguigu.bean.EmployeeExample;
import com.atguigu.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service//标注为事务逻辑组件
public class EmployeeService {

    @Autowired
    private EmployeeMapper employeeMapper;

    public List<Employee> getAll(){
        return employeeMapper.selectByExampleWithDept(null);
    }

    public void addEmp(Employee employee){
        employeeMapper.insertSelective(employee);
    }

    public boolean checkName(String empName) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        long count = employeeMapper.countByExample(example);
        return count == 0;//等于0表示无该名字,名字可用
    }

    public boolean checkEmail(String empEmail) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpNameEqualTo(empEmail);
        long count = employeeMapper.countByExample(example);
        return count == 0;//等于0表示无该名字,名字可用
    }

    public void delEmp(Integer id){
        employeeMapper.deleteByPrimaryKey(id);
    }

    public void alterEmp(Employee employee){
        employeeMapper.updateByPrimaryKeySelective(employee);
    }

    public Employee selectEmp(Integer id) {
        Employee employee = employeeMapper.selectByPrimaryKey(id);
        return employee;
    }
}
