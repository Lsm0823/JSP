package guestbook;


public class CommentBean {
	private int num;
 	private int cnum;
 	private String cid;
 	private String comment;
 	private String cip;
 	private String cregDate;
 	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getCip() {
		return cip;
	}
	public void setCip(String cip) {
		this.cip = cip;
	}
	public String getCregDate() {
		return cregDate;
	}
	public void setCregDate(String cregDate) {
		this.cregDate = cregDate;
	}
}
