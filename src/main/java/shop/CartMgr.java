package shop;

import java.util.Hashtable;

//장바구니 기능 : DB연동 X, 세션을 이용
public class CartMgr {
	
	private Hashtable<Integer, OrderBean> hCart = new Hashtable<Integer, OrderBean>();
	
	
	//Cart Add : 기존의 장바구니에 동잃나 상품이 있는 경우를 고려
	public void addCart(OrderBean order) {
		int productNo = order.getProductNo();//상품번호
		int quantity = order.getQuantity();//주문수량
		if(quantity>0) {
			if(hCart.containsKey(productNo)) {
				//기존에 주문 객체를 가져옴
				OrderBean temp = hCart.get(productNo);
				quantity+=temp.getQuantity();
				order.setQuantity(quantity);
				hCart.put(order.getProductNo(), order);
			}else {
				//기존에 동일한 상품번호가 없는 경우
				hCart.put(order.getProductNo(), order);
			}
		}
	}
	
	//Cart Delete
	public void deleteCart(OrderBean order) {
		hCart.remove(order.getProductNo());
	}
	
	//Cart Update
	public void updateCart(OrderBean order) {
		//같은 key값이 들어가면 덮어쓰기
		hCart.remove(order.getProductNo(), order);
	}
	
	public Hashtable<Integer, OrderBean> getCartList() {
		return hCart;
	}
}
