package com.zonesoft.policyenging.api.controllers;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class GreetingController {

	@GetMapping(value={"","/","/greeting","/hello"})
	@ResponseBody
	public String greeting() {
		return "Hello";
	}

}