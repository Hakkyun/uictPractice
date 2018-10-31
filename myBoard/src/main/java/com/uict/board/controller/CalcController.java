package com.uict.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CalcController {

	@RequestMapping("calc.do")
	public String calc() {
		return "calc/calc";
	}
	
}
