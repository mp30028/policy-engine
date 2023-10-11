package com.zonesoft.policyengine.api.controllers;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HelloController {

	@GetMapping(value={"","/","/greeting","/hello"})
	@ResponseBody
	public String greeting() {
		return "Hello";
	}

}