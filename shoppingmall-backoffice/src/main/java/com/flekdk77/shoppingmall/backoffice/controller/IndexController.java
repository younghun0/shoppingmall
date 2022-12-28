package com.flekdk77.shoppingmall.backoffice.controller;

import com.flekdk77.shoppingmall.backoffice.dto.Event;
import com.flekdk77.shoppingmall.backoffice.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
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

    @RequestMapping(value="/eventList", method=RequestMethod.GET)
    @ResponseBody
    public List<Event> eventList(){
        return eventService.getEvent();
    }

    @RequestMapping(value="/write",method = RequestMethod.GET)
    public String write(){
        return "write";
    }
    @RequestMapping(value = "/writeAction", method =RequestMethod.POST)
    public String writeAction(
            HttpServletRequest req,@RequestParam("title")String title,
            @RequestParam("content")String content,
            @RequestParam("created_by")int created_by) throws  IllegalStateException,
            IOException{
        String PATH = req.getSession().getServletContext().getRealPath("/")+"resources/";
        eventService.addEvent(new Event(title,content,created_by));
        return "event";
    }

    @RequestMapping(value = "/view",method = RequestMethod.GET)
    public String view(){
        return "view";
    }
    @RequestMapping(value = "/eventView",method = RequestMethod.GET)
    @ResponseBody
    public Event eventList(@RequestParam("id")int id){
        return eventService.getEventOne(id);
    }
    @RequestMapping(value = "/modify",method = RequestMethod.GET)
    public String modify(){
        return "modify";
    }

    @RequestMapping(value = "/modifyAction",method = RequestMethod.POST)
    public String modifyAction(
            HttpServletRequest req,
            @RequestParam("id")int id,
            @RequestParam("title")String title,
            @RequestParam("content")String content,
            @RequestParam("created_by")int created_by)throws IllegalStateException,
            IOException{
        String PATH =req.getSession().getServletContext().getRealPath("/")+"resources/";
        eventService.updateEvent(new Event(id,title,content,created_by));
        return "event";
    }

}