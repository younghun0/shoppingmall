package com.flekdk77.shoppingmall.backoffice.dto;

public class Event {
    private int id;

    private String title;

    private String content;

    private String created_at;

    private int created_by;

    private String updated_at;
    private int updated_by;
    private boolean is_show;
    private boolean is_state;
    private String start_at;
    private String end_at;

    public Event() {
        super();
    }
    public Event(int id, String title, String content, String created_at, int created_by, String start_at, String end_at) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.created_at = created_at;
        this.created_by = created_by;
        this.start_at = start_at;
        this.end_at = end_at;
    }

    public Event(String title, String content, int created_by) {
        super();
        this.title = title;
        this.content = content;
        this.created_by = created_by;
    }

    public Event(int id, String title, String content, int created_by) {
        super();
        this.id = id;
        this.title = title;
        this.content = content;
        this.created_by = created_by;
    }

    public Event(String title, String content, int created_by, String start_at, String end_at) {
        this.title = title;
        this.content = content;
        this.created_by = created_by;
        this.start_at = start_at;
        this.end_at = end_at;
    }

    public boolean isIs_state() {
        return is_state;
    }

    public void setIs_state(boolean is_state) {
        this.is_state = is_state;
    }

    public String getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(String updated_at) {
        this.updated_at = updated_at;
    }

    public int getUpdated_by() {
        return updated_by;
    }

    public void setUpdated_by(int updated_by) {
        this.updated_by = updated_by;
    }

    public boolean isIs_show() {
        return is_show;
    }

    public void setIs_show(boolean is_show) {
        this.is_show = is_show;
    }

    public String getStart_at() {
        return start_at;
    }

    public void setStart_at(String start_at) {
        this.start_at = start_at;
    }

    public String getEnd_at() {
        return end_at;
    }

    public void setEnd_at(String end_at) {
        this.end_at = end_at;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    public int getCreated_by() {
        return created_by;
    }

    public void setCreated_by(int created_by) {
        this.created_by = created_by;
    }
}
