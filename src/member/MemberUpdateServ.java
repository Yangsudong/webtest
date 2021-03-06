package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

@WebServlet("/examination/memberUpdate")
public class MemberUpdateServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	//수정페이지로 이동
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberVO paramVO = new MemberVO();
		String id = request.getParameter("id");
		paramVO.setId(id);
		
		MemberDAO dao = new MemberDAO();
		MemberVO member = dao.selectOne(paramVO);
		
		request.setAttribute("member", member);
		
		request.getRequestDispatcher("memberUpdate.jsp").forward(request, response);
		
	}

	//수정처리
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		MemberVO memberVO = new MemberVO();
		
		try {
			BeanUtils.copyProperties(memberVO, request.getParameterMap());
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		MemberDAO dao = new MemberDAO();
		dao.update(memberVO);
		
		//목록으로 이동
		response.sendRedirect("memberSelectAll");
	}

}
