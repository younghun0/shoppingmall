package com.flekdk77.shoppingmall.backoffice.controller;

import com.flekdk77.shoppingmall.backoffice.common.Constants;
import com.flekdk77.shoppingmall.backoffice.dto.Event;
import com.flekdk77.shoppingmall.backoffice.dto.GetEventListDto;
import com.flekdk77.shoppingmall.backoffice.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/event")
public class EventController {

    @Autowired
    private EventService eventService;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String event(Model model, GetEventListDto getEventListDto) {
        try {
            getEventListDto.setStartIndex(((getEventListDto.getPage() - 1) * Constants.ROW_PER_PAGE));
            getEventListDto.setRowPerPage(Constants.ROW_PER_PAGE);

            int total = eventService.getEventTotal(getEventListDto);

            List<Event> eventList = eventService.getEvent(getEventListDto);
            model.addAttribute("eventList", eventList);
            model.addAttribute("page", getEventListDto.getPage());
            model.addAttribute("total", total);
            model.addAttribute("rowPerPage", Constants.ROW_PER_PAGE);
            model.addAttribute("title", getEventListDto.getTitle());
            model.addAttribute("isShow", getEventListDto.getIsShow());
            model.addAttribute("startAt", getEventListDto.getStartAt());
            model.addAttribute("endAt", getEventListDto.getEndAt());

            return "event/list";
        } catch (Exception e) {
            e.printStackTrace();
            return "REDIRECT:/event/list";
        }
    }

    @RequestMapping(value = "/write", method = RequestMethod.GET)
    public String write() {
        return "event/write";
    }

    @RequestMapping(value = "/writeAction", method = RequestMethod.POST)
    public String writeAction(GetEventListDto getEventListDto) {
        eventService.addEvent(getEventListDto);
        return "redirect:/event";
    }

    @RequestMapping(value = "/view", method = RequestMethod.GET)
    public String view(Model model, @RequestParam("id") int id) {
        Event event = eventService.getEventOne(id);
        model.addAttribute("event", event);
        return "event/view";
    }

    @RequestMapping(value = "/modify", method = RequestMethod.GET)
    public String modify(Model model, @RequestParam("id") int id) {
        Event event = eventService.getEventOne(id);
        model.addAttribute("event", event);
        return "event/modify";
    }

    @RequestMapping(value = "/modifyAction", method = RequestMethod.POST)
    public String modifyAction(GetEventListDto getEventListDto) {
        eventService.updateEvent(getEventListDto);
        return "redirect:/event";
    }

    @RequestMapping(value = "/deleteAction", method = RequestMethod.POST)
    public String deleteAction(
            @RequestParam("id") int id) {
        eventService.deleteEvent(id);
        return "redirect:/event";
    }

    @RequestMapping(value = "/selectBox", method = RequestMethod.POST)
    public String selectBox(HttpServletRequest request,String[] ids) {
        System.out.println("ㅇㅇ");
        eventService.deleteEventArr(ids);
        return "redirect:/event";
    }
}

