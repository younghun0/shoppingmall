package com.flekdk77.shoppingmall.backoffice.dto;

public class User {

    private String id;
    private String password;
    private String name;
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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


    User(String id, String password,String name){
        this.id=id;
        this.password=password;
        this.name=name;

    }
    public static User.UserBuilder builder(){
        return new User.UserBuilder();
    }
    public static class UserBuilder{
        private String id;
        private String password;
        private String name;

        UserBuilder(){}
        public UserBuilder id(final String id){
            this.id=id;
            return this;
        }
        public UserBuilder password(final String password){
            this.password=password;
            return this;
        }
        public UserBuilder name(final String name){
            this.name=name;
            return this;
        }
        public User build(){
            return new User(this.id,this.password,this.name);
        }

    }

}
