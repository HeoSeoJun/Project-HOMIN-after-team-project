package com.care.homin.board.dto;


//create table homboard_comment(
//id varchar2(20),
//comment_content varchar2(300),
//board_no number,
//writetime varchar2(25),
//comment_no number,
//CONSTRAINT PK_homboard_comment FOREIGN KEY(board_no) REFERENCES homin_board(no) ON DELETE CASCADE);

public class CommentDTO {
	private String id;
	private String comment_content;
	private int board_no;
	private String writetime;
	private int comment_no;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getWritetime() {
		return writetime;
	}
	public void setWritetime(String writetime) {
		this.writetime = writetime;
	}
	public int getComment_no() {
		return comment_no;
	}
	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}
	
}
