package com.itwill.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.domain.Book;
import com.itwill.domain.Rental;
import com.itwill.service.BookService;
import com.itwill.service.BookServiceImpl;
import com.itwill.service.RentalService;

@RestController
public class RentalRestController {
	
	@Autowired
	private RentalService rentalService;
	
	@Autowired
	private BookService bookService;
	
	
	@RequestMapping("/rest_rental")
	public Map rental_tot(int book_no, HttpSession session) throws Exception{
		Map resultMap = new HashMap();
		
		int code = 2;
		String url = "";
		String msg = "";
		List<Rental> resultList = new ArrayList<Rental>();
		
		try {
			String sUserId= (String)session.getAttribute("sUserId");
			sUserId = "soyoon";
//			bookService.updateRentalBookQty(Integer.parseInt(book_noStr));
//			bookService.updateRentalCnt(Integer.parseInt(book_noStr));
			int rental = rentalService.insertRental(new Rental(0, null, null, null, 0, book_no, sUserId));
//			resultList.add(new Rental(0, null, null, null, 0, Integer.parseInt(book_noStr), sUserId));
			if(rental==1) {
				code=1;
				url="";
				msg="신청완료";
			}
		} catch (Exception e) {
			code=2;
			url="";
			msg="오류";
			e.printStackTrace();
		}
		
		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data", resultList);
		
		return resultMap;
	}
	
	/*
	 * @RequestMapping(value = "rest_rental") public String
	 * rental_tot(@RequestParam(value = "book_no") String book_noStr, Model model)
	 * throws Exception{
	 * bookService.updateRentalBookQty(Integer.parseInt(book_noStr));
	 * bookService.updateRentalCnt(Integer.parseInt(book_noStr));
	 * rentalService.insertRental(new Rental(0, null, null, null, 0,
	 * Integer.parseInt(book_noStr), null));
	 * 
	 * return "야호"; }
	 */

}
