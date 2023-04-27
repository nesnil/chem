package com.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pojo.*;
import com.service.ChemService;
import com.utils.SessionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/chem")
public class ChemController {

    protected Logger logger = LoggerFactory.getLogger(ChemController.class);

    @Autowired
    private ChemService chemService;

    @RequestMapping("/qryChem")
    public String list(Model model,String keywords,String type,int pageNum) {
        User user = (User) SessionUtils.getAttr("UserInfo");
        if(user == null || keywords==null || "".equals(keywords) ){
            return "redirect:/";
        }else{
            PageHelper.startPage(pageNum, 10);
            List<ChemQryRes> list = chemService.searchChem(keywords, type);
            PageInfo pageInfo = new PageInfo(list);
            logger.info("pageInfo.getPageNum() - > " + pageInfo.getPageNum());
            logger.info("pageInfo.getPages() - > " + pageInfo.getPages());
            logger.info("pageInfo.getPageSize() - > " + pageInfo.getPageSize());
            logger.info("pageInfo.getTotal() - > " + pageInfo.getTotal());
            model.addAttribute("list", list);
            model.addAttribute("keywords", keywords);
            model.addAttribute("pageNum", pageInfo.getPageNum());
            model.addAttribute("pages", pageInfo.getPages());
            model.addAttribute("pageSize", pageInfo.getPageSize());
            model.addAttribute("total", pageInfo.getTotal());
            model.addAttribute("searchType", type);
            return "lstChem";
        }
    }

