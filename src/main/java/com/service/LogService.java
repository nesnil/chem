package com.service;

import com.pojo.*;

import java.util.List;

public interface LogService {
    int addLog(String status);
    int addLog(User user,String status);
}
