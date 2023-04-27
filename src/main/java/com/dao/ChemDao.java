package com.dao;

import com.pojo.Chem;
import com.pojo.ChemCtnt;
import com.pojo.ChemDtl;
import com.pojo.ChemQryRes;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ChemDao {
    List<Chem> qryByKeywords(
            @Param(value="keywords")String keywords,
            @Param(value="type")String type
    );

    List<ChemQryRes> searchChem(
            @Param(value="keywords")String keywords,
            @Param(value="type")String type
    );

    ChemCtnt qryChemContent(
        @Param(value="id")String id
    );

    ChemDtl qryChemDetail(
        @Param(value="id")String id
    );
}
