package examination;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;


@WebServlet("/examination/updateTest")
public class ExaminationUpdateTestServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ExaminationVO paramVO = new ExaminationVO();
		
		String test_no = request.getParameter("test_no");
		paramVO.setTest_no(test_no);
		
		ExaminationDAO dao = new ExaminationDAO();
		int count = dao.count();
		
		//과목정보
		ArrayList<HashMap<String, String>> subjectlist = SubjectDAO.getInstance().subjectAll();		
		request.setAttribute("subjectlist", subjectlist);
		
		//단건조회
		ExaminationVO exam = dao.selectOne(paramVO);
		
		// 조회결과 request 저장
		request.setAttribute("count", count);
		request.setAttribute("exam",exam);
		
		//과목정보
				
		
		
		//문제등록 페이지로 이동
		request.getRequestDispatcher("testUpdate.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		ExaminationVO examinationVO = new ExaminationVO();
		
		try {
			BeanUtils.copyProperties(examinationVO, request.getParameterMap());
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
		ExaminationDAO dao = new ExaminationDAO();
		dao.updateTest(examinationVO);
		
		//목록으로 이동
		response.sendRedirect("updateTest");
	}

}
