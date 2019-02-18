package com.yc.test;

import java.awt.List;
import java.util.ArrayList;
import java.util.HashMap;

public class MapStudy {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		HashMap map1=new HashMap();
		HashMap map3=map1;
		HashMap<String,String> map2=new HashMap<String,String>();
		map2.put("map2", "map2_value");
		map3.put("map1", map2);
		map3=map2;
		map2=new HashMap<String,String>();
		map2.put("isend", "0");
		map3.put("map3", map2);
		System.out.println(map1);
		System.out.println(map1.get("map1"));
		System.out.println(map1.get("map3"));
		map1=(HashMap) map1.get("map1");
		System.out.println(map1.get("map3"));


//		HashMap<String, String > map3=new HashMap<String, String >();
//		map2.put("map2", "I am map2");
//		System.out.println(map1);
//		System.out.println(map1.get("map2"));
		ArrayList list1=new ArrayList(); //ArrayList list1 - com.yc.test.MapStudy.main(String[])
		ArrayList<String> list2=new ArrayList<String>(); //ArrayList<String> list2 - com.yc.test.MapStudy.main(String[])
		list1=list2; //ArrayList list1 - com.yc.test.MapStudy.main(String[])
		}

}
