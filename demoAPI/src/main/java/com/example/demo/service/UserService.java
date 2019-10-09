package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.User;
import com.example.demo.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	UserRepository repo;

	public List<User> find() {
		return repo.findAll();
	}

	public User create(User user) {
		repo.save(user);
		return user;
	}

}
