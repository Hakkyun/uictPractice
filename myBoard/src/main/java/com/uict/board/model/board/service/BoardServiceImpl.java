package com.uict.board.model.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uict.board.model.board.dao.BoardDao;
import com.uict.board.model.board.vo.Board;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDao bDao;
	
	@Override
	public int enrollBoard(Board b) {
		return bDao.enrollBoard(b);
	}

	@Override
	public List<Board> getBoardList() {
		return bDao.getBoardList();
	}

	@Override
	public Board selectOne(int bNum) {
		
		int result = bDao.increaseCount(bNum);
		
		return bDao.selectOne(bNum);
	}

	@Override
	public int editComplete(Board b) {
		return bDao.editComplete(b);
	}

	@Override
	public int delText(int bNum) {
		return bDao.delText(bNum);
	}

	@Override
	public int boardListCount() {
		return bDao.boardListCount();
	}
	
}
