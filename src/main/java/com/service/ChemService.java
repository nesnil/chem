package com.service;

import com.pojo.Chem;
import com.pojo.ChemCtnt;
import com.pojo.ChemDtl;
import com.pojo.ChemQryRes;

import java.util.List;

public interface ChemService {
    List<Chem> qryByKeywords(String keyword,String type);
    List<ChemQryRes> searchChem(String keyword, String type);
    ChemCtnt qryChemContent(String id);
    ChemDtl qryChemDetail(String id);
}
