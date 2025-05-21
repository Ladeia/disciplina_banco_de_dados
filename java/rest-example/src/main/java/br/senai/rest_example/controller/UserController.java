package br.senai.rest_example.controller;


import br.senai.rest_example.controller.requests.UserRequest;
import br.senai.rest_example.model.user.UserEntity;
import br.senai.rest_example.service.UserService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

@RestController
@RequestMapping("/api/v1/user")
public class UserController {

    private final UserService service;

    UserController(UserService service) {
        this.service = service;
    }

    @GetMapping()
    public ResponseEntity<List<UserEntity>> getAll() {
        return ResponseEntity.ok().body(service.all());
    }

    @GetMapping("/{id}")
    public ResponseEntity<UserEntity> getOne(
            @PathVariable Long id
    ) {
        return ResponseEntity.ok().body(service.getById(id));
    }

    @PostMapping()
    public ResponseEntity<UserEntity> save(
            @RequestBody UserRequest userRequest
    ) {
        return ResponseEntity.accepted().body(service.save(userRequest));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Long> delete(
            @PathVariable Long id
    ) {
        service.delete(id);
        return ResponseEntity.accepted().body(id);
    }
}
