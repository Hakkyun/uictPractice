package com.uict.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MapController {

	@RequestMapping("map.do")
	public String map() {
		return "map/map";
	}

	
}
