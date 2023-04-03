package ch05;

import java.util.Random;

public class MyUtil {
	public static String randomColor() {
		Random r = new Random();
		String rgb = Integer.toHexString(r.nextInt(256));
		rgb += Integer.toHexString(r.nextInt(256));
		rgb += Integer.toHexString(r.nextInt(256));
		return "#" + rgb;

	}
}
