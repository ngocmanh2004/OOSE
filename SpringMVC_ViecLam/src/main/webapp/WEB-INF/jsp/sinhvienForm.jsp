<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Khai báo thông tin Sinh viên</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/form.css">
</head>
<body>
    <div class="container">
        <div class="header form-header">
            <h1>📝 Khai báo thông tin Sinh viên</h1>
            <p>Vui lòng điền đầy đủ thông tin để hoàn tất khai báo</p>
            <a href="${pageContext.request.contextPath}/" class="back-link">← Quay lại trang chủ</a>
        </div>

        <div class="form-container">
            <c:if test="${not empty success}">
                <div class="alert alert-success">
                    ✓ ${success}
                </div>
            </c:if>

            <c:if test="${not empty error}">
                <div class="alert alert-error">
                    ✗ ${error}
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/sinhvien/save" method="post">
                <div class="form-section">
                    <h2 class="section-title">Thông tin cá nhân</h2>

                    <div class="form-group">
                        <label for="soCMND">Số CMND/CCCD <span class="required">*</span></label>
                        <input type="text" id="soCMND" name="soCMND" required
                               placeholder="Nhập số CMND/CCCD" maxlength="20">
                    </div>

                    <div class="form-group">
                        <label for="hoTen">Họ và tên</label>
                        <input type="text" id="hoTen" name="hoTen"
                               placeholder="Nhập họ và tên đầy đủ" maxlength="100">
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email"
                                   placeholder="example@email.com">
                        </div>

                        <div class="form-group">
                            <label for="soDT">Số điện thoại</label>
                            <input type="text" id="soDT" name="soDT"
                                   placeholder="Nhập số điện thoại" maxlength="15">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="diaChi">Địa chỉ</label>
                        <input type="text" id="diaChi" name="diaChi"
                               placeholder="Nhập địa chỉ" maxlength="300">
                    </div>
                </div>

                <div class="form-section">
                    <h2 class="section-title">Thông tin tốt nghiệp</h2>

                    <div class="form-group">
                        <label for="maTruong">Trường tốt nghiệp <span class="required">*</span></label>
                        <select id="maTruong" name="maTruong" required>
                            <option value="">-- Chọn trường --</option>
                            <c:forEach items="${truongList}" var="truong">
                                <option value="${truong.maTruong}">${truong.tenTruong}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="maNganh">Ngành tốt nghiệp <span class="required">*</span></label>
                        <select id="maNganh" name="maNganh" required>
                            <option value="">-- Chọn ngành --</option>
                            <c:forEach items="${nganhList}" var="nganh">
                                <option value="${nganh.maNganh}">${nganh.tenNganh} (${nganh.loaiNganh})</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="heTN">Hệ đào tạo</label>
                            <select id="heTN" name="heTN">
                                <option value="">-- Chọn hệ --</option>
                                <option value="Chính quy">Chính quy</option>
                                <option value="Vừa làm vừa học">Vừa làm vừa học</option>
                                <option value="Từ xa">Từ xa</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="ngayTN">Ngày tốt nghiệp <span class="required">*</span></label>
                            <input type="date" id="ngayTN" name="ngayTN" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="loaiTN">Loại tốt nghiệp</label>
                        <select id="loaiTN" name="loaiTN">
                            <option value="">-- Chọn loại --</option>
                            <option value="Xuất sắc">Xuất sắc</option>
                            <option value="Giỏi">Giỏi</option>
                            <option value="Khá">Khá</option>
                            <option value="Trung bình">Trung bình</option>
                        </select>
                    </div>
                </div>

                <div class="btn-container">
                    <button type="submit" class="btn btn-primary">Lưu thông tin</button>
                    <button type="reset" class="btn btn-secondary">Nhập lại</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>