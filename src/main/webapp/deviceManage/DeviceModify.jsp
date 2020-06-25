<%@ page import="Sogong.IMS.model.Package" %>
<%@ page import="Sogong.IMS.dao.PackageDAO" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="Sogong.IMS.model.Facility" %>
<%@ page import="Sogong.IMS.dao.FacilityDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-datepicker.css">

    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap-datepicker.js"></script>

    <link href="${pageContext.request.contextPath}/css/bootstrap.css" property='stylesheet' rel='stylesheet'
          type="text/css" media="screen"/>
    <link href="${pageContext.request.contextPath}/css/dashboard.css" property='stylesheet' rel='stylesheet'
          type="text/css" media="screen"/>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css"/>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
    <title>시설 수정</title>
</head>
<%
    String url = request.getRequestURI();
    String servletPath = request.getServletPath();
    String facilityID = url.substring(servletPath.length()).split("/")[1];
    System.out.println(facilityID);
    HashMap<String,Object> conditions = new HashMap<>();
    conditions.put("facilityID", facilityID);
    Facility facility = FacilityDAO.getInstance().lookup(conditions)[0];
    pageContext.setAttribute("facility", facility);
%>

<body>
<div class="container">
    <div class="row col-auto justify-content-center mt-5">
        <form action="${pageContext.request.contextPath}/facilityManage/modify.do" method="POST" name="form">
            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">시설 번호</span>
                    </div>
                    <input type="text" class="form-control" placeholder="입력" name="facilityID"
                           aria-describedby="basic-addon1" autocomplete="off" value=${facility.facilityID} readonly required>
                </div>
            </div>
            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon2">시설명</span>
                    </div>
                    <input type="text" class="form-control" placeholder="입력" name="facilityName"
                           aria-describedby="basic-addon1" autocomplete="off" value=${facility.facilityName} required>
                </div>
            </div>
            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon3">등록자ID</span>
                    </div>
                    <input type="text" class="form-control" placeholder="입력" name="registrantID"
                           aria-describedby="basic-addon1" autocomplete="off" readonly value=${facility.registrantID} required>
                </div>
            </div>
            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon4">소속 관광지ID</span>
                    </div>
                    <input type="text" class="form-control" placeholder="입력" name="workspaceID"
                           aria-describedby="basic-addon1" autocomplete="off" value=${facility.workspaceID} required>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-3">
                    <button type="submit" class="btn btn-secondary bg-dark">수정</button>
                </div>
                <div class="col-1"></div>
                <div class="col-3">
                    <button type="button" class="btn btn-secondary bg-dark" onclick='self.close()'>취소</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
