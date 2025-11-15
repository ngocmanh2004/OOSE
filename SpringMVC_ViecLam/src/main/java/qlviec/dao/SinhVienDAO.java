package qlviec.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import qlviec.model.SinhVien;
import qlviec.model.TotNghiep;
import qlviec.model.Truong;
import qlviec.model.Nganh;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@Repository
public class SinhVienDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public int insertSinhVien(SinhVien sv) {
        String sql = "INSERT INTO SINHVIEN (SoCMND, HoTen, Email, SoDT, DiaChi) VALUES (?, ?, ?, ?, ?)";
        return jdbcTemplate.update(sql, sv.getSoCMND(), sv.getHoTen(),
                sv.getEmail(), sv.getSoDT(), sv.getDiaChi());
    }

    public int insertTotNghiep(TotNghiep tn) {
        String sql = "INSERT INTO TOT_NGHIEP (SoCMND, MaTruong, MaNganh, HeTN, NgayTN, LoaiTN) " +
                "VALUES (?, ?, ?, ?, ?, ?)";
        return jdbcTemplate.update(sql, tn.getSoCMND(), tn.getMaTruong(),
                tn.getMaNganh(), tn.getHeTN(),
                tn.getNgayTN(), tn.getLoaiTN());
    }

    public boolean checkSinhVienExists(String soCMND) {
        String sql = "SELECT COUNT(*) FROM SINHVIEN WHERE SoCMND = ?";
        Integer count = jdbcTemplate.queryForObject(sql, Integer.class, soCMND);
        return count != null && count > 0;
    }

    public List<Truong> getAllTruong() {
        String sql = "SELECT * FROM TRUONG ORDER BY TenTruong";
        return jdbcTemplate.query(sql, new RowMapper<Truong>() {
            @Override
            public Truong mapRow(ResultSet rs, int rowNum) throws SQLException {
                Truong t = new Truong();
                t.setMaTruong(rs.getString("MaTruong"));
                t.setTenTruong(rs.getString("TenTruong"));
                t.setDiaChi(rs.getString("DiaChi"));
                t.setSoDT(rs.getString("SoDT"));
                return t;
            }
        });
    }

    public List<Nganh> getAllNganh() {
        String sql = "SELECT * FROM NGANH ORDER BY TenNganh";
        return jdbcTemplate.query(sql, new RowMapper<Nganh>() {
            @Override
            public Nganh mapRow(ResultSet rs, int rowNum) throws SQLException {
                Nganh n = new Nganh();
                n.setMaNganh(rs.getString("MaNganh"));
                n.setTenNganh(rs.getString("TenNganh"));
                n.setLoaiNganh(rs.getString("LoaiNganh"));
                return n;
            }
        });
    }

    public List<SinhVien> searchSinhVienBasic(String keyword) {
        String sql = "SELECT * FROM SINHVIEN WHERE 1=1";
        if (keyword != null && !keyword.trim().isEmpty()) {
            sql += " AND (HoTen LIKE ? OR SoCMND LIKE ? OR Email LIKE ?)";
            String searchPattern = "%" + keyword + "%";
            return jdbcTemplate.query(sql, new RowMapper<SinhVien>() {
                @Override
                public SinhVien mapRow(ResultSet rs, int rowNum) throws SQLException {
                    SinhVien sv = new SinhVien();
                    sv.setSoCMND(rs.getString("SoCMND"));
                    sv.setHoTen(rs.getString("HoTen"));
                    sv.setEmail(rs.getString("Email"));
                    sv.setSoDT(rs.getString("SoDT"));
                    sv.setDiaChi(rs.getString("DiaChi"));
                    return sv;
                }
            }, searchPattern, searchPattern, searchPattern);
        } else {
            return jdbcTemplate.query(sql, new RowMapper<SinhVien>() {
                @Override
                public SinhVien mapRow(ResultSet rs, int rowNum) throws SQLException {
                    SinhVien sv = new SinhVien();
                    sv.setSoCMND(rs.getString("SoCMND"));
                    sv.setHoTen(rs.getString("HoTen"));
                    sv.setEmail(rs.getString("Email"));
                    sv.setSoDT(rs.getString("SoDT"));
                    sv.setDiaChi(rs.getString("DiaChi"));
                    return sv;
                }
            });
        }
    }

    public List<Map<String, Object>> searchGradWork(String keyword) {
        String sql = "SELECT sv.SoCMND, sv.HoTen, tn.MaNganh as MaNganhTN, " +
                "tn.MaTruong, cv.MaNganh as MaNganhCV, cv.TenCongTy, cv.ThoiGianLamViec " +
                "FROM SINHVIEN sv " +
                "LEFT JOIN TOT_NGHIEP tn ON sv.SoCMND = tn.SoCMND " +
                "LEFT JOIN CONG_VIEC cv ON sv.SoCMND = cv.SoCMND " +
                "WHERE 1=1";

        if (keyword != null && !keyword.trim().isEmpty()) {
            sql += " AND (sv.HoTen LIKE ? OR sv.SoCMND LIKE ?)";
            String searchPattern = "%" + keyword + "%";
            return jdbcTemplate.queryForList(sql, searchPattern, searchPattern);
        } else {
            return jdbcTemplate.queryForList(sql);
        }
    }
}