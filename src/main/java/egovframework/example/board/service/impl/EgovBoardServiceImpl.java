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
package egovframework.example.board.service.impl;

import java.util.List;
import egovframework.example.board.service.BoardVO;
import egovframework.example.board.service.EgovBoardService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import javax.annotation.Resource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

/**
 * @Class Name : EgovBoardServiceImpl.java
 * @Description : Board Business Implement Class
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

@Service("boardService")
public class EgovBoardServiceImpl extends EgovAbstractServiceImpl implements EgovBoardService {

	private static final Logger LOGGER = LoggerFactory.getLogger(EgovBoardServiceImpl.class);

	/** BoardDAO */
	// TODO ibatis 사용
//	@Resource(name = "boardDAO")
	//private BoardDAO boardDAO;
	// TODO mybatis 사용
	@Resource(name="boardMapper")
	private BoardMapper boardDAO;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;

	@Override
	public String insertBoard(BoardVO vo) throws Exception {
//		LOGGER.debug(vo.toString());

		/** ID Generation Service */
//		String id = egovIdGnrService.getNextStringId();
//		vo.setId(id);
//		LOGGER.debug(vo.toString());

		boardDAO.insertBoard(vo);
		return vo.getIdx();
	}

	@Override
	public void updateBoard(BoardVO vo) throws Exception {
		boardDAO.updateBoard(vo);
	}

	@Override
	public void deleteBoard(BoardVO vo) throws Exception {
		boardDAO.deleteBoard(vo);
	}

	@Override
	public BoardVO selectBoard(BoardVO vo) throws Exception {
		BoardVO resultVO = boardDAO.selectBoard(vo);
		if (resultVO == null) {
//			throw processException("info.nodata.msg");
			resultVO = new BoardVO();
		}
			
		return resultVO;
	}

	@Override
	public List<?> selectBoardList(BoardVO vo) throws Exception {
		return boardDAO.selectBoardList(vo);
	}

	@Override
	public int selectBoardListTotCnt(BoardVO vo) {
		return boardDAO.selectBoardListTotCnt(vo);
	}
	
	public String loginCheck(BoardVO vo) throws Exception {
		return boardDAO.loginCheck(vo);
	}
	
	public List<?> searchBoardList(BoardVO vo) throws Exception {
		return boardDAO.searchBoardList(vo);
	}
	
	public void updateBoardCount(BoardVO vo) throws Exception {
		boardDAO.updateBoardCount(vo);
	}
	
	public void insertReply(BoardVO vo) throws Exception {
		boardDAO.insertReply(vo);
	}
	
	public String replytCnt(BoardVO vo) {
		return boardDAO.replytCnt(vo);
	}
	
	public List<?> selectReplyList(BoardVO vo) throws Exception {
		return boardDAO.selectReplyList(vo);
	}
}
