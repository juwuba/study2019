package com.yc.biz;

import java.util.List;

import com.yc.bean.SensitiveWord;

public interface SensitiveWordbiz {
	// 查询所有敏感词汇
	List<SensitiveWord> findSensitiveWord();

	// 分页查询所有敏感词汇
	List<SensitiveWord> findSensitiveWordByPage(int start, int end);

	// 添加一个敏感词汇
	void addSensitiveWord(SensitiveWord sensitiveword);

	// 修改一个敏感词汇
	void updateSensitiveWord(SensitiveWord sensitiveword);

}
