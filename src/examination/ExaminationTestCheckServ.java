package examination;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/examCheck.do")
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
		
		//단건조회
		ExaminationDAO dao = new ExaminationDAO();
		ExaminationVO exam = dao.selectOne(paramVO);
		int count = dao.count();	
		
		request.setAttribute("count", count);
		
		//값 비교
		String check = "";
		if(exam.getAnswer().equals(answer)){
			check="정답";
			System.out.println("정답");
		} else {
			check="오답";
		}
		System.out.println(check);
		
		// 조회결과 request 저장
		request.setAttribute("exam",exam);
		request.setAttribute("check", check);
				
		request.getRequestDispatcher("/examination/testpage.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
