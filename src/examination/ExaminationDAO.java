package examination;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import common.ConnectionManager;


public class ExaminationDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	//싱글톤
	static ExaminationDAO instance;
	public static ExaminationDAO getInstance() {
		if(instance==null)
		   instance=new ExaminationDAO();
		return instance;
	}
	
	public ExaminationVO selectOne(ExaminationVO examinationVO) {
		ExaminationVO resultVO = null;
		
		try {
			conn = ConnectionManager.getConnnect();
			String sql = " SELECT TEST_NO, ANSWER, CONTENT, SUBJECT_NO"
					   + " FROM TEST"
					   + " WHERE TEST_NO = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, examinationVO.getTest_no());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				resultVO = new ExaminationVO();
				resultVO.setTest_no(rs.getString(1));
				resultVO.setAnswer(rs.getString(2));
				resultVO.setContent(rs.getString(3));
				resultVO.setSubject_no (rs.getString(4));
				
			} else {
				System.out.println("더이상 문제가 없습니다");
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return resultVO;
	}
	
	
	public void insert(ExaminationVO examinationVO) {
		try {
			//1.DB연결
		 conn = ConnectionManager.getConnnect();
		 
			//2.sql 구문 실행
			String sql = "INSERT INTO EXPLAN (EXPLAN_NO, TEST_NO, ANSWER_CHECK, EXPLAN_ANSWER)" 
						+ " VALUES (EXPLAN_NO.NEXTVAL,?,?,?)";
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, examinationVO.getTest_no());
			pstmt.setString(2, examinationVO.getAnswer_check());
			pstmt.setString(3, examinationVO.getExplan_answer());			
			int r = pstmt.executeUpdate();
			
			//3.결과처리
			System.out.println(r + "건이 처리됨");
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			//4.연결해제
			ConnectionManager.close(null, pstmt, conn)
			;
		}
		
	}
	
	public void update(ExaminationVO examinationVO) {
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "UPDATE EXPLAN SET " + 
						 " ANSWER_CHECK = '?' , EXPLAN_ANSWER = '?'" + 
						 " WHERE EXPLAN_NO = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, examinationVO.getAnswer_check());
			pstmt.setString(2, examinationVO.getExplan_answer());
			pstmt.setString(3, examinationVO.getExplan_no());
			int r = pstmt.executeUpdate();
			System.out.println(r + "건이 수정됨");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		
	}
}


