package com.flekdk77.shoppingmall.backoffice.service;


import com.flekdk77.shoppingmall.backoffice.dao.EventMapper;
import com.flekdk77.shoppingmall.backoffice.dto.Event;
import com.flekdk77.shoppingmall.backoffice.dto.GetEventListDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EventService {

        @Autowired
        private EventMapper eventMapper;

        public List<Event> getEvent(GetEventListDto getEventListDto){
            return eventMapper.getEvent(getEventListDto);
        }
        public boolean addEvent(GetEventListDto getEventListDto){
            return eventMapper.addEvent(getEventListDto);
        }
        public Event getEventOne(int id){
            return eventMapper.getEventOne(id);
        }

        public boolean updateEvent(GetEventListDto getEventListDto){
            return eventMapper.updateEvent(getEventListDto);
        }
        public boolean deleteEvent(int id){
            return eventMapper.deleteEvent(id);
        }
        public int getEventTatal(GetEventListDto getEventListDto){
            return eventMapper.getEventTotal(getEventListDto);
        }
        public boolean deleteEventArr(String[] id){
            return eventMapper.deleteEventArr(id);
        }

}
