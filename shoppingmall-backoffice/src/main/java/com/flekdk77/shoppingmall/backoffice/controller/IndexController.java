package com.flekdk77.shoppingmall.backoffice.controller;

import com.flekdk77.shoppingmall.backoffice.dto.Event;
import com.flekdk77.shoppingmall.backoffice.service.EventService;
import com.google.gson.Gson;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@RequiredArgsConstructor
@RestController
public class IndexController {
    private final EventService eventService;

    @GetMapping("/")
    public String index(){
        return "index";
    }

    @GetMapping("/event")
    public List<Event> eventList(){
        return eventService.getEventList();
    }


    @GetMapping(value = "/main.do")
    public ModelAndView home() throws Exception{
        return new ModelAndView("client/index");
    }

}