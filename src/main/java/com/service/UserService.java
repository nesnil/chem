package com.service;

import com.pojo.User;

import java.util.List;

public interface UserService {
    int addUser(User user);
    int updUser(User user);
    int delUserById(String id);
    User qryByid(String id);
    List<User> qryAllUser();
    User qryByUsername(String username);
}
