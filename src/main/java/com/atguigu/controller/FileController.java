package com.atguigu.controller;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;


@Controller
public class FileController {

    @RequestMapping(value = "/updown",method = RequestMethod.GET)
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

    @RequestMapping("/down")
    public ResponseEntity<byte[]> download(HttpServletRequest request, @RequestParam("filename") String filename, Model model) throws Exception {
        String filepath = "E:\\File\\";
//        String path = request.getServletContext().getRealPath("/image/");
        // 得到文件的绝对路径
        File file = new File(filepath + "1.jpg");//File.separator + filename);
        HttpHeaders headers = new HttpHeaders();
        //下载显示的文件名，解决乱码问题
        String downloadFileName = new String(filename.getBytes("UTF-8"),"iso-8859-1");
        //让浏览器以attachment(附件)方式下载打开文件
        headers.setContentDispositionFormData("attachment",downloadFileName);
        //APPLICATION_OCTET_STREAM二进制流数据，是最常见的文件下载
        //MediaType代表的是Internet Media Type，即互联网媒体类型，也叫MIME类型。在Http协议消息头中，使用Content-Type来表示具体请求中的媒体类型信息
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        //FileUtils.readFileToByteArray(file)将源文件转化成二进制文件,然后构建成ResponseEntity对象返回客户端
        //HttpStatus类型代表的是Http协议中的状态
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),headers,HttpStatus.CREATED);
    }
}
