package com.example.demo.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.crypto.password.*;
import org.springframework.stereotype.*;

import com.example.demo.dao.*;
import com.example.demo.entity.*;

@Service
public class BoardService {
	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	public Boolean save(Board input) {
		String encodedPassword = passwordEncoder.encode(input.getPassword());
		return boardDao.save(input.setPassword(encodedPassword))==1L;
	}
	
	public List<Board> findAll() {
		return boardDao.findAll();
	}
	
	public Board findById(Long bno) {
		boardDao.increaseReadcnt(bno);
		return boardDao.findById(bno);
	}
	
	public Boolean update(Board input) {
		Board target = boardDao.findById(input.getBno());
		if(target==null)
			return false;
		Boolean result = passwordEncoder.matches(input.getPassword(), target.getPassword());
		if(result==true)
			boardDao.update(input);
		return result;
	}
	
	public Boolean delete(Long bno, String password) {
		Board target = boardDao.findById(bno);
		if(target==null)
			return false;
		Boolean result = passwordEncoder.matches(password, target.getPassword());
		System.out.println(password);
		System.out.println(result);
		if(result==true)
			boardDao.deleteById(bno);
		return result;
	}
}
