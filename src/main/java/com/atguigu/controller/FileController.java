package com.atguigu.controller;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;


@Controller
public class FileController {

    @RequestMapping(value = "/upload",method = RequestMethod.GET)
    public String showUpload(){
        return "file";
    }

    @RequestMapping(value = "/uploadFile",method = RequestMethod.POST)
    public String uploadFile(@RequestParam("file") MultipartFile file) throws IOException {//使用@RequestParam注解将表单中name=file的元素与
                                                        // @RequestParam("file")中的指进行绑定，并转化为MultipartFile类型
        if (!file.isEmpty()){
            System.out.println(file.getOriginalFilename());//打印本地文件的名字
            //通过FileUtils的方法将文件拷贝,第一个参数为拷贝文件的源的流，第二个参数为文件输出的位置(可以是一个服务器的本地地址)
            FileUtils.copyInputStreamToFile(file.getInputStream(),
                    //第一个参数为根目录，第二个参数为文件名(时间戳加原文件名)
                    new File("E:\\File\\",System.currentTimeMillis()+file.getOriginalFilename()));
        }
        return "success";
    }
}
