package com.dojo.ninjagold.controllers;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Random;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {
	private Random randomNumber = new Random();
	
	@GetMapping("/")
	public String index(HttpSession session) {
		Integer gold = (Integer) session.getAttribute("gold");
		if (gold == null) {
			session.setAttribute("gold", 0);
		}
		
		ArrayList<String> activities = (ArrayList<String>) session.getAttribute("activities");
		if (activities == null) {
			activities = new ArrayList<>();
			session.setAttribute("activities", activities);
		}
		
		return "index.jsp";
	}
	
	@PostMapping("/process")
	public String process(@RequestParam("category") String category, HttpSession session) {
		int foundGold;
		
		switch (category) {
		case "farm":
			foundGold = randomGold(10, 20);
			break;
		case "cave":
			foundGold = randomGold(5, 10);
			break;
		case "house":
			foundGold = randomGold(2, 5);
			break;
		case "quest":
			foundGold = randomGold(0, 50);
			break;
		default:
			foundGold = 0;
			break;
		}
		
		int gold = (int) session.getAttribute("gold");
		gold += foundGold;
		session.setAttribute("gold", gold);
		
		ArrayList<String> activities = (ArrayList<String>) session.getAttribute("activities");
		activities.add("You entered a " + category + " and earned " + foundGold + " gold. (" + LocalDateTime.now() + ").");
		
		return "redirect:/";
	}
	
	private int randomGold(int min, int max) {
		return randomNumber.nextInt(max - min + 1) + min;
	}
}
