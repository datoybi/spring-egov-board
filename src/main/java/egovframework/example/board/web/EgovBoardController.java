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
		int totCnt = boardService.selectBoardListTotCnt(boardVO);
//		System.out.println("[System.out] " + totCnt);
		
		List<?> list = boardService.selectBoardList(boardVO);
		System.out.println("[System.out] " + list);

		model.addAttribute("resultList", list);
		return "board/list";
	}
	
	@RequestMapping(value ="/detail.do")
	public String detail() throws Exception {
		return "board/detail";
	}

	@RequestMapping(value ="/write.do")
	public String write() throws Exception {
		return "board/write";
	}

	@RequestMapping(value ="/login.do", method = RequestMethod.POST)
	public String login(@ModelAttribute("boardVO") BoardVO boardVO, @RequestParam("loginid") String loginid, @RequestParam("loginpwd") String loginpwd, HttpServletRequest request, RedirectAttributes redirectAttributes) throws Exception {
//		System.out.println("[System.out] " + loginid + " , " + loginpwd);

		BoardVO vo = new BoardVO();
		vo.setPassword(loginpwd);
		vo.setUserId(loginid);
				
		String userName = boardService.loginCheck(vo);
		if(userName != null) {
			request.getSession().setAttribute("loginid", loginid);
			request.getSession().setAttribute("userName", userName);
		} else {
			redirectAttributes.addFlashAttribute("loginMsg" , false);
		}
		
		return "redirect:/list.do";
	}
	
	@RequestMapping(value ="/logout.do")
	public String login(HttpServletRequest request) throws Exception {
		System.out.println("[System.out] " + request.getSession().getAttribute("loginid"));
		System.out.println("[System.out] " + request.getSession().getAttribute("userName"));
		
		request.getSession().invalidate();
		
		System.out.println("[System.out] " + request.getSession().getAttribute("loginid"));
		System.out.println("[System.out] " + request.getSession().getAttribute("userName"));
	
		return "redirect:/list.do";
		
				
	}

//	/**
//	 * 글 등록 화면을 조회한다.
//	 * @param boardVO - 목록 조회조건 정보가 담긴 VO
//	 * @param model
//	 * @return "egovBoardRegister"
//	 * @exception Exception
//	 */
//	@RequestMapping(value = "/addBoard.do", method = RequestMethod.GET)
//	public String addBoardView(@ModelAttribute("boardVO") BoardDefaultVO boardVO, Model model) throws Exception {
//		model.addAttribute("boardVO", new BoardVO());
//		return "board/egovBoardRegister";
//	}
//
//	/**
//	 * 글을 등록한다.
//	 * @param boardVO - 등록할 정보가 담긴 VO
//	 * @param boardVO - 목록 조회조건 정보가 담긴 VO
//	 * @param status
//	 * @return "forward:/egovBoardList.do"
//	 * @exception Exception
//	 */
//	@RequestMapping(value = "/addBoard.do", method = RequestMethod.POST)
//	public String addBoard(@ModelAttribute("boardVO") BoardDefaultVO boardVO, BoardVO boardVO, BindingResult bindingResult, Model model, SessionStatus status)
//			throws Exception {
//
//		// Server-Side Validation
//		beanValidator.validate(boardVO, bindingResult);
//
//		if (bindingResult.hasErrors()) {
//			model.addAttribute("boardVO", boardVO);
//			return "board/egovBoardRegister";
//		}
//
//		boardService.insertBoard(boardVO);
//		status.setComplete();
//		return "forward:/egovBoardList.do";
//	}
//
//	/**
//	 * 글 수정화면을 조회한다.
//	 * @param id - 수정할 글 id
//	 * @param boardVO - 목록 조회조건 정보가 담긴 VO
//	 * @param model
//	 * @return "egovBoardRegister"
//	 * @exception Exception
//	 */
//	@RequestMapping("/updateBoardView.do")
//	public String updateBoardView(@RequestParam("selectedId") String id, @ModelAttribute("boardVO") BoardDefaultVO boardVO, Model model) throws Exception {
//		BoardVO boardVO = new BoardVO();
//		boardVO.setId(id);
//		// 변수명은 CoC 에 따라 boardVO
//		model.addAttribute(selectBoard(boardVO, boardVO));
//		return "board/egovBoardRegister";
//	}
//
//	/**
//	 * 글을 조회한다.
//	 * @param boardVO - 조회할 정보가 담긴 VO
//	 * @param boardVO - 목록 조회조건 정보가 담긴 VO
//	 * @param status
//	 * @return @ModelAttribute("boardVO") - 조회한 정보
//	 * @exception Exception
//	 */
//	public BoardVO selectBoard(BoardVO boardVO, @ModelAttribute("boardVO") BoardDefaultVO boardVO) throws Exception {
//		return boardService.selectBoard(boardVO);
//	}
//
//	/**
//	 * 글을 수정한다.
//	 * @param boardVO - 수정할 정보가 담긴 VO
//	 * @param boardVO - 목록 조회조건 정보가 담긴 VO
//	 * @param status
//	 * @return "forward:/egovBoardList.do"
//	 * @exception Exception
//	 */
//	@RequestMapping("/updateBoard.do")
//	public String updateBoard(@ModelAttribute("boardVO") BoardDefaultVO boardVO, BoardVO boardVO, BindingResult bindingResult, Model model, SessionStatus status)
//			throws Exception {
//
//		beanValidator.validate(boardVO, bindingResult);
//
//		if (bindingResult.hasErrors()) {
//			model.addAttribute("boardVO", boardVO);
//			return "board/egovBoardRegister";
//		}
//
//		boardService.updateBoard(boardVO);
//		status.setComplete();
//		return "forward:/egovBoardList.do";
//	}
//
//	/**
//	 * 글을 삭제한다.
//	 * @param boardVO - 삭제할 정보가 담긴 VO
//	 * @param boardVO - 목록 조회조건 정보가 담긴 VO
//	 * @param status
//	 * @return "forward:/egovBoardList.do"
//	 * @exception Exception
//	 */
//	@RequestMapping("/deleteBoard.do")
//	public String deleteBoard(BoardVO boardVO, @ModelAttribute("boardVO") BoardDefaultVO boardVO, SessionStatus status) throws Exception {
//		boardService.deleteBoard(boardVO);
//		status.setComplete();
//		return "forward:/egovBoardList.do";
//	}

}
