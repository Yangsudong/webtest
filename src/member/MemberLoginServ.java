package member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({"/examination/login"})
public class MemberLoginServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	//logout
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/examination/login.jsp").forward(request, response);;
	}
	
	//login
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.파라미터 VO
		MemberVO memberVO = new MemberVO();
		memberVO.setId(request.getParameter("id"));
		memberVO.setPass(request.getParameter("pass"));
		
		//2. 서비스 처리(DB)
		MemberVO resultVO = MemberDAO.getInstance().selectOne(memberVO);
		
		
		//3. 결과저장
		String page = "";
		if(resultVO == null) {		//id가 없음
			request.setAttribute("erromsg", "해당 ID가 없습니다.");
			page = "/examination/login.jsp";
			request.getRequestDispatcher(page).forward(request, response);
		} else {
			if(memberVO.getPass().equals(resultVO.getPass())) {		//로그인 성공
				request.getSession().setAttribute("login", resultVO);
				request.getSession().setAttribute("id", resultVO.getId());
				response.sendRedirect("/webtest/examination/mainpage.jsp"); 
			} else {
				request.setAttribute("errormsg", "패스워드 불일치");
				page = "/examination/login.jsp";
				request.getRequestDispatcher(page).forward(request, response);
			}
		}
		
		//4. 뷰페이지 이동(redierect, forward) 또는 뷰페이지 출력
//		request.getRequestDispatcher(page).forward(request, response);
	
	}

}
