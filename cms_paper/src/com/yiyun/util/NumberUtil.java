package com.yiyun.util;

import java.util.Random;
import java.util.UUID;

public class NumberUtil {

	public static String[] chars = new String[] { "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n",
			"o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8",
			"9", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T",
			"U", "V", "W", "X", "Y", "Z" };

	public static String[] randomArr=new String[]{"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q",
			"R","S","T","U","V","W","X","Y","Z"};
	public static String generateShortUuid() {
		StringBuffer shortBuffer = new StringBuffer();
		String uuid = UUID.randomUUID().toString().replace("-", "");
		for (int i = 0; i < 8; i++) {
			String str = uuid.substring(i * 4, i * 4 + 4);
			int x = Integer.parseInt(str, 16);
			shortBuffer.append(chars[x % 0x3E]);
		}
		return shortBuffer.toString();
	}

	public static String getRandom(int num) {
		Random r = new Random();
		StringBuffer sb = new StringBuffer();
		String index = "";
		for (int i = 0; i < num; i++) {
			index += r.nextInt(10) + "";
			sb.append(randomArr[r.nextInt(randomArr.length)]);
		}
		sb.append(index);
		return sb.toString();
	}

	public static String getInviteCodeByUser(String user) {

		return "YQ" + user + getRandom(4);
	}

	public static String getInviteUserByCode(String inviteCode) {
		String user = "";
		try {
			user = inviteCode.substring(2, inviteCode.length() - 8);
		} catch (Exception e) {
			user = "";
		}
		return user;
	}

	public static void main(String[] args) {
		System.out.println(getRandom(4));
		System.out.println(getInviteCodeByUser("ZHOUBIN"));
		System.out.println(generateShortUuid());
	}
}
