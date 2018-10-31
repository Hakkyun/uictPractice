package com.uict.board.model.board.service;

import java.util.List;

import com.uict.board.model.board.vo.Board;

public interface BoardService {

	int enrollBoard(Board b);

	List<Board> getBoardList();

	Board selectOne(int bNum);

	int editComplete(Board b);

	int delText(int bNum);

	int boardListCount();
	
}
