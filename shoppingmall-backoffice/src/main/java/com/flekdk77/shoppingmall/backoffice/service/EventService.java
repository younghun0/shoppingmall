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

        public List<Event> getEvent(int page,int countPage){
            return eventMapper.getEvent(page,countPage);
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
        public int getEventTatal(){
            return eventMapper.getEventTotal();
        }
}
