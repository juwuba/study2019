package com.yc.biz.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.bean.SensitiveWord;
import com.yc.biz.SensitiveWordbiz;
import com.yc.dao.BaseDao;

@Service
public class SensitiveWordbizImpl implements SensitiveWordbiz {
	private BaseDao bd;

	@Resource(name = "baseDaoMybatisImpl")
	public void setBd(BaseDao bd) {
		this.bd = bd;
	}

	// 查询出所有敏感词汇
	@Override
	public List<SensitiveWord> findSensitiveWord() {
		List<SensitiveWord> list = this.bd.findAll(new SensitiveWord(), "showSensitive");
		return list;
	}

	// 分页查询敏感词汇
	@Override
	public List<SensitiveWord> findSensitiveWordByPage(int start, int end) {
		// TODO Auto-generated method stub
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		List<SensitiveWord> list = this.bd.findAll(new SensitiveWord(), map, "showSensitiveBypage");
		return list;
	}

	@Override
	// 添加一个敏感词汇
	public void addSensitiveWord(SensitiveWord sensitiveword) {
		// TODO Auto-generated method stub
		this.bd.add(sensitiveword, "addSensitiveWord");

	}

	@Override
	// 修改一个敏感词汇
	public void updateSensitiveWord(SensitiveWord sensitiveword) {
		// TODO Auto-generated method stub
		this.bd.update(sensitiveword, "updateSensitiveWord");
	}

}
