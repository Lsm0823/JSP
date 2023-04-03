package ch14;

public class ZipcodeBean {
	private String zipcode;
	private String area1;
	private String area2;
	private String area3;
	
	public ZipcodeBean() {
		// TODO Auto-generated constructor stub
	}
	
	public ZipcodeBean(String zipcode, String area1, String area2, String area3) {
		this.zipcode = zipcode;
		this.area1 = area1;
		this.area2 = area2;
		this.area3 = area3;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getArea1() {
		return area1;
	}
	public void setArea1(String area1) {
		this.area1 = area1;
	}
	public String getArea2() {
		return area2;
	}
	public void setArea2(String area2) {
		this.area2 = area2;
	}
	public String getArea3() {
		return area3;
	}
	public void setArea3(String area3) {
		this.area3 = area3;
	}
}

