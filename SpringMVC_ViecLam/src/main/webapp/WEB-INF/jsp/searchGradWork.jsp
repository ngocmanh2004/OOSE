<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tìm kiếm thông tin tốt nghiệp và việc làm</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/search.css">
</head>
<body class="search-gradwork-bg">
    <div class="container search-container-wide">
        <div class="header search-gradwork-header">
            <a href="${pageContext.request.contextPath}/" class="back-link">← Quay lại trang chủ</a>
            <h1>🎓 Tìm kiếm thông tin Tốt nghiệp & Việc làm</h1>
            <p>Xem thông tin tốt nghiệp và công việc hiện tại của sinh viên</p>
        </div>

        <div class="search-content">
            <form action="${pageContext.request.contextPath}/search/grad-work-result" method="get" class="search-form">
                <input type="text" name="keyword" class="search-input"
                       placeholder="Nhập họ tên hoặc số CMND để tìm kiếm..." value="${keyword}">
                <button type="submit" class="btn-search search-gradwork-btn">🔍 Tìm kiếm</button>
            </form>

            <c:if test="${not empty resultList}">
                <div class="result-info result-info-blue">
                    ✓ Tìm thấy ${resultList.size()} kết quả
                    <c:if test="${not empty keyword}">
                        cho từ khóa: "<strong>${keyword}</strong>"
                    </c:if>
                </div>

                <div class="table-container">
                    <table>
                        <thead class="search-gradwork-thead">
                            <tr>
                                <th>STT</th>
                                <th>Số CMND</th>
                                <th>Họ và tên</th>
                                <th>Ngành TN</th>
                                <th>Trường TN</th>
                                <th>Ngành CV</th>
                                <th>Tên công ty</th>
                                <th>Thời gian LV</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${resultList}" var="item" varStatus="status">
                                <tr>
                                    <td>${status.index + 1}</td>
                                    <td><strong>${item.SoCMND}</strong></td>
                                    <td>${item.HoTen}</td>
                                    <td>
                                        <c:if test="${not empty item.MaNganhTN}">
                                            <span class="badge badge-success">${item.MaNganhTN}</span>
                                        </c:if>
                                    </td>
                                    <td>${item.MaTruong}</td>
                                    <td>
                                        <c:if test="${not empty item.MaNganhCV}">
                                            <span class="badge badge-warning">${item.MaNganhCV}</span>
                                        </c:if>
                                    </td>
                                    <td>${item.TenCongTy}</td>
                                    <td>
                                        <c:if test="${not empty item.ThoiGianLamViec}">
                                            ${item.ThoiGianLamViec} tháng
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>

            <c:if test="${empty resultList && not empty keyword}">
                <div class="empty-state">
                    <div class="empty-state-text">
                        Không tìm thấy kết quả nào cho từ khóa "<strong>${keyword}</strong>"
                    </div>
                </div>
            </c:if>

            <c:if test="${empty resultList && empty keyword}">
                <div class="empty-state">
                    <div class="empty-state-icon">🔎</div>
                    <div class="empty-state-text">
                        Nhập từ khóa để bắt đầu tìm kiếm thông tin tốt nghiệp và việc làm
                    </div>
                </div>
            </c:if>
        </div>
    </div>
</body>
</html>