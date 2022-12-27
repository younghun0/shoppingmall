package com.flekdk77.shoppingmall.backoffice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class IndexController {

    @RequestMapping("/index")
   private String index(){
       return "index";
    }
}