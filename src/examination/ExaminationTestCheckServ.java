package examination;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 

@WebServlet("/examination/examCheck")
public class ExaminationTestCheckServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		//파라미터
		
		ExaminationVO paramVO = new ExaminationVO();
		String test_no = request.getParameter("test_no");
		paramVO.setTest_no(test_no);
		String answer = request.getParameter("answer");
		paramVO.setAnswer(answer);
		
		//과목정보
		SubjectDAO subdao = new SubjectDAO();
		ExaminationVO sub = subdao.selectSubOne(paramVO);
		
		//단건조회
		ExaminationDAO dao = new ExaminationDAO();
		ExaminationVO exam = dao.selectOne(paramVO);
		
		
		int count = dao.count();	
		
		//값 비교
		String check = "";
		if(answer==null || answer.isEmpty()) {
			check="정답을 입력하세요";
		}
		else if(exam.getAnswer().toUpperCase().trim().equals(answer.toUpperCase().trim())){
			check=" 정답입니다";
		} else {
			check=" 오답입니다 ";
		}
		
		// 조회결과 request 저장
		request.setAttribute("sub", sub);
		request.setAttribute("count", count);
		request.setAttribute("exam",exam);
		request.setAttribute("check", check);
				
		request.getRequestDispatcher("testpage.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
