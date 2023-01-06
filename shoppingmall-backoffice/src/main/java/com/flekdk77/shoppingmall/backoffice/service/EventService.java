package com.flekdk77.shoppingmall.backoffice.service;


import com.flekdk77.shoppingmall.backoffice.dao.EventMapper;
import com.flekdk77.shoppingmall.backoffice.dto.Event;
import com.flekdk77.shoppingmall.backoffice.dto.GetEventListDto;
import com.flekdk77.shoppingmall.backoffice.dto.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EventService {

        @Autowired
        private BCryptPasswordEncoder bCryptPasswordEncoder;
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
        public int getEventTotal(GetEventListDto getEventListDto){
            return eventMapper.getEventTotal(getEventListDto);
        }
        public boolean deleteEventArr(String[] ids){
            return eventMapper.deleteEventArr(ids);
        }
        public User findOneById(String id){
            return eventMapper.findOneById(id);
        }
        public boolean addUser(User user){
            String encoded = (bCryptPasswordEncoder.encode(user.getPassword()));
            user.setPassword(encoded);
            return eventMapper.addUser(user);
        }

}
