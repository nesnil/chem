package com.utils;

import com.pojo.User;
import eu.bitwalker.useragentutils.UserAgent;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

public class SessionUtils {
    public static ServletContext getServletContext(){
        ServletRequestAttributes attrs = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attrs.getRequest();
        ServletContext sc = request.getServletContext();
        return sc;
    }
    public static ApplicationContext getApplication(){
        ServletRequestAttributes attrs = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attrs.getRequest();
        ApplicationContext ac =  WebApplicationContextUtils.getWebApplicationContext(request.getServletContext());
        return ac;
    }
    public static HttpSession getSession(){
        //获取到ServletRequestAttributes 里面有
        ServletRequestAttributes attrs = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        //获取到Request对象
        HttpServletRequest request = attrs.getRequest();
        //获取到Session对象
        HttpSession session = request.getSession();
        //获取到Response对象
        //HttpServletResponse response = attrs.getResponse();
        return session;
    }
    public static HttpServletRequest getRequest (){
        //获取到ServletRequestAttributes 里面有
        ServletRequestAttributes attrs = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        //获取到Request对象
        HttpServletRequest request = attrs.getRequest();
        return request;
    }
    public static void setAttr(String key,Object val){
        getSession().setAttribute(key,val);
    }
    public static void removeAttr(String key){
        getSession().removeAttribute(key);
    }
    public static Object getAttr(String key){
        return getSession().getAttribute(key);
    }

    public static String getIp(){
        return getRequest().getRemoteAddr();
    }
    public static String getUserAgentInfo(){
        return getRequest().getHeader("User-Agent");
    }
    public static String getBrower(){
        UserAgent userAgent = UserAgent.parseUserAgentString(getRequest().getHeader("User-Agent"));
        return userAgent.getBrowser().getName();
    }
    public static String getOS(){
        UserAgent userAgent = UserAgent.parseUserAgentString(getRequest().getHeader("User-Agent"));
        return userAgent.getOperatingSystem().getName();
    }

    public static void setCtxAttr(String key,Object val){
        getServletContext().setAttribute(key,val);
    }
    public static void removeCtxAttr(String key){
        getServletContext().removeAttribute(key);
    }
    public static Object getCtxAttr(String key){
        return getServletContext().getAttribute(key);
    }

    public static String getSessionId(){
        return getSession().getId();
    }

}
