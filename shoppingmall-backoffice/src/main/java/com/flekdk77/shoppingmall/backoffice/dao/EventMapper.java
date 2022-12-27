package com.flekdk77.shoppingmall.backoffice.dao;

import com.flekdk77.shoppingmall.backoffice.dto.Event;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface EventMapper {
       public List<Event> getEventList();
}
