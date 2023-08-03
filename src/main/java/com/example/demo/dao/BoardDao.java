package com.example.demo.dao;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.example.demo.entity.*;

@Mapper
public interface BoardDao {
	@SelectKey(statement="select board_seq.nextval from dual", resultType=Long.class, keyProperty="bno", before=true)
	@Insert("insert into board values(#{bno},#{title},#{content},#{nickname},#{password},sysdate,0)")
	public Long save(Board board);
	
	@Select("select * from board")
	public List<Board> findAll();
	
	@Select("select * from board where bno=#{bno} and rownum=1")
	public Board findById(Long bno);
	
	@Update("update board set title=#{title}, content=#{content} where bno=#{bno}")
	public Long update(Board board);
	
	@Update("update board set readcnt=readcnt+1 where bno=#{bno}")
	public Long increaseReadcnt(Long bno);
	
	@Delete("delete from board where bno=#{bno}")
	public Long deleteById(Long bno);
}
