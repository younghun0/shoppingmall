package com.flekdk77.shoppingmall.backoffice.dto;

public class Admin {
    private int id;
    private String username;
    private String password;
    private String name;
    private String email;
    private String created_at;
    private String updated_at;
    private int lock_count;

    public Admin(){}
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    public String getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(String updated_at) {
        this.updated_at = updated_at;
    }

    public int getLock_count() {
        return lock_count;
    }

    public void setLock_count(int lock_count) {
        this.lock_count = lock_count;
    }

    public Admin(int id, String username, String password, String name, String email, String created_at, String updated_at, int lock_count) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.name = name;
        this.email = email;
        this.created_at = created_at;
        this.updated_at = updated_at;
        this.lock_count = lock_count;
    }
}
