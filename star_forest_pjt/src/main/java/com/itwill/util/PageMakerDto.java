package com.itwill.util;

import java.util.List;

import com.itwill.util.PageMaker;

public class PageMakerDto<E> {
	public List<E> itemList;
	public PageMaker pageMaker;
	public int totRecordCount;

	public PageMakerDto() {
	}

	public PageMakerDto(List<E> itemList, PageMaker pageMaker, int totRecordCount) {
		super();
		this.itemList = itemList;
		this.pageMaker = pageMaker;
		this.totRecordCount = totRecordCount;
	}

}
