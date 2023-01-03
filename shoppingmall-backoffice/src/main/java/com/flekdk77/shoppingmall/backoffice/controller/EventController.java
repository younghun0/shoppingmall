package com.flekdk77.shoppingmall.backoffice.controller;

import com.flekdk77.shoppingmall.backoffice.common.Constants;
import com.flekdk77.shoppingmall.backoffice.dto.Event;
import com.flekdk77.shoppingmall.backoffice.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/event")
public class EventController {

    @Autowired
    private EventService eventService;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String event(Model model, @RequestParam(value = "page", defaultValue = "1") int page,
                        @RequestParam(value = "title",required=false) String title,
                        @RequestParam(value = "is_show",defaultValue = "1") int is_show,
                        @RequestParam(value = "start_at",required=false) String start_at,
                        @RequestParam(value = "end_at",required=false) String end_at) {
        try {
            int total = eventService.getEventTatal(title,is_show,start_at,end_at);
            List<Event> eventList = eventService.getEvent(((page - 1)*Constants.ROW_PER_PAGE), Constants.ROW_PER_PAGE,title,is_show,start_at,end_at);
            model.addAttribute("eventList", eventList);
            model.addAttribute("page", page);
            model.addAttribute("total", total);
            model.addAttribute("rowPerPage", Constants.ROW_PER_PAGE);
            model.addAttribute("title", title);
            model.addAttribute("is_show", is_show);
            model.addAttribute("start_at", start_at);
            model.addAttribute("end_at", end_at);

            return "event/list";
        } catch (Exception e) {
            return "REDIRECT:/event/list";
        }
    }

    @RequestMapping(value = "/write", method = RequestMethod.GET)
    public String write() {
        return "event/write";
    }

    @RequestMapping(value = "/writeAction", method = RequestMethod.POST)
    public String writeAction(@RequestParam("title")String title,
                              @RequestParam("content")String content,
                              @RequestParam("created_by")int created_by,
                              @RequestParam("start_at")String start_at,
                              @RequestParam("end_at")String end_at){
        eventService.addEvent(new Event(title,content,created_by,start_at,end_at));
        return "redirect:/event";
    }

    @RequestMapping(value = "/view", method = RequestMethod.GET)
    public String view(Model model, @RequestParam("id") int id, @RequestParam(value = "page", defaultValue = "1") int page) {
        Event event = eventService.getEventOne(id);
        model.addAttribute("event", event);
        model.addAttribute("page", page);
        return "event/view";
    }

    @RequestMapping(value = "/modify", method = RequestMethod.GET)
    public String modify(Model model, @RequestParam("id") int id, @RequestParam(value = "page", defaultValue = "1") int page) {
        Event event = eventService.getEventOne(id);
        model.addAttribute("event", event);
        model.addAttribute("page", page);
        return "event/modify";
    }

    @RequestMapping(value = "/modifyAction", method = RequestMethod.POST)
    public String modifyAction(@RequestParam("id") int id,@RequestParam("title")String title,@RequestParam("content")String content,
                               @RequestParam("created_by")int created_by){
            eventService.updateEvent(new Event(id,title,content,created_by));
            return "redirect:/event";
    }

    @RequestMapping(value = "/deleteAction", method = RequestMethod.POST)
    public String deleteAction(
            @RequestParam("id") int id) {
        eventService.deleteEvent(id);
        return "redirect:/event";
    }
}

