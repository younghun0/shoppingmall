package com.flekdk77.shoppingmall.backoffice.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Event {
    private int id;
    private String title;
    private String content;
    private String created_at;
    private int created_by;

}
