package com.flekdk77.shoppingmall.backoffice.service;


import com.flekdk77.shoppingmall.backoffice.dao.EventMapper;
import com.flekdk77.shoppingmall.backoffice.dto.Event;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EventService {

        private EventMapper eventMapper;
        public List<Event> getEventList() throws Exception{
         return eventMapper.getEventList();
        }


}
