package com.atguigu.controller;

import com.atguigu.bean.Employee;
import com.atguigu.bean.Msg;
import com.atguigu.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    /**
     *查询员工信息
     */
    @RequestMapping(value = "/select/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Msg selectEmp(@PathVariable("id") Integer id){
        Employee employee = employeeService.selectEmp(id);
        return Msg.success().add("emp",employee);
    }

    /**
     *修改单个员工信息
     */
    @RequestMapping(value = "/alter/{empId}",method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateEmp(Employee employee){
        employeeService.alterEmp(employee);
        return Msg.success();
    }

    /**
     *删除单个员工信息
     */
    @RequestMapping(value = "/emp/{id}",method = RequestMethod.DELETE)
    @ResponseBody
    public Msg delEmp(@PathVariable("id") Integer id){//从路径中取出id的值
        employeeService.delEmp(id);
        return Msg.success();
    }

    /**
     *获得分页对象
     */
    @RequestMapping("/emps")
    @ResponseBody//springmvc的@ResponseBody能自动将返回的对象转化为json字符串,需要引入jackson包的支持
    public Msg getEmpsWithJson(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){

        PageHelper.startPage(pn,5);
        List<Employee> emps = employeeService.getAll();
        PageInfo page = new PageInfo(emps,5);
        return Msg.success().add("pageInfo", page);
    }

    /**
     *添加员工信息
     */
    @RequestMapping(value = "/emps",method = RequestMethod.POST)
    @ResponseBody
    public Msg addEmp(@Valid Employee employee, BindingResult bindingResult){//用BindingResult封装校验结果
        Map<String,Object> map = new HashMap<>();
//        当校验有错误时,得到封装字段和封装的提示信息,然后添加到返回结果中
        if (bindingResult.hasErrors()){
//            得到所有的错误信息
            List<FieldError> errors = bindingResult.getFieldErrors();
//            遍历错误信息
            for (FieldError error :
                    errors) {
//                输出错误的字段
//                System.out.println("错误的字段名: "+error.getField());
//                输出错误的信息
//                System.out.println("错误的信息: "+error.getDefaultMessage());
//                将错误字段名和信息加到map中
                map.put(error.getField(),error.getDefaultMessage());
            }
            return Msg.fail().add("errorInfo",map);
        }else {
            employeeService.addEmp(employee);
            return Msg.success();
        }
    }

    /**
     *检查名字
     */
    @RequestMapping("/checkName")
    @ResponseBody
    public Msg checkName(@RequestParam("empName") String empName){//注解告诉springmvc明确取出请求路径中某元素name=empName的值
        boolean b = employeeService.checkName(empName);
        String regex = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})";
        if (!empName.matches(regex)){
            return Msg.fail().add("message","输入的名字不符合格式!!!");
        }
        if (b){
            return Msg.success();
        }else{
            return Msg.fail().add("message","请换一个用户名");
        }

    }
    /**
     *检查邮箱
     */


//    @RequestMapping("/emps")
    private String getEmps(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){
//        引入PagerHelper分页查询
//        查询前调用分页类的startPage()方法，并传入页码，和每页的大小
        PageHelper.startPage(pn,5);
        List<Employee> emps = employeeService.getAll();

//        用pageinfo包装查询结果，然后讲pageinfo提交给页面
//        pageinfo封装了分页信息（包括查询出的数据，传入连续 显示的页数）
        PageInfo page = new PageInfo(emps,5);
        model.addAttribute("pageInfo",page);
//        提到用page的得到导航页数
//        page.getNavigatepageNums();
        return "list";
    }
}
