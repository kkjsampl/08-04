package com.example.demo.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.*;

import com.example.demo.entity.*;
import com.example.demo.service.*;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService; 
	
	@GetMapping({"/", "/list"})
	public String findAll(Model model) {
		List<Board> list = boardService.findAll();
		model.addAttribute("list", list);
		return "list";
	}
	
	@GetMapping("/read")
	public String read(@RequestParam Long bno, Model model) {
		Board board = boardService.findById(bno);
		model.addAttribute("board", board);
		return "read";
	}
	
	@GetMapping("/write")
	public String save() {
		return "write";
	}
	
	@PostMapping("/write")
	public String save(@ModelAttribute Board board) {
		boardService.save(board);
		return "redirect:/list";
	}
	
	@PostMapping("/update")
	public String update(@ModelAttribute Board board, RedirectAttributes ra) {
		Boolean result = boardService.update(board);
		if(result==false)
			ra.addFlashAttribute("msg", "글을 변경하지 못 했습니다");
		return "redirect:/list";
	}
	
	@PostMapping("/delete")
	public String delete(@RequestParam Long bno, @RequestParam String password, RedirectAttributes ra) {
		Boolean result = boardService.delete(bno, password);
		if(result==false)
			ra.addFlashAttribute("msg", "글을 삭제하지 못 했습니다");
		return "redirect:/list";
	}
}
