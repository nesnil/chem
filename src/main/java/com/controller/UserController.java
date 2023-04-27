package com.controller;

import com.pojo.User;
import com.service.LogService;
import com.service.UserService;
import com.utils.MD5Utils;
import com.utils.SessionContext;
import com.utils.SessionUtils;
import com.utils.Tools;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.*;

@Controller
@RequestMapping("/user")
public class UserController {

    protected Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    @Autowired
    private LogService logService;

    @RequestMapping("/addUser")
    public String addUser(User user) {
        logger.info("User registration ...  ");
        logger.info("user.getUsername(): -> "+user.getUsername());

        user.setId(UUID.randomUUID().toString());
        user.setStatus("0");
        user.setPassword(MD5Utils.MD5(user.getPassword()));

        if(userService.qryByUsername(user.getUsername())!=null){
            SessionUtils.setAttr("LoginInfo","UsernameExist");
        } else {
            try {
                user.setCreatedate(new Date());
                userService.addUser(user);
                logService.addLog(user,"Register");
            } catch (Exception e) {
                SessionUtils.setAttr("LoginInfo", "UserRegError");
            }
            SessionUtils.setAttr("LoginInfo", "UserRegSuccess");
        }
//        SessionUtils.setAttr("UserInfo",user);
        return "redirect:/";
    }

    @RequestMapping("/logout")
    public String logout() {
        logger.info("User logout ...  ");
        SessionUtils.getSession().invalidate();
        logService.addLog("Logout");
        SessionContext.plLoginUsersInfo();
        return "redirect:/";
    }

    @RequestMapping("/login")
    public String login(User user) {
        logger.info("User login ...  ");
        logger.info("user.getUsername(): -> "+user.getUsername());
        String username = user.getUsername();
        User u = userService.qryByUsername(username);
        if(u!=null){
            String password = user.getPassword();
            String pw = u.getPassword();
            if(MD5Utils.valid(password,pw)){
                if(!"1".equals(u.getStatus())){
                    SessionUtils.setAttr("LoginInfo","UserStatusError");
                }else if(Tools.isMobile(SessionUtils.getOS())&&!"1".equals(u.getAllowMobile())){
                    SessionUtils.setAttr("LoginInfo","UserCanNotUseMobile");
                }else{
                    int allowOnlineCnt = 0;
                    try{
                        allowOnlineCnt = Integer.parseInt(u.getOnlineLimit());
                    }catch(NumberFormatException nfe){ }
                    int au = SessionContext.getAU(u.getUsername());
                    if(au >= allowOnlineCnt){
                        SessionContext.killOldestSession(u.getUsername());
                    }
                    u.setLoginDate(new Date());
                    SessionUtils.setAttr("UserInfo",u);
                    logService.addLog("Login");
                }
            }else{
                SessionUtils.setAttr("LoginInfo","PasswordOrUsernameError");
            }
        }else{
            SessionUtils.setAttr("LoginInfo","PasswordOrUsernameError");
        }
        return "redirect:/";
    }

    @RequestMapping("/allUser")
    public String list(Model model){
        List<User> list = userService.qryAllUser();
        model.addAttribute("list",list);
        return "allUser";
    }

    @RequestMapping("toAddUser")
    public String toAddUser(){
        return "addUser";
    }



    @RequestMapping("/del/{userId}")
    public String deleteUser(@PathVariable("userId") String id) {
        userService.delUserById(id);
        return "redirect:/paper/allPaper";
    }

    @RequestMapping("toUpdUser")
    public String toUpdatePaper(Model model, String id) {
        model.addAttribute("user", userService.qryByid(id));
        return "updUser";
    }

    @RequestMapping("/updUser")
    public String updatePaper(Model model, User user) {
        userService.updUser(user);
        user = userService.qryByid(user.getId());
        model.addAttribute("user", user);
        return "redirect:/paper/allUser";
    }

    @RequestMapping("/changepw")
    public String updatePaper(Model model, String opassword, String npassword1, String npassword2) {
        if(Tools.isEmpty(opassword)||Tools.isEmpty(npassword1)||Tools.isEmpty(npassword2)){
            SessionUtils.setAttr("LoginInfo","PasswordIsEmpty");
        }else if(!npassword1.equals(npassword2)) {
            SessionUtils.setAttr("LoginInfo", "NPasswordIsWrong");
        }else if(MD5Utils.MD5(opassword).equals(MD5Utils.MD5(npassword2))) {
            SessionUtils.setAttr("LoginInfo", "OPasswordEqualNPassword");
        }else {
            String opMd5 = MD5Utils.MD5(opassword);
            User user = (User)SessionUtils.getAttr("UserInfo");
            String opw = user.getPassword();
            if(!opw.equals(opMd5)){
                SessionUtils.setAttr("LoginInfo","OPasswordWrong");
            }else{
                user.setPassword(MD5Utils.MD5(npassword1));
                userService.updUser(user);
                SessionUtils.setAttr("LoginInfo","PasswordChangeSuccess");
                SessionUtils.setAttr("UserInfo",user);
                logService.addLog("ChangePassword");
            }
        }
        return "redirect:/";
    }
}
