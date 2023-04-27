package com.service.impl;

import com.dao.UserDao;
import com.pojo.User;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    public int addUser(User user){
        return userDao.addUser(user);
    }

    @Override
    public int updUser(User user) {
        return userDao.updUser(user);
    }

    @Override
    public int delUserById(String id) {
        return userDao.delUserById(id);
    }

    @Override
    public User qryByid(String id) {
        return userDao.qryById(id);
    }

    @Override
    public List<User> qryAllUser() {
        return userDao.qryAllUser();
    }

    @Override
    public User qryByUsername(String username) {
        return userDao.qryByUsername(username);
    }
}
