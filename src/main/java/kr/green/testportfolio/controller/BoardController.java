package kr.green.testportfolio.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import kr.green.testportfolio.pagination.Criteria;
import kr.green.testportfolio.pagination.PageMaker;
import kr.green.testportfolio.service.BoardService;
import kr.green.testportfolio.vo.BoardVo;
import kr.green.testportfolio.vo.TestVo;
import kr.green.testportfolio.vo.UserVo;

@Controller
public class BoardController {
	private static final Logger logger =  LoggerFactory.getLogger(BoardController.class);

	private String uploadPath="D:\\kmy\\upfile";
	
	@Autowired
	BoardService boardservice;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String getBoard(Model model, Criteria cri) {
		ArrayList<BoardVo> list = boardservice.getBoard(cri);
		int totalCount = boardservice.getTotalCount(cri);
		PageMaker pm = new PageMaker(totalCount, 2, cri);
		model.addAttribute("pm", pm);
		model.addAttribute("list", list);
		return "/board/list";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String getDetail(Model model,int bNum, Criteria cri) {
		BoardVo board = boardservice.getDetail(bNum);
		model.addAttribute("board", board);
		model.addAttribute("cri", cri);
		return "/board/detail";
	}
	
	@RequestMapping(value = "/updateDetail", method = RequestMethod.GET)
	public String getUpdateDetail(Model model, int bNum) {
		BoardVo board = boardservice.getDetail(bNum);
		model.addAttribute("board", board);
		return "/board/updateDetail";
	}
	
	@RequestMapping(value = "/updateDetail", method = RequestMethod.POST)
	public String postUpdateDetail(Model model, BoardVo board) {
		boardservice.updateDetail(board);
		return "redirect:/list";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String getRegisterBoard(Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		UserVo user = (UserVo)session.getAttribute("user");
		
//		UserVo user = (UserVo)req.getAttribute("user");
		
		model.addAttribute("user", user);
		return "/board/register";
	}
	
	@RequestMapping(value = "/register/test", method = RequestMethod.GET)
	public String getRegisterTest(Model model) {
		return "/board/test";
	}
	
	@RequestMapping(value = "/register/test", method = RequestMethod.POST)
	public String postRegisterTest(Model model, TestVo test01) {
		return "redirect:/register/test";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String postRegisterBoard(Model model, BoardVo board, MultipartFile uploadfile) {
	    logger.info("upload() POST ??????");
	    logger.info("?????? ??????: {}", uploadfile.getOriginalFilename());
	    logger.info("?????? ??????: {}", uploadfile.getSize());
	    saveFile(uploadfile);
	    
		boardservice.insertBoard(board);
		return "redirect:/list";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String postDelete(Model model, HttpServletRequest req, int bNum) {
		boardservice.deleteBoard(bNum);
//		return "board/list";
		return "redirect:/list";
	}
	
	private String saveFile(MultipartFile file){
	    // ?????? ?????? ??????
	    UUID uuid = UUID.randomUUID();
	    String saveName = uuid + "_" + file.getOriginalFilename();
	    logger.info("saveName: {}",saveName);	
	    // File ????????? ??????
	    File saveFile = new File(uploadPath,saveName); // ????????? ?????? ??????, ????????? ?????? ??????

	    try {
	        file.transferTo(saveFile);
	    } catch (IOException e) {
	        e.printStackTrace();
	        return null;
	    }

	    return saveName;
	} // end saveFile(
}