    @RequestMapping("/content")
    public String content(Model model,String ctntId,String ctntType,String ctntKeywords) {
        User user = (User) SessionUtils.getAttr("UserInfo");
        if( user == null || ctntId == null ){ return "redirect:/"; }

        logger.info("ctntId -> "+ctntId);
        logger.info("ctntType -> "+ctntType);
        logger.info("ctntKeywords -> "+ctntKeywords);
        if(!"005".equals(ctntType)){
            ChemCtnt ctnt = chemService.qryChemContent(ctntId);
            ctnt.setContent(addPC(ctnt.getContent()));
            model.addAttribute("ctnt", ctnt);
            model.addAttribute("ctntKeywords", ctntKeywords);
            return "content";
        }else{
            ChemDtl dtl = chemService.qryChemDetail(ctntId);
            dtl.setIdx(addP(dtl.getIdx(),ctntKeywords));
            dtl.setCasno(addP(dtl.getCasno(),ctntKeywords));
            dtl.setZywhcdfj(addP(dtl.getZywhcdfj(),ctntKeywords));
            dtl.setDwwhzs(addP(dtl.getDwwhzs(),ctntKeywords));
            dtl.setTitle(addP(dtl.getTitle(),ctntKeywords));
            dtl.setContent(addP(dtl.getContent(),ctntKeywords));
            dtl.setGyJbZwbm(addP(dtl.getGyJbZwbm(),ctntKeywords));
            dtl.setGyJbYwmc(addP(dtl.getGyJbYwmc(),ctntKeywords));
            dtl.setGyJbCas(addP(dtl.getGyJbCas(),ctntKeywords));
            dtl.setGyWxWxfl(addP(dtl.getGyWxWxfl(),ctntKeywords));
            dtl.setGyWxRjx(addP(dtl.getGyWxRjx(),ctntKeywords));
            dtl.setGyWxFsx(addP(dtl.getGyWxFsx(),ctntKeywords));
            dtl.setGyWxRsx(addP(dtl.getGyWxRsx(),ctntKeywords));
            dtl.setGyWxFjcw(addP(dtl.getGyWxFjcw(),ctntKeywords));
            dtl.setGyJjXlyjcl(addP(dtl.getGyJjXlyjcl(),ctntKeywords));
            dtl.setGyJjXcjj(addP(dtl.getGyJjXcjj(),ctntKeywords));
            dtl.setGyAqGzaq(addP(dtl.getGyAqGzaq(),ctntKeywords));
            dtl.setGyAqXfcs(addP(dtl.getGyAqXfcs(),ctntKeywords));
            dtl.setGyAqBlkzhgrfh(addP(dtl.getGyAqBlkzhgrfh(),ctntKeywords));
            dtl.setTsxbqgxtdxYcjc(addP(dtl.getTsxbqgxtdxYcjc(),ctntKeywords));
            dtl.setTsxbqgxtdxFfjc(addP(dtl.getTsxbqgxtdxFfjc(),ctntKeywords));
            dtl.setQt(addP(dtl.getQt(),ctntKeywords));
            dtl.setWhCsWgyxz(addP(dtl.getWhCsWgyxz(),ctntKeywords));
            dtl.setWhCsMdbz(addP(dtl.getWhCsMdbz(),ctntKeywords));
            dtl.setWhCsRdngd(addP(dtl.getWhCsRdngd(),ctntKeywords));
            dtl.setWhCsFd(addP(dtl.getWhCsFd(),ctntKeywords));
            dtl.setWhCsZqmd(addP(dtl.getWhCsZqmd(),ctntKeywords));
            dtl.setWhCsSd(addP(dtl.getWhCsSd(),ctntKeywords));
            dtl.setWhLhtx(addP(dtl.getWhLhtx(),ctntKeywords));
            dtl.setWhRsx(addP(dtl.getWhRsx(),ctntKeywords));
            dtl.setWhRjx(addP(dtl.getWhRjx(),ctntKeywords));
            dtl.setWhFjcw(addP(dtl.getWhFjcw(),ctntKeywords));
            dtl.setWhWdxjfyx(addP(dtl.getWhWdxjfyx(),ctntKeywords));
            dtl.setJcjh(addP(dtl.getJcjh(),ctntKeywords));
            dtl.setBltj(addP(dtl.getBltj(),ctntKeywords));
            dtl.setDddlx(addP(dtl.getDddlx(),ctntKeywords));
            dtl.setZdjl(addP(dtl.getZdjl(),ctntKeywords));
            dtl.setLcbx(addP(dtl.getLcbx(),ctntKeywords));
            dtl.setXcjj(addP(dtl.getXcjj(),ctntKeywords));
            dtl.setZd(addP(dtl.getZd(),ctntKeywords));
            dtl.setZl(addP(dtl.getZl(),ctntKeywords));
            dtl.setJej(addP(dtl.getJej(),ctntKeywords));
            dtl.setYh(addP(dtl.getYh(),ctntKeywords));
            dtl.setXlyjcl(addP(dtl.getXlyjcl(),ctntKeywords));
            dtl.setGzaq(addP(dtl.getGzaq(),ctntKeywords));
            dtl.setXfcs(addP(dtl.getXfcs(),ctntKeywords));
            dtl.setBlkzhgrfh(addP(dtl.getBlkzhgrfh(),ctntKeywords));
            dtl.setCzczycc(addP(dtl.getCzczycc(),ctntKeywords));
            dtl.setFqcz(addP(dtl.getFqcz(),ctntKeywords));
            dtl.setYsxx(addP(dtl.getYsxx(),ctntKeywords));
            dtl.setFg(addP(dtl.getFg(),ctntKeywords));
            dtl.setZyjcxz(addP(dtl.getZyjcxz(),ctntKeywords));
            dtl.setXgbz(addP(dtl.getXgbz(),ctntKeywords));
            dtl.setSwxz(addP(dtl.getSwxz(),ctntKeywords));
            dtl.setFgqt(addP(dtl.getFgqt(),ctntKeywords));
            model.addAttribute("dtl", dtl);
            return "detail";
        }
    }
    private String addP(String ctnt, String keywords){
        if(ctnt==null||"".equals(ctnt)){
            return "";
        }
        ctnt = "<p>"+ctnt+"</p>";
        ctnt = ctnt.replaceAll("[\\n\\r]","</p><p>");
        ctnt = ctnt.replaceAll("[\\s\\t]","&nbsp;");
        ctnt = ctnt.replaceAll("m↑3","m<sup>3</sup>");
        ctnt = ctnt.replaceAll("m\\^3","m<sup>3</sup>");
        String[] kws = keywords.split(" ");
        for(String kw:kws){
            ctnt = ctnt.replaceAll(kw,"<span style=\"background-color: yellow;padding: 0;margin: 0;\">"+kw+"</span>");
        }
        return ctnt;
    }
    private String addPC(String ctnt){
        if(ctnt==null||"".equals(ctnt)){
            return "";
        }
        ctnt = "<p>"+ctnt+"</p>";
        ctnt = ctnt.replaceAll("[\\n\\r]","</p><p>");
        ctnt = ctnt.replaceAll("[\\s\\t]","&nbsp;");
        ctnt = ctnt.replaceAll("m↑3","m<sup>3</sup>");
        ctnt = ctnt.replaceAll("m\\^3","m<sup>3</sup>");
        return ctnt;
    }
}
