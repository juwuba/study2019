package com.yc.test;

import java.util.HashMap;

public class Url_parttern {
	
	public static boolean matching(String reg, String input) {
		if ("/*".equals(reg))
			return true;
		//按 * 切割字符串
		String[] reg_split = reg.split("\\*");
		int index = 0, reg_len = reg_split.length;
		//b代表匹配模式的最后一个字符是否是 '*' ,因为在split方法下最后一个 * 会被舍弃
		boolean b = reg.charAt(reg.length() - 1) == '*' ? true : false;
		while (input.length() > 0) {
			//如果匹配到最后一段,比如这里reg的landingsuper
			if (index == reg_len) {
				if (b)//如果reg最后一位是 * ,代表通配,后面的就不用管了,返回true
					return true;
				else  //后面没有通配符 * ,但是input长度还没有变成0 (此时input = context=%7B%22nid%22%3...),显然不匹配
					return false;
			}
			String r = reg_split[index++];
			int indexOf = input.indexOf(r);
			if (indexOf == -1)
				return false;
			//前面匹配成功的就可以不用管了,截取掉直接从新地方开始
			input = input.substring(indexOf + r.length());
		}
		return true;
	}
	
	public static void main(String[] args) {
		 
//		String uri = "https://mbd.baidu.com/newspage/data/landingsuper?context=%7B%22nid%22%3A%22news_6172758863756121562%22%7D&n_type=0&p_from=1";
//		String reg = "http*://*.baidu.com/*/landingsuper*";
//		String uri = "/sanjianke";
//		String reg = "/";
//		long nanoTime = System.nanoTime();
//		boolean b = matching(reg, uri);
//		long nanoTime2 = System.nanoTime();
//		System.err.println(b);
//		System.err.println((nanoTime2 - nanoTime) / 1000.0 + "us");
// 
		HashMap<String, String > hmtest=new HashMap<String, String>();
		hmtest.put("1", "1");
		HashMap<String, String > hm=new HashMap<String, String>();
		HashMap hm2=new HashMap();
		hm2=hm;
		HashMap hm3=null;
		for(int i=0;i<10;i++) {
			hm3 = new HashMap<String,String>();
			hm3.put("isEnd", "0");     
			hm2.put(i, hm3);
			hm2=hm3;
		}
		

		
	}
	
 



}
