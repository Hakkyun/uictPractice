package com.uict.board.model.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.uict.board.model.board.vo.Board;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int enrollBoard(Board b) {
		return sqlSession.insert("board.insertBoard", b);
	}

	@Override
	public List<Board> getBoardList() {
		return sqlSession.selectList("board.getBoardList");
	}

	@Override
	public Board selectOne(int bNum) {
		return sqlSession.selectOne("board.selectOne", bNum);
	}

	@Override
	public int editComplete(Board b) {
		return sqlSession.update("board.updateComplete", b);
	}

	@Override
	public int delText(int bNum) {
		return sqlSession.delete("board.delText", bNum);
	}

	@Override
	public int increaseCount(int bNum) {
		return sqlSession.update("board.increaseCount", bNum);
	}

	@Override
	public int boardListCount() {
		return sqlSession.selectOne("board.boardListCount");
	}

	
}
