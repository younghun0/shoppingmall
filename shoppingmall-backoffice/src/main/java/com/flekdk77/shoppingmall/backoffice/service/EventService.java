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

        public List<Event> getEvent(){
            return eventMapper.getEvent();
        }

        public boolean addEvent(Event e){
            return eventMapper.addEvent(e);
        }
        public Event getEventOne(int id){
            return eventMapper.getEventOne(id);
        }

        public boolean updateEvent(Event e){
            return eventMapper.updateEvent(e);
        }
}
