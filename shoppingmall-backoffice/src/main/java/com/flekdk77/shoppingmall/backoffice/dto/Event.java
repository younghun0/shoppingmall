package com.flekdk77.shoppingmall.backoffice.dto;


import org.w3c.dom.events.EventTarget;

public class Event {
    private int id;
    private String title;
    private String content;
    private String created_at;
    private int created_by;

    public Event(){}
    public int getId(){
        return id;
    }
    public void setId(int id){
        this.id=id;
    }
    public String getTitle(){
        return title;
    }
    public void setTitle(String title){
        this.title=title;
    }
    public String getContent(){
        return content;
    }
    public void setContent(String content){
        this.content=content;
    }
    public String getCreated_at(){
        return created_at;
    }
    public void setCreated_at(String created_at){
        this.created_at=created_at;
    }
    public int getCreated_by(){
        return created_by;
    }
    public void setCreated_by(int created_by){
        this.created_by=created_by;
    }
    public Event(int id, String title,String content,String created_at,int created_by){
        super();
        this.id=id;
        this.title=title;
        this.content=content;
        this.created_at=created_at;
        this.created_by=created_by;
    }
}
