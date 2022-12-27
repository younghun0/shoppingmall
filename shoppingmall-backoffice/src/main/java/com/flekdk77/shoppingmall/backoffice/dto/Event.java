package com.flekdk77.shoppingmall.backoffice.dto;



public class Event {
    int id;
    String title;
    String content;
    String created_at;
    int created_by;

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
}
