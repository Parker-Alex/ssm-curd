package com.atguigu.bean;

import java.util.HashMap;
import java.util.Map;

/**
 *返回json数据的类
 */

public class Msg {

    private int code;//状态码，表示成功或者失败
    private String msg;//状态码对应的相关信息
    private Map<String, Object> extend = new HashMap<String, Object>();//返回的数据

    //    成功方法
    public static Msg success(){
        Msg result = new Msg();
        result.setCode(100);
        result.setMsg("成功!!!");
        return result;
    }

    //    成功方法
    public static Msg fail(){
        Msg result = new Msg();
        result.setCode(200);
        result.setMsg("失败!!!");
        return result;
    }

    public Msg add(String key, Object value){
        this.getExtend().put(key, value);
        return this;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }
}
