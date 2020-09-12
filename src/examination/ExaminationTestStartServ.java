package examination;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;





@WebServlet("/examination/examSearch")
public class ExaminationTestStartServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		//파라미터
		
		ExaminationVO paramVO = new ExaminationVO();
		String test_no = request.getParameter("test_no");
		paramVO.setTest_no(test_no);
		
		//과목정보
		ArrayList<HashMap<String, String>> subjectlist = SubjectDAO.getInstance().subjectAll();		
		request.setAttribute("subjectlist", subjectlist);
		String subject_name = request.getParameter("subject_name");
		paramVO.setSubject_name(subject_name);
		
		//단건조회
		ExaminationDAO dao = new ExaminationDAO();
		ExaminationVO exam = dao.selectOne(paramVO);
		int count = dao.count();	
		request.setAttribute("count", count);
		
		// 조회결과 request 저장
		
		request.setAttribute("exam",exam);
	
		
		// view 페이지로 이동(포워드)
		request.getRequestDispatcher("testpage.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		
	}

}
