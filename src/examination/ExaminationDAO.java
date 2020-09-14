package examination;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


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
	
	//전체조회
		public ArrayList<ExaminationVO> selectAll(ExaminationVO examinationVO) {
			ExaminationVO resultVO = null;
			ArrayList<ExaminationVO> list = new ArrayList<ExaminationVO>();
			
			try {
				conn = ConnectionManager.getConnnect();
				String where = " WHERE T.SUBJECT_NO = S.SUBJECT_NO ";
				if(examinationVO.getAnswer() !=null) {
					where += " and t.answer like '%' || ? ||  '%'";
				}				
				String sql = "SELECT A.* FROM(SELECT B.*, ROWNUM RM FROM ( " 
							+" SELECT T.TEST_NO, T.ANSWER, T.SUBJECT_NO, S.SUBJECT_NAME, T.CONTENT "
							+" FROM jsp.SUBJECT S, jsp.TEST T "
							+ where
							+" ORDER BY T.TEST_NO "
							+" ) B) A WHERE RM BETWEEN ? AND ? ";
						
				pstmt = conn.prepareStatement(sql);
				int pos = 1;
				if(examinationVO.getAnswer() != null) {
					pstmt.setString(pos++, examinationVO.getAnswer());
				}
				pstmt.setInt(pos++, examinationVO.getFirst());
				pstmt.setInt(pos++, examinationVO.getLast());
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					resultVO = new ExaminationVO();
					resultVO.setTest_no(rs.getString("test_no"));
					resultVO.setAnswer(rs.getString("answer"));
					resultVO.setSubject_no(rs.getString("subject_no"));
					resultVO.setSubject_name(rs.getString("subject_name"));					
					resultVO.setContent(rs.getString("content"));
					list.add(resultVO);   
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				ConnectionManager.close(conn);
			}
			return list;
		}
		
		public int counter(ExaminationVO examinationVO) {
			int cnt = 0;
			try {
				conn = ConnectionManager.getConnnect();
				String where = " where 1=1 ";
				if(examinationVO.getAnswer() !=null) {
					where += " and answer like '%' || ? || '%' ";
				}
				
				String sql = " select count(*) from jsp.test " + where;
				pstmt = conn.prepareStatement(sql);
				
				int pos = 1;
				if(examinationVO.getAnswer() !=null) {
					pstmt.setString(pos++, examinationVO.getAnswer());
				}
				
				rs = pstmt.executeQuery();
				rs.next();
				cnt = rs.getInt(1); 
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				ConnectionManager.close(conn);
			}
			return cnt;
		}
	
	public ExaminationVO selectOne(ExaminationVO examinationVO) {
		ExaminationVO resultVO = null;
		
		try {
			conn = ConnectionManager.getConnnect();
			String sql = " SELECT TEST_NO, ANSWER, CONTENT, SUBJECT_NO"
					   + " FROM JSP.TEST"
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
				
			} 
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return resultVO;
	}
	
	public int count() {
		int cnt = 0;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select count(test_no) from TEST";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt(1);
				
			}
		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionManager.close(conn);
		}
		return cnt;
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
	public void insertTest(ExaminationVO examinationVO) {
		try {
			//1.DB연결
		 conn = ConnectionManager.getConnnect();
		 
			//2.sql 구문 실행
			String sql = "INSERT INTO TEST (TEST_NO, ANSWER, CONTENT, SUBJECT_NO)" 
						+ " VALUES (?,?,?,?)";
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, examinationVO.getTest_no());
			pstmt.setString(2, examinationVO.getAnswer());
			pstmt.setString(3, examinationVO.getContent());
			pstmt.setString(4, examinationVO.getSubject_no());
			int r = pstmt.executeUpdate();
			
			//3.결과처리
			System.out.println(r + "건이 처리됨");
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			//4.연결해제
			ConnectionManager.close(null, pstmt, conn);
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
	
	public void delete(ExaminationVO examinationVO) {
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "DELETE FROM TEST WHERE TEST_NO = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, examinationVO.getTest_no());
			int r = pstmt.executeUpdate();
			System.out.println(r + "건이 삭제됨");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		
	}
	
	public void updateTest(ExaminationVO examinationVO) {
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "UPDATE TEST SET TEST_NO = ?,ANSWER = ?, content = ?, subject_no = ? WHERE TEST_NO = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, examinationVO.getTest_no());
			pstmt.setString(2, examinationVO.getAnswer());
			pstmt.setString(3, examinationVO.getContent());
			pstmt.setString(4, examinationVO.getSubject_no());
			pstmt.setString(5, examinationVO.getTest_no());
			int r = pstmt.executeUpdate();
			System.out.println(r + "건이 입력됨");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		
	}
}


