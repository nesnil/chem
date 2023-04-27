package com.service.impl;

import com.dao.ChemDao;
import com.pojo.Chem;
import com.pojo.ChemCtnt;
import com.pojo.ChemDtl;
import com.pojo.ChemQryRes;
import com.service.ChemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ChemServiceImpl implements ChemService {
    @Autowired
    private ChemDao chemDao;

    @Override
    public List<Chem> qryByKeywords(String keywords,String type) {
        return chemDao.qryByKeywords(keywords,type);
    }

    @Override
    public List<ChemQryRes> searchChem(String keywords, String type) {
        return chemDao.searchChem(keywords,type);
    }

    @Override
    public ChemCtnt qryChemContent(String id) {
        return chemDao.qryChemContent(id);
    }

    @Override
    public ChemDtl qryChemDetail(String id) {
        return chemDao.qryChemDetail(id);
    }

}
