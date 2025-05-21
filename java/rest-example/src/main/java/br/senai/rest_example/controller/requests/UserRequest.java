package br.senai.rest_example.controller.requests;

import br.senai.rest_example.model.user.UserEntity;

public class UserRequest {
    private String name;
    private String username;
    private String password;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public UserEntity toEntity() {

        UserEntity entity = new UserEntity();
        entity.setName(this.name);
        entity.setUsername(this.username);
        entity.setPassword(this.password);

        return entity;
    }
}
