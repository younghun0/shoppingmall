package com.flekdk77.shoppingmall.backoffice.service;


import com.flekdk77.shoppingmall.backoffice.dao.EventMapper;
import com.flekdk77.shoppingmall.backoffice.dto.Event;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EventService {

        @Autowired
        private EventMapper eventMapper;

        public List<Event> getEvent(int page,int countPage,String title,int is_show,String start_at,String end_at){
            return eventMapper.getEvent(page,countPage,title,is_show,start_at,end_at);
        }
        public boolean addEvent(Event event){
            return eventMapper.addEvent(event);
        }
        public Event getEventOne(int id){
            return eventMapper.getEventOne(id);
        }

        public boolean updateEvent(Event event){
            return eventMapper.updateEvent(event);
        }
        public boolean deleteEvent(int id){
            return eventMapper.deleteEvent(id);
        }
        public int getEventTatal(String title,int is_show,String start_at,String end_at){
            return eventMapper.getEventTotal(title,is_show,start_at,end_at);
        }
}
