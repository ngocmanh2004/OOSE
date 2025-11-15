<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tìm kiếm thông tin sinh viên</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/search.css">
</head>
<body class="search-basic-bg">
    <div class="container search-container">
        <div class="header search-basic-header">
            <a href="${pageContext.request.contextPath}/" class="back-link">← Quay lại trang chủ</a>
            <h1>🔍 Tìm kiếm thông tin Sinh viên</h1>
            <p>Tìm kiếm theo Họ tên, Số CMND hoặc Email</p>
        </div>

        <div class="search-content">
            <form action="${pageContext.request.contextPath}/search/basic-result" method="get" class="search-form">
                <input type="text" name="keyword" class="search-input"
                       placeholder="Nhập từ khóa tìm kiếm..." value="${keyword}">
                <button type="submit" class="btn-search search-basic-btn">🔍 Tìm kiếm</button>
            </form>

            <c:if test="${not empty sinhvienList}">
                <div class="result-info">
                    ✓ Tìm thấy ${sinhvienList.size()} kết quả
                    <c:if test="${not empty keyword}">
                        cho từ khóa: "<strong>${keyword}</strong>"
                    </c:if>
                </div>

                <div class="table-container">
                    <table>
                        <thead class="search-basic-thead">
                            <tr>
                                <th>STT</th>
                                <th>Số CMND</th>
                                <th>Họ và tên</th>
                                <th>Email</th>
                                <th>Số điện thoại</th>
                                <th>Địa chỉ</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${sinhvienList}" var="sv" varStatus="status">
                                <tr>
                                    <td>${status.index + 1}</td>
                                    <td><strong>${sv.soCMND}</strong></td>
                                    <td>${sv.hoTen}</td>
                                    <td>${sv.email}</td>
                                    <td>${sv.soDT}</td>
                                    <td>${sv.diaChi}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>

            <c:if test="${empty sinhvienList && not empty keyword}">
                <div class="empty-state">
                    <div class="empty-state-text">
                        Không tìm thấy kết quả nào cho từ khóa "<strong>${keyword}</strong>"
                    </div>
                </div>
            </c:if>

            <c:if test="${empty sinhvienList && empty keyword}">
                <div class="empty-state">
                    <div class="empty-state-icon">🔎</div>
                    <div class="empty-state-text">
                        Nhập từ khóa để bắt đầu tìm kiếm
                    </div>
                </div>
            </c:if>
        </div>
    </div>
</body>
</html>