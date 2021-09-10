package egovframework.example.board.service;

import egovframework.example.sample.service.SampleDefaultVO;

public class BoardVO  extends SampleDefaultVO {
	
	// tb_user
	private String userId;
	private String userName;
	private String password;
	private String useYn;
	
	// tb_board
	private String idx;
	private String title;
	private String contents;
	private String count;
	private String writer;
	private String writerName;
	private String indate;
	
	// tb_reply
	private String seq;
	private String reply;
	private String replyWriter;
	
	// serach 
	private String searchKeyword;
	
	public String getReplyWriter() {
		return replyWriter;
	}
	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}
	public String getWriterName() {
		return writerName;
	}
	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getIndate() {
		return indate;
	}
	public void setIndate(String indate) {
		this.indate = indate;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	
	@Override
	public String toString() {
		return "BoardVO [userId=" + userId + ", userName=" + userName + ", password=" + password + ", useYn=" + useYn
				+ ", idx=" + idx + ", title=" + title + ", contents=" + contents + ", count=" + count + ", writer="
				+ writer + ", writerName=" + writerName + ", indate=" + indate + ", seq=" + seq + ", reply=" + reply
				+ ", replyWriter=" + replyWriter + ", searchKeyword=" + searchKeyword + "]";
	}
	


}
