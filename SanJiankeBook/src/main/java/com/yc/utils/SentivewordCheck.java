package com.yc.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

public class SentivewordCheck {

	// 机器审核小说章节信息
	public Set SensitiveWordCheck(HttpServletRequest request, String c, Set set2) throws IOException {
		SensitivewordFilter sFilter = new SensitivewordFilter(request, set2);
		String path = request.getSession().getServletContext().getRealPath("/");
		c = c.substring(22);// 获取章节地址
		String addres = request.getSession().getServletContext().getRealPath("") + "../" + c;
		File file = new File(addres); // 读取文件
		InputStreamReader read = new InputStreamReader(new FileInputStream(file), "utf-8");
		StringBuffer sBuffer = new StringBuffer();
		if (file.isFile() && file.exists()) { // 文件流是否存在
			BufferedReader bufferedReader = new BufferedReader(read);
			String txt = null;
			while ((txt = bufferedReader.readLine()) != null) { // 读取文件，将文件内容放入到set中
				sBuffer.append(txt);
			}
			bufferedReader.close();
		}
		OutputStreamWriter writ = new OutputStreamWriter(new FileOutputStream(addres));// 新建一个写入流
		Set<String> set = sFilter.getSensitiveWord(sBuffer.toString(), 1);// 获取所有敏感词
		String context = sFilter.replaceSensitiveWord(sBuffer.toString(), 1, "*");// 替换掉敏感词
		writ.write(context);
		writ.close();
		return set;
	}

}
