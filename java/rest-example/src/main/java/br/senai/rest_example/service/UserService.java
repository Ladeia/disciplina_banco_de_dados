package br.senai.rest_example.service;

import br.senai.rest_example.controller.requests.UserRequest;
import br.senai.rest_example.model.user.UserEntity;
import br.senai.rest_example.model.user.UserEntityRepository;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {

    private final UserEntityRepository repository;

    UserService(UserEntityRepository repository) {
        this.repository = repository;
    }

    public List<UserEntity> all() {
        List<UserEntity> allUsers =  repository.findAll();
        if(allUsers.isEmpty()){
            throw new ResponseStatusException(
                    HttpStatus.NOT_FOUND, "0 users found"
            );
        } else {
            return allUsers;
        }
    }

    public UserEntity getById(Long id) {
        Optional<UserEntity> user = repository.findById(id);
        if(user.isPresent()){
            return user.get();
        } else {
            throw new ResponseStatusException(
                    HttpStatus.NOT_FOUND, "user not found"
            );
        }
    }

    public UserEntity save(UserRequest userRequest) {
        UserEntity entity = userRequest.toEntity();
        try {
            return repository.save(entity);
        } catch (Exception ex) {
            throw new ResponseStatusException(
                    HttpStatus.BAD_REQUEST, "cannot save user"
            );
        }
    }

    public void delete(Long id) {
        repository.deleteById(id);
    }
}
