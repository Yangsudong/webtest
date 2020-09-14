package examination;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/examination/testDelete")
public class ExaminationDeleteServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		//파라미터
		ExaminationVO paramVO = new ExaminationVO();
		String test_no = request.getParameter("test_no");
		paramVO.setTest_no(test_no);
		
		//삭제
		ExaminationDAO.getInstance().delete(paramVO);
		
		
		// 조회결과 request 저장
				
		request.getRequestDispatcher("testAll.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
