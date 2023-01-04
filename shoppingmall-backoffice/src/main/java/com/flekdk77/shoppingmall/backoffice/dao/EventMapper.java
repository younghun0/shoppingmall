package com.flekdk77.shoppingmall.backoffice.dao;

import com.flekdk77.shoppingmall.backoffice.dto.Event;
import com.flekdk77.shoppingmall.backoffice.dto.GetEventListDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface EventMapper {

       public List<Event> getEvent(GetEventListDto getEventListDto);

       public boolean addEvent(Event e);

       public Event getEventOne(int id);

       public boolean updateEvent(Event e);

       public boolean deleteEvent(int id);

       public int getEventTotal(GetEventListDto getEventListDto);

       public boolean deleteEventArr(String[] id);
}
