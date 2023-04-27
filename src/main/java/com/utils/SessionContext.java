package com.utils;

import com.controller.UserController;
import com.pojo.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class SessionContext {
    protected static Logger logger = LoggerFactory.getLogger(SessionContext.class);
    public static Map<String,HttpSession> SESSION_MAP = new ConcurrentHashMap();
    public static synchronized void addSession(HttpSession session) {
        if (session != null) {
            SESSION_MAP.put(session.getId(), session);
        }
    }
    public static synchronized void delSession(HttpSession session) {
        if (session != null) {
            SESSION_MAP.remove(session.getId());
        }
    }
    public static synchronized HttpSession getSession(String session_id) {
        if (session_id == null)
            return null;
        return (HttpSession) SESSION_MAP.get(session_id);
    }

    public static void plLoginUsersInfo(){
        Map<String, HttpSession> smap = SessionContext.SESSION_MAP;
        for (Map.Entry<String, HttpSession> entry : smap.entrySet()) {
            String sessionId = entry.getKey();
            HttpSession httpSession = entry.getValue();
            User user = (User)httpSession.getAttribute("UserInfo");
            if(user!=null){
                logger.info("SessionId = " + sessionId + ", Username = " + user.getUsername()) ;
            }
        }
    }

    public static int getAU(String username){
        int au = 0;
        Map<String, HttpSession> smap = SessionContext.SESSION_MAP;
        for (Map.Entry<String, HttpSession> entry : smap.entrySet()) {
            HttpSession httpSession = entry.getValue();
            User user = (User)httpSession.getAttribute("UserInfo");
            if(user!=null&&username.equals(user.getUsername())){
                au++;
            }
        }
        return au;
    }

    public static void killOldestSession(String username){
        HttpSession session = null;
        Map<String, HttpSession> smap = SessionContext.SESSION_MAP;
        for (Map.Entry<String, HttpSession> entry : smap.entrySet()) {
            HttpSession httpSession = entry.getValue();
            User user = (User)httpSession.getAttribute("UserInfo");
            if(user!=null&&username.equals(user.getUsername())){
                if(session==null){
                    session = httpSession;
                }else{
                    Date d1 = ((User)session.getAttribute("UserInfo")).getLoginDate();
                    Date d2 = user.getLoginDate();
                    if(d2.getTime()<d1.getTime()){
                        session = httpSession;
                    }
                }
            }
        }
        session.setAttribute("UserInfo",null);
        session.setAttribute("LoginInfo","UserKickedOut");
    }
}
