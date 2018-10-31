package com.uict.board.model.board.dao;

import java.util.List;

import com.uict.board.model.board.vo.Board;

public interface BoardDao {

	public int enrollBoard(Board b);

	public List<Board> getBoardList();

	public Board selectOne(int bNum);

	public int editComplete(Board b);

	public int delText(int bNum);

	public int increaseCount(int bNum);

	public int boardListCount();
	
}
