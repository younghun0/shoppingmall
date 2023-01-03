package com.flekdk77.shoppingmall.backoffice.dao;

import com.flekdk77.shoppingmall.backoffice.dto.Event;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface EventMapper {

       public List<Event> getEvent(int page,int countPage,String title,int is_show,String start_at,String end_at);

       public boolean addEvent(Event e);

       public Event getEventOne(int id);

       public boolean updateEvent(Event e);

       public boolean deleteEvent(int id);

       public int getEventTotal(String title,int is_show,String start_at,String end_at);

}
