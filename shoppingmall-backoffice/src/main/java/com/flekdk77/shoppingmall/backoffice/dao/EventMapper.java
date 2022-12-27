package com.flekdk77.shoppingmall.backoffice.dao;

import com.flekdk77.shoppingmall.backoffice.dto.Event;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("com.flekdk77.shoppingmall.backoffice.dao.EvenMapper")
public interface EventMapper {
       public List<Event> getEventList() throws Exception;
}
