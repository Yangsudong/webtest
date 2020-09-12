package examination;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Paging;

@WebServlet("/examination/examAll")
public class ExaminationAllList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			//파라미터 받기
			String p = request.getParameter("p");
			String answer = request.getParameter("answer");
			//유효성 체크
			int page = 1;
			if(p != null) {
				page = Integer.parseInt(p);
			}
			ExaminationDAO dao = new ExaminationDAO();
			
			Paging paging = new Paging();
			paging.setPageUnit(5);
			paging.setPageSize(5);
			paging.setPage(page);
			
			//VO에 담기	
			ExaminationVO exam = new ExaminationVO();
			exam.setAnswer(answer);
			paging.setTotalRecord(dao.counter(exam));
			exam.setFirst(paging.getFirst());
			exam.setLast(paging.getLast());
					
			
			//전체조회
			ArrayList<ExaminationVO> list = dao.selectAll(exam);
			request.setAttribute("list", list);
			request.setAttribute("paging", paging);
			request.getRequestDispatcher("testAll.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
