package examination;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/examination/testInsert")
public class ExaminationInsertServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ExaminationDAO dao = new ExaminationDAO();
		int count = dao.count();
		request.setAttribute("count", count);
		//과목정보
		ArrayList<HashMap<String, String>> subjectlist = SubjectDAO.getInstance().subjectAll();		
		request.setAttribute("subjectlist", subjectlist);
		
		//문제등록 페이지로 이동
		request.getRequestDispatcher("testInsert.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
			//1.파라미터 VO에 담기
			ExaminationVO examVO = new ExaminationVO();
			examVO.setTest_no(request.getParameter("test_no"));
			examVO.setAnswer(request.getParameter("answer"));
			examVO.setContent(request.getParameter("content"));
			examVO.setSubject_no(request.getParameter("subject_no"));
			
			//2.등록처리
			ExaminationDAO dao = new ExaminationDAO();
			dao.insertTest(examVO);
			
			//3.결과처리 (생략)
			
			
			//4.문제페이지로 이동
			response.sendRedirect("testInsert");
	}

}
