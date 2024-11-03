<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<a href="/admin/categories/add">Add Category</a>

<!-- Hiển thị thông báo -->
<c:if test="${message != null}">
    <i>${message}</i>
</c:if>

<!-- Form tìm kiếm -->
<form action="/admin/categories/searchpaginated" method="get">
    <input type="text" name="name" id="name" placeholder="Nhập từ khóa để tìm" />
    <button type="submit">Search</button>
</form>

<!-- Hiển thị bảng danh mục -->
<c:choose>
    <c:when test="${categoryPage.hasContent()}">
        <!-- Bảng cho kết quả tìm kiếm -->
        <table border="1" width="100%">
            <tr>
                <th>STT</th>
                <th>Images</th>
                <th>CategoryID</th>
                <th>CategoryName</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
            <c:forEach items="${categoryPage.content}" var="cate" varStatus="STT">
                <tr>
                    <td>${STT.index + 1}</td>
                    <td>
                        <c:if test="${cate.images != null && cate.images.startsWith('https')}">
                            <img height="150" width="200" src="${cate.images}" />
                        </c:if>
                        <c:if test="${cate.images != null && !cate.images.startsWith('https')}">
                            <c:url value="/image?fname=${cate.images}" var="imgUrl"></c:url>
                            <img height="150" width="200" src="${imgUrl}" />
                        </c:if>
                    </td>
                    <td>${cate.id}</td>
                    <td>${cate.name}</td>
                    <td>
                        <c:choose>
                            <c:when test="${cate.status == 1}">Hoạt động</c:when>
                            <c:otherwise>Khóa</c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <a href="<c:url value='/admin/categories/edit/${cate.id}'/>">Sửa</a> |
                        <a href="<c:url value='/admin/categories/delete/${cate.id}'/>">Xóa</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:when>
    
    <c:otherwise>
        <!-- Bảng hiển thị toàn bộ danh mục khi không có tìm kiếm -->
        <table border="1" width="100%">
            <tr>
                <th>STT</th>
                <th>Images</th>
                <th>CategoryID</th>
                <th>CategoryName</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
            <c:forEach items="${list}" var="cate" varStatus="STT">
                <tr>
                    <td>${STT.index + 1}</td>
                    <td>
                        <c:if test="${cate.images != null && cate.images.startsWith('https')}">
                            <img height="150" width="200" src="${cate.images}" />
                        </c:if>
                        <c:if test="${cate.images != null && !cate.images.startsWith('https')}">
                            <c:url value="/image?fname=${cate.images}" var="imgUrl"></c:url>
                            <img height="150" width="200" src="${imgUrl}" />
                        </c:if>
                    </td>
                    <td>${cate.id}</td>
                    <td>${cate.name}</td>
                    <td>
                        <c:choose>
                            <c:when test="${cate.status == 1}">Hoạt động</c:when>
                            <c:otherwise>Khóa</c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <a href="<c:url value='/admin/categories/edit/${cate.id}'/>">Sửa</a> |
                        <a href="<c:url value='/admin/categories/delete/${cate.id}'/>">Xóa</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:otherwise>
</c:choose>

<!-- Phân trang -->
<form action="">
    Page size:
    <select name="size" id="size" onchange="this.form.submit()">
        <option ${categoryPage.size == 3 ? 'selected':''} value="3">3</option>
        <option ${categoryPage.size == 5 ? 'selected':''} value="5">5</option>
        <option ${categoryPage.size == 10 ? 'selected':''} value="10">10</option>
        <option ${categoryPage.size == 15 ? 'selected':''} value="15">15</option>
        <option ${categoryPage.size == 20 ? 'selected':''} value="20">20</option>
    </select>
</form>

<!-- Liên kết các trang trong kết quả tìm kiếm -->
<c:if test="${categoryPage.totalPages > 1}">
    <ul>
        <c:forEach items="${pageNumbers}" var="pageNumber">
            <li class="${pageNumber == categoryPage.number + 1 ? 'page-item active' : 'page-item'}">
                <a href="<c:url value='/admin/categories/searchpaginated?name=${name}&size=${categoryPage.size}&page=${pageNumber}'/>">${pageNumber}</a>
            </li>
        </c:forEach>
    </ul>
</c:if>
