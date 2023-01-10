package com.flekdk77.shoppingmall.backoffice.controller;

import com.flekdk77.shoppingmall.backoffice.dto.User;
import com.flekdk77.shoppingmall.backoffice.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
public class LoginController {

    @Autowired
    private EventService eventService;
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(HttpServletRequest request){
        return "login";
    }

    @RequestMapping(value = "/signUp", method = RequestMethod.GET)
    public String signUp(){
        return "signUp";
    }
    @RequestMapping(value = "/signUpAdd", method = RequestMethod.POST)
    public String addUser(User user){
        eventService.addUser(user);
        return "redirect:/login";
    }
}
