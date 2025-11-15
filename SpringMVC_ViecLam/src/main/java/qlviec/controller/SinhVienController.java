package qlviec.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import qlviec.model.SinhVien;
import qlviec.model.TotNghiep;
import qlviec.service.SinhVienService;

import java.util.Date;

@Controller
@RequestMapping("/sinhvien")
public class SinhVienController {

    @Autowired
    private SinhVienService sinhVienService;

    @GetMapping("/form")
    public String showForm(Model model) {
        model.addAttribute("truongList", sinhVienService.getAllTruong());
        model.addAttribute("nganhList", sinhVienService.getAllNganh());
        return "sinhvienForm";
    }

    @PostMapping("/save")
    public String saveSinhVien(
            @RequestParam("soCMND") String soCMND,
            @RequestParam("hoTen") String hoTen,
            @RequestParam(value = "email", required = false) String email,
            @RequestParam(value = "soDT", required = false) String soDT,
            @RequestParam(value = "diaChi", required = false) String diaChi,
            @RequestParam("maTruong") String maTruong,
            @RequestParam("maNganh") String maNganh,
            @RequestParam(value = "heTN", required = false) String heTN,
            @RequestParam("ngayTN") @DateTimeFormat(pattern = "yyyy-MM-dd") Date ngayTN,
            @RequestParam(value = "loaiTN", required = false) String loaiTN,
            Model model) {

        if (soCMND == null || soCMND.trim().isEmpty()) {
            model.addAttribute("error", "Số CMND không được để trống!");
            model.addAttribute("truongList", sinhVienService.getAllTruong());
            model.addAttribute("nganhList", sinhVienService.getAllNganh());
            return "sinhvienForm";
        }

        if (maTruong == null || maTruong.trim().isEmpty()) {
            model.addAttribute("error", "Vui lòng chọn trường!");
            model.addAttribute("truongList", sinhVienService.getAllTruong());
            model.addAttribute("nganhList", sinhVienService.getAllNganh());
            return "sinhvienForm";
        }

        if (maNganh == null || maNganh.trim().isEmpty()) {
            model.addAttribute("error", "Vui lòng chọn ngành!");
            model.addAttribute("truongList", sinhVienService.getAllTruong());
            model.addAttribute("nganhList", sinhVienService.getAllNganh());
            return "sinhvienForm";
        }

        if (ngayTN == null) {
            model.addAttribute("error", "Ngày tốt nghiệp không hợp lệ!");
            model.addAttribute("truongList", sinhVienService.getAllTruong());
            model.addAttribute("nganhList", sinhVienService.getAllNganh());
            return "sinhvienForm";
        }

        if (ngayTN.after(new Date())) {
            model.addAttribute("error", "Ngày tốt nghiệp không được trong tương lai!");
            model.addAttribute("truongList", sinhVienService.getAllTruong());
            model.addAttribute("nganhList", sinhVienService.getAllNganh());
            return "sinhvienForm";
        }

        SinhVien sv = new SinhVien();
        sv.setSoCMND(soCMND);
        sv.setHoTen(hoTen);
        sv.setEmail(email);
        sv.setSoDT(soDT);
        sv.setDiaChi(diaChi);

        TotNghiep tn = new TotNghiep();
        tn.setSoCMND(soCMND);
        tn.setMaTruong(maTruong);
        tn.setMaNganh(maNganh);
        tn.setHeTN(heTN);
        tn.setNgayTN(ngayTN);
        tn.setLoaiTN(loaiTN);

        boolean success = sinhVienService.saveSinhVienAndTotNghiep(sv, tn);

        if (success) {
            model.addAttribute("success", "Lưu thông tin sinh viên thành công!");
        } else {
            model.addAttribute("error", "Có lỗi xảy ra khi lưu thông tin!");
        }

        model.addAttribute("truongList", sinhVienService.getAllTruong());
        model.addAttribute("nganhList", sinhVienService.getAllNganh());
        return "sinhvienForm";
    }
}