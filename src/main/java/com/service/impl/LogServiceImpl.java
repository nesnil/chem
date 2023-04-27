package com.service.impl;

import com.dao.LogDao;
import com.dao.UserDao;
import com.pojo.Log;
import com.pojo.User;
import com.service.LogService;
import com.service.UserService;
import com.utils.SessionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class LogServiceImpl implements LogService {
    @Autowired
    private LogDao dao;

    @Override
    public int addLog(String status){
        User user = (User)SessionUtils.getAttr("UserInfo");
        if(user == null){ return 0; }
        return addLog(user,status);
    }

    @Override
    public int addLog(User user, String status){
        Log log  = new Log();
        log.setId(UUID.randomUUID().toString());
        log.setStatus(status);
        log.setUserId(user.getId());
        log.setUsername(user.getUsername());
        log.setClientInfo(SessionUtils.getUserAgentInfo());
        log.setBrower(SessionUtils.getBrower());
        log.setOs(SessionUtils.getOS());
        log.setIpAddress(SessionUtils.getIp());
        return dao.addLog(log);
    }
}