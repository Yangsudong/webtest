package examination;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/examination/examinationSelect")
public class ExaminationSelectServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//파라미터를 VO에 담기
		ExaminationVO paramVO = new ExaminationVO();
		String test_no = (request.getParameter("test_no"));
		paramVO.setTest_no(test_no);
				
		//단건조회
		ExaminationDAO dao = new ExaminationDAO();
		ExaminationVO exam = dao.selectOne(paramVO);
		
		// 조회결과 request 저장
		request.setAttribute("exam",exam);
		
		// view 페이지로 이동(포워드)
		request.getRequestDispatcher("testpage.jsp")
				.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
