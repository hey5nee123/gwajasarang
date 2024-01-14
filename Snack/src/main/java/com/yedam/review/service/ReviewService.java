package com.yedam.review.service;

import java.util.List;

import com.yedam.review.vo.ReviewVO;

public interface ReviewService {
	public List<ReviewVO> reviewList(String goodsCode);
	public ReviewVO getReview(int reviewCode);
}
