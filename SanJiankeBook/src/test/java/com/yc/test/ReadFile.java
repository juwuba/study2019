package com.yc.test;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.HashSet;

public class ReadFile {

	public static void main(String[] args) throws IOException {
		File file = new File("D:\\tool\\apache-tomcat-8.0.49-windows-x64 (1)\\apache-tomcat-8.0.49\\webapps\\Novel\\2019\\2\\15\\1cf53a8d84814278a690625d73e135db.html");    //读取文件
		InputStreamReader read = new InputStreamReader(new FileInputStream(file),"utf-8");
		StringBuffer sBuffer=new StringBuffer();
			if(file.isFile() && file.exists()){      //文件流是否存在
				BufferedReader bufferedReader = new BufferedReader(read);
				String txt = null;
				while((txt = bufferedReader.readLine()) != null){    //读取文件，将文件内容放入到set中
					sBuffer.append(txt);
				}
				}
			System.out.println(sBuffer);
			}

}
