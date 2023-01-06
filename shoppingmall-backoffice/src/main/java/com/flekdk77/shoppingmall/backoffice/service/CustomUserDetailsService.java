package com.flekdk77.shoppingmall.backoffice.service;

import com.flekdk77.shoppingmall.backoffice.dao.EventMapper;
import com.flekdk77.shoppingmall.backoffice.dto.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashSet;
import java.util.Set;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private EventMapper eventMapper;

    @Override
    @Transactional(readOnly = true)
    public UserDetails loadUserByUsername(String id){

        Set<GrantedAuthority> grantedAuthorities = new HashSet<>();

        User user = eventMapper.findOneById(id);

        if (user != null){
            grantedAuthorities.add(new SimpleGrantedAuthority("USER"));
            return new org.springframework.security.core.userdetails.User(user.getId(),user.getPassword(),grantedAuthorities);
        }else {
            throw new UsernameNotFoundException("유저 못찾음:"+id);
        }

    }
}
