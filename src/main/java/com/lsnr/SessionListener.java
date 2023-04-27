package com.lsnr;

import com.pojo.User;
import com.utils.SessionContext;
import com.utils.SessionUtils;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.util.Map;

public class SessionListener implements HttpSessionListener {

    @Override
    public void sessionCreated(HttpSessionEvent httpSessionEvent) {
        SessionContext.addSession(httpSessionEvent.getSession());
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent httpSessionEvent) {
        SessionContext.delSession(httpSessionEvent.getSession());
    }
}
