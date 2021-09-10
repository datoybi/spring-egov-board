/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.example.board.web;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import egovframework.example.board.service.EgovBoardService;
import egovframework.example.board.service.BoardVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springmodules.validation.commons.DefaultBeanValidator;


/**
 * @Class Name : EgovBoardController.java
 * @Description : EgovBoard Controller Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */

@Controller
public class EgovBoardController {

	/** EgovBoardService */
	@Resource(name = "boardService")
	private EgovBoardService boardService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	@RequestMapping(value = "/list.do")
	public String list(@ModelAttribute("boardVO") BoardVO boardVO, Model model) throws Exception {
		/** EgovPropertyService.sample */
		boardVO.setPageUnit(propertiesService.getInt("pageUnit"));
		boardVO.setPageSize(propertiesService.getInt("pageSize"));

		/** paging setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());

		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		int totCnt = boardService.selectBoardListTotCnt(boardVO);
		List<?> list = boardService.searchBoardList(boardVO);
				
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("resultList", list);
		return "board/list";
	}
	
	@RequestMapping(value ="/detail.do")
	public String detail(@ModelAttribute("boardVO") BoardVO boardVO, ModelMap model) throws Exception {
	 	
	 	System.out.println("[System.out] detail idx: " + boardVO.getIdx());
		boardService.updateBoardCount(boardVO); // 조회수 증가
		
		boardVO = boardService.selectBoard(boardVO);
		model.addAttribute("result", boardVO);

	 	List<?> replyList = boardService.selectReplyList(boardVO);
	 	model.addAttribute("replyList", replyList);
	 	
		return "board/detail";
	}

	@RequestMapping(value ="/write.do",  method = RequestMethod.GET)
	public String write(@ModelAttribute("boardVO") BoardVO boardVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		boardVO = boardService.selectBoard(boardVO);
		boardVO.setWriter(request.getSession().getAttribute("loginid").toString()); // 세션에서 userid 가져오기

		model.addAttribute("result", boardVO);
		return "board/write";
	}
	
	@RequestMapping(value = "/write.do", method = RequestMethod.POST)
	public String write(@ModelAttribute("boardVO") BoardVO boardVO, @RequestParam("mode") String mode) throws Exception {
		
		if(mode.equals("write")) { // 글작성에서 왔을 떄	
			boardService.insertBoard(boardVO);
		} else if (mode.equals("update")) { // 업데이트에서 왔을 떄	
			boardService.updateBoard(boardVO);
		} else if (mode.equals("delete")){
			boardService.deleteBoard(boardVO);
		}

		return "redirect:/list.do";
	}

	@RequestMapping(value ="/login.do")
	public String login(@ModelAttribute("boardVO") BoardVO boardVO, HttpServletRequest request, RedirectAttributes redirectAttributes) throws Exception {
		String userName = boardService.loginCheck(boardVO);
		if(userName != null) {
			request.getSession().setAttribute("loginid", boardVO.getUserId());
			request.getSession().setAttribute("userName", userName);
		} else {
			redirectAttributes.addFlashAttribute("loginMsg" , false);
		}
		
		return "redirect:/list.do";
	}
	
	@RequestMapping(value ="/logout.do")
	public String login(HttpServletRequest request) throws Exception {		
		request.getSession().invalidate();
		return "redirect:/list.do";		
	}
	
	@RequestMapping(value="/reply.do", method = RequestMethod.POST)
	public String reply(@ModelAttribute("boardVO") BoardVO boardVO, ModelMap model, @RequestParam("mode") String mode) throws Exception {
		
		if(mode.equals("write")){
			String seq = boardService.replytCnt(boardVO); // seq 세팅을 위해 댓글 수 가져오기
		 	boardVO.setSeq(seq);
		 	boardService.insertReply(boardVO);

		} else if(mode.equals("update")){
			boardService.updateReply(boardVO);
		} else if(mode.equals("delete")){
			boardService.deleteReply(boardVO);
		}
		
	 	List<?> replyList = boardService.selectReplyList(boardVO);	 	
	 	model.addAttribute("replyList", replyList);
	 	
		return "redirect:/detail.do?idx=" + boardVO.getIdx();
	}	
}
