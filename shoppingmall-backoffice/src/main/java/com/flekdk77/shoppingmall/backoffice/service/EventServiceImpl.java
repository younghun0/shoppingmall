package com.flekdk77.shoppingmall.backoffice.service;

import com.flekdk77.shoppingmall.backoffice.dao.EventMapper;
import com.flekdk77.shoppingmall.backoffice.dto.Event;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class EventServiceImpl implements EventService {

    private final EventMapper eventMapper;

    @Override
    public List<Event> getEventList(){
        return eventMapper.getEventList();
    }
}
