package com.dao;

import com.pojo.User;

import java.util.List;

public interface UserDao {
    int addUser(User user);

    int updUser(User User);

    int delUserById(String Id);

    User qryById(String id);

    List<User> qryAllUser();

    User qryByUsername(String username);

}
