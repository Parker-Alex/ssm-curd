package com.atguigu.test;

import com.atguigu.bean.Employee;
import com.github.pagehelper.PageInfo;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext.xml","file:D:\\masterSpring\\code\\ssm-crud\\src\\main\\webapp\\WEB-INF\\dispatcherServlet-servlet.xml"})
public class MvcTest {

//    传入springmvc的ioc，需要@WebAppConfigurationv注解才能@Autowiredioc本身，否则只能@Autowired ioc容器里面的
    @Autowired
    private WebApplicationContext context;
//    虚拟的mvc请求，获取处理结果
    private MockMvc mockMvc;

    @Before//是junit中的Before注解,每次用时都会初始化
    public void inintMockMvc(){
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void testPage() throws Exception{
//        模拟请求拿到返回值
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn","5")).andReturn();

//    请求成功后，从请求域中取出pageInfo进行验证
        MockHttpServletRequest request = result.getRequest();
        PageInfo pi = (PageInfo) request.getAttribute("pageInfo");
        System.out.println("当前页码 "+pi.getPageNum());
        System.out.println("总页码 "+pi.getPages());
        System.out.println("总记录 "+pi.getTotal());
        System.out.println("在页面连续显示的页码");
        int[] nums = pi.getNavigatepageNums();
        for (int i : nums) {
            System.out.print(" " + i);
        }

//        获取员工的数据
        List<Employee> list = pi.getList();
        for (Employee employee :
                list) {
            System.out.println("ID "+employee.getEmpId()+"==>Name:"+employee.getEmpName());
        }
    }


}
