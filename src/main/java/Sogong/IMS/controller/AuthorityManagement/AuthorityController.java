package Sogong.IMS.controller.authorityManagement;

import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Sogong.IMS.controller.Action;
import Sogong.IMS.model.Member;

@WebServlet("/authorityManageView")
public class AuthorityController extends HttpServlet{

    private static final long serialVersionUID = 8559171819500212874L;

    HashMap<String, Action> list = null;

    @Override
    public void init(ServletConfig sc) throws ServletException{
        list = new HashMap<>();

        list.put("AuthorityManage/enroll.do", new AuthorityEnrollAction());
    }

    // get이나 post 요청에 대한 처리를 수행합니다.
    // 
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response){
        String url = request.getRequestURI();
        String contextPath = request.getContextPath();

        String path = url.substring(contextPath.length());

        System.out.printf("ContextPath : %s",contextPath);
        System.out.printf("path : %s",path);

        Action action = list.get(path);
        action.excute(request, response);
    }

    public boolean hasAuthority(Member member, String authorityName){
        return false;
    }
}