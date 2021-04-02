package kr.green.testportfolio.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.green.testportfolio.pagination.Criteria;
import kr.green.testportfolio.pagination.PageMaker;
import kr.green.testportfolio.service.GoodsService;
import kr.green.testportfolio.vo.CategoryVo;
import kr.green.testportfolio.vo.GoodsVo;
import kr.green.testportfolio.vo.UserVo;
import net.sf.json.JSONArray;

@Controller
public class GoodsController {
	private static final Logger logger =  LoggerFactory.getLogger(GoodsController.class);

	private String uploadPath="D:\\kmy\\upfile";
	
	@Autowired
	GoodsService goodsService;

	@RequestMapping(value = "/list/goods", method = RequestMethod.GET)
	public String getListGoods(Model model, Criteria cri) {
		ArrayList<GoodsVo> gdslist = goodsService.getListGoods(cri);
		int totalCount = goodsService.getGoodsTotalCount(cri);
		PageMaker pm = new PageMaker(totalCount, 2, cri);
		model.addAttribute("pm", pm);
		model.addAttribute("gdslist", gdslist);
		return "/goods/goodsList";
	}

	@RequestMapping(value = "/register/goods", method = RequestMethod.GET)
	public String getRegisterGoodsBoard(Model model, HttpServletRequest req) {
		logger.info("register/goods 호출");
		HttpSession session = req.getSession();
		UserVo user = (UserVo)session.getAttribute("user");
		
		List<CategoryVo> category = goodsService.selectCategory();
		
		model.addAttribute("user", user);
		model.addAttribute("category", JSONArray.fromObject(category));

		return "/goods/goods";
	}
	
	@RequestMapping(value = "/register/goods", method = RequestMethod.POST)
	public String postRegisterGoods(Model model, CategoryVo category, MultipartFile uploadfile, GoodsVo goods) throws IOException {

		logger.info("registerGoodsPost");

		if(uploadfile != null) {
			logger.info("originalName:" + uploadfile.getOriginalFilename());
			logger.info("size:" + uploadfile.getSize());
			logger.info("ContentType:" + uploadfile.getContentType());
		}
		String savedName = saveFile(uploadfile, goods);
//		goods.setOrg_file_name(uploadfile.getOriginalFilename());
//		goods.setSave_file_name(savedName);
//		String savedName = uploadFile(uploadfile.getOriginalFilename(), uploadfile.getBytes(), goods);
//		boardservice.insertCategory(category);
		goodsService.insertGoods(goods);
//		model.addAttribute("savedName", savedName);
		
		return "redirect:/list";
	}
	
	@RequestMapping(value = "/goods/goodsDetail", method = RequestMethod.GET)
	public String getDetail(Model model,int gNum, Criteria cri) {
		GoodsVo goods = goodsService.getGoodsDetail(gNum);
		model.addAttribute("goods", goods);
		model.addAttribute("cri", cri);
		return "/goods/goodsDetail";
	}
	
	//업로드된 파일을 저장하는 함수
	private String uploadFile(String originalName, byte[] fileDate) throws IOException {
		UUID uid = UUID.randomUUID();
		
		String savedName = uid.toString() + "_" + originalName;
		File target = new File(uploadPath, savedName);
		
		FileCopyUtils.copy(fileDate, target);
		return savedName;		
	}
	
	private String saveFile(MultipartFile file){
	    // 파일 이름 변경
	    UUID uuid = UUID.randomUUID();
	    String saveName = uuid + "_" + file.getOriginalFilename();
	    logger.info("saveName: {}",saveName);	
	    // File 객체를 생성
	    File saveFile = new File(uploadPath,saveName); // 저장할 폴더 이름, 저장할 파일 이름

	    try {
	        file.transferTo(saveFile);
	    } catch (IOException e) {
	        e.printStackTrace();
	        return null;
	    }

	    return saveName;
	} // end saveFile(
	
	private String saveFile(MultipartFile file, GoodsVo goods){
	    // 파일 이름 변경
	    UUID uuid = UUID.randomUUID();
	    String saveName = uuid + "_" + file.getOriginalFilename();
	    logger.info("saveName: {}",saveName);	
	    goods.setOrg_file_name(file.getOriginalFilename());
	    goods.setSave_file_name(saveName);
	    System.out.println(goods.getSave_file_name());
	    // 저장할 File 객체를 생성(껍데기 파일)ㄴ
	    File saveFile = new File(uploadPath,saveName); // 저장할 폴더 이름, 저장할 파일 이름

	    try {
	        file.transferTo(saveFile); // 업로드 파일에 saveFile이라는 껍데기 입힘
	    } catch (IOException e) {
	        e.printStackTrace();
	        return null;
	    }

	    return saveName;
	} // end saveFile(
	
	@ResponseBody
	@RequestMapping("download")
	public ResponseEntity<byte[]> downloadFile(String fileName)throws Exception{
	    InputStream in = null;
	    ResponseEntity<byte[]> entity = null;
	    try{
	        String FormatName = fileName.substring(fileName.lastIndexOf(".")+1);
	        HttpHeaders headers = new HttpHeaders();
	        in = new FileInputStream(uploadPath+fileName);

	        fileName = fileName.substring(fileName.indexOf("_")+1);
	        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
	        headers.add("Content-Disposition",  "attachment; filename=\"" 
				+ new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
	        entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),headers,HttpStatus.CREATED);
	    }catch(Exception e) {
	        e.printStackTrace();
	        entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
	    }finally {
	        in.close();
	    }
	    return entity;
	}
}
