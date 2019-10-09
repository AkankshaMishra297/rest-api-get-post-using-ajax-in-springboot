package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.model.User;
import com.example.demo.service.UserService;

@Controller
@CrossOrigin
public class UserController {

	@Autowired
	UserService service;

	@RequestMapping("/")

	public String show() {
		return "Home.jsp";
	}

	@PostMapping("/user/add")
	@ResponseBody
	public User createUser(@RequestBody User user) {

		return service.create(user);

	}

	@GetMapping("/user/list")
	@ResponseBody
	public List<User> getUser() {
		System.out.println("view");
		return service.find();

	}

}
