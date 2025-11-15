package qlviec.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import qlviec.dao.SinhVienDAO;
import qlviec.model.SinhVien;
import qlviec.model.TotNghiep;
import qlviec.model.Truong;
import qlviec.model.Nganh;

import java.util.List;
import java.util.Map;

@Service
public class SinhVienService {

    @Autowired
    private SinhVienDAO sinhVienDAO;

    @Transactional
    public boolean saveSinhVienAndTotNghiep(SinhVien sv, TotNghiep tn) {
        try {
            if (!sinhVienDAO.checkSinhVienExists(sv.getSoCMND())) {
                sinhVienDAO.insertSinhVien(sv);
            }
            sinhVienDAO.insertTotNghiep(tn);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Truong> getAllTruong() {
        return sinhVienDAO.getAllTruong();
    }

    public List<Nganh> getAllNganh() {
        return sinhVienDAO.getAllNganh();
    }

    public List<SinhVien> searchBasic(String keyword) {
        return sinhVienDAO.searchSinhVienBasic(keyword);
    }

    public List<Map<String, Object>> searchGradWork(String keyword) {
        return sinhVienDAO.searchGradWork(keyword);
    }
}