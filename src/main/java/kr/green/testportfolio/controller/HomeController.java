package kr.green.testportfolio.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.green.testportfolio.pagination.Criteria;
import kr.green.testportfolio.pagination.PageMaker;
import kr.green.testportfolio.service.BoardService;
import kr.green.testportfolio.service.UserService;
import kr.green.testportfolio.vo.BoardVo;
import kr.green.testportfolio.vo.UserVo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	UserService userservice;
	
	@Autowired
	BoardService boardservice;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, Locale locale, Criteria cri) {
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate);
		ArrayList<BoardVo> list = boardservice.getBoard(cri);
		model.addAttribute("list", list);
		return "/main/home";
	}

	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signUp(Model model) {
		System.out.println(userservice.getUser("aaa111"));
		return "/signup/signUp";
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signUp(Model model, UserVo user) {
//		System.out.println(user);
		String pw = user.getPassword();
		String encPw = passwordEncoder.encode(pw);
		user.setPassword(encPw);
		userservice.insertUser(user);
		
		return "/signup/signUp";
	}
	
	@RequestMapping(value = "/iCheck", method = RequestMethod.POST)
	@ResponseBody
	public String iCheckPost(String id) {
		UserVo user = userservice.getUser(id);
		if(user == null)
			return "not user"; 
		return "user";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String getLogin(Model model) {
		
		return "/login/Login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String postLogin(Model model, HttpServletRequest req, @RequestParam("id")String id,@RequestParam("pw")String pw) {
		logger.info("post login");
		UserVo user = userservice.getUserById(id);
		if(user != null && passwordEncoder.matches(pw, user.getPassword())) {
			model.addAttribute("user", user);
			return "redirect:/";
		}else {
			return "redirect:/login";
		}
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutGet(Model model, HttpServletRequest req) {
		
		req.getSession().removeAttribute("user");
		//getHeader??? header??? ??????? <= ??? ????????? null ?????? ???????????? null ??????
		String referer = req.getHeader("Referer");
		System.out.println(referer);
		return "redirect:"+referer;
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyUserGet(Model model, HttpServletRequest req) {
//		UserVo user = (UserVo)req.getAttribute("user");
//		model.addAttribute("user", user);
		ArrayList<UserVo> modifyUser = userservice.getAllUser();
		model.addAttribute("list", modifyUser);
		return "/main/modifyUser";
	}
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String myPageGet(Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		UserVo user = (UserVo)session.getAttribute("user");

		if(user == null) {
			return "/main/home";
		}else {
			System.out.println("??????");
			model.addAttribute("user", user);	
			return "/main/myPage";
		}
	}
	
	@RequestMapping(value = "/mypage", method = RequestMethod.POST)
	public String myPagePost(Model model, HttpServletRequest req, String pw) {
		//session??? ?????? ???????????????. ??? ?????? session getAttribute??? ?????? ?????? ????????????? 
		//????????? ????????? ?????????????????? ???????????? ???????????? ????????? ????????? ??????
//		HttpSession session = req.getSession();
//		UserVo user = (UserVo)session.getAttribute("login");
//		model.addAttribute("user", user);
		//
		HttpSession session = req.getSession();
		req.getSession();
		UserVo mypage = userservice.updateUser(pw);
		return "/main/home";
	}
	
	@RequestMapping(value = "/ajaxModify", method = RequestMethod.POST)
	public String ajaxModifyGet(Model model, HttpServletRequest req) {
		System.out.println("??????????");
		ArrayList<UserVo> modifyUser = userservice.getAllUser();
		model.addAttribute("list", modifyUser);
		return "/main/modifyUser";
	}
	
	@RequestMapping(value = "/find/pw", method = RequestMethod.GET)
	public String getFindPw(Model model) {

		return "/login/findPw";
	}
	
	@RequestMapping(value = "/find/pw", method = RequestMethod.POST)
	public String postFindPw(Model model, String id, String email) {
		UserVo user = userservice.getUser(id);
		System.out.println(user);
		System.out.println(email);
		if(email.equals(user.getEmail())) {
			//??? ???????????? ????????? ??????
			System.out.println(user);
			System.out.println(email);
			System.out.println("??????");
			String setfrom = "q23dp2@gmail.com";         
		    String tomail  = user.getEmail();     // ?????? ?????? ?????????
		    String title   = id + "??? ???????????? ??????";      // ??????
		    String content = "??? ???????????? : ";    // ??????
		    
		    try {
		        MimeMessage message = mailSender.createMimeMessage();
		        MimeMessageHelper messageHelper 
		            = new MimeMessageHelper(message, true, "UTF-8");

		        messageHelper.setFrom(setfrom);  // ??????????????? ??????????????? ?????? ??????????????? ??????
		        messageHelper.setTo(tomail);     // ???????????? ?????????
		        messageHelper.setSubject(title); // ??????????????? ????????? ????????????
		        messageHelper.setText(content);  // ?????? ??????

		        mailSender.send(message);
		    } catch(Exception e){
		        System.out.println(e);

		    }
			System.out.println("??????");
		}
		return "/login/findPw";
	}
	
}
