package com.flekdk77.shoppingmall.backoffice.controller;

import com.flekdk77.shoppingmall.backoffice.dto.Event;
import com.flekdk77.shoppingmall.backoffice.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@Controller
public class IndexController {

    @Autowired
    private EventService eventService;
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String root(){
        return "index";
    }
    @RequestMapping(value="/index", method=RequestMethod.GET)
    public String index() {
        return "index";
    }
    @RequestMapping(value="/event", method=RequestMethod.GET)
    public String event() {
        return "event";
    }

    @RequestMapping(value="/boardList", method=RequestMethod.GET)
    @ResponseBody
    public List<Event> eventList(){
        return eventService.getEvent();
    }

}