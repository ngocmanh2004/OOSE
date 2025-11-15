<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hệ thống quản lý việc làm sinh viên</title>
    <!-- 1. Link CSS (Đã fix đường dẫn) -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
</head>
<body>
    <div class="container home-container">
        <div class="header home-header">
            <div class="header-content">
                <h1>🎓 Hệ thống Quản lý Việc làm Sinh viên</h1>
                <p>Theo dõi và thống kê tình hình việc làm sau tốt nghiệp</p>
                <p class="subtitle">Bộ Giáo dục và Đào tạo - Cổng thông tin quốc gia</p>
            </div>
        </div>

        <div class="menu-container">
            <div class="menu-grid">
                <!-- 2. Link đến các trang con (Đã fix đường dẫn) -->
                <a href="${pageContext.request.contextPath}/sinhvien/form" class="menu-item">
                    <div class="menu-content">
                        <span class="menu-icon"></span>
                        <div class="menu-title">Khai báo thông tin</div>
                        <div class="menu-desc">Nhập thông tin sinh viên và tốt nghiệp</div>
                    </div>
                </a>

                <a href="${pageContext.request.contextPath}/search/basic" class="menu-item">
                    <div class="menu-content">
                        <span class="menu-icon"></span>
                        <div class="menu-title">Tìm kiếm cơ bản</div>
                        <div class="menu-desc">Tra cứu thông tin cơ bản sinh viên</div>
                    </div>
                </a>

                <a href="${pageContext.request.contextPath}/search/grad-work" class="menu-item">
                    <div class="menu-content">
                        <span class="menu-icon"></span>
                        <div class="menu-title">Tốt nghiệp & Việc làm</div>
                        <div class="menu-desc">Xem thông tin tốt nghiệp và công việc</div>
                    </div>
                </a>
            </div>
        </div>

        <div class="footer">
            © 2025 Bộ Giáo dục và Đào tạo
        </div>
    </div>
</body>
</html>