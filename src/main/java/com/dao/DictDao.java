package com.dao;

import com.pojo.Dict;
import com.pojo.DictLite;

import java.util.List;

public interface DictDao {
    List<Dict> qryByType(String type);
    List<DictLite> qryCrTypes(String value1);
}
