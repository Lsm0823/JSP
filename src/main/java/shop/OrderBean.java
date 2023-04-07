package shop;


public class OrderBean {

	private int no;//주문번호
	private int productNo;//주문한 상품번호
	private int quantity;//주문수량
	private String date;//주문날짜
	private String state;//주문상태(입금확인중,배송중,배송완료)
	private String id;//주문자

	public OrderBean() {}
	
	public OrderBean(int no, int productNo, int quantity, 
			String date, String state, String id) {
		this.no = no;
		this.productNo = productNo;
		this.quantity = quantity;
		this.date = date;
		this.state = state;
		this.id = id;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
}
