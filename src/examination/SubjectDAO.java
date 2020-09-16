package examination;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import common.ConnectionManager;

public class SubjectDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	
		//싱글톤
		private static SubjectDAO instance = new SubjectDAO();
		public static SubjectDAO getInstance() {
			return instance;
		}
		//전체조회
		public ArrayList<HashMap<String, String>> subjectAll() {
			ArrayList<HashMap<String, String>> list = 
					new  ArrayList<HashMap<String, String>>();	
			Connection conn = null;
			try {	
				conn = ConnectionManager.getConnnect();
	 			//3.Statement 			
				String sql=" select subject_no, subject_name "
					 	 + "   from subject  order by subject_no ";       
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();			
				while(rs.next()) {
					HashMap<String, String> map = new HashMap<String, String>();
					map.put("subject_no", rs.getString("subject_no"));
					map.put("subject_name",rs.getString("subject_name"));
					list.add(map);
				}			
			} catch (Exception e) { e.printStackTrace(); } 	
			System.out.println(list);
			return list;
		}
		
		//과목단건조회
		public ExaminationVO selectSubOne(ExaminationVO examinationVO) {
			ExaminationVO resultVO = null;
			try {
				conn = ConnectionManager.getConnnect();
				String sql = " SELECT s.SUBJECT_NO, s.SUBJECT_NAME , t.test_no"
						+" FROM jsp.SUBJECT S , jsp.TEST t"
						+" WHERE t.subject_no = S.SUBJECT_NO "
						+" and t.test_no = ? ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, examinationVO.getTest_no());
				rs = pstmt.executeQuery();
				if(rs.next()) {
					resultVO = new ExaminationVO();
					resultVO.setSubject_no(rs.getString(1));
					resultVO.setSubject_name(rs.getString(2));
					resultVO.setTest_no(rs.getString(3));
					
				} else {
					System.out.println("없는 문제");
				}
				
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				ConnectionManager.close(rs, pstmt, conn);
			}
			return resultVO;
		}
		
		//과목단건조회
		public ExaminationVO selectSubName(ExaminationVO examinationVO) {
			ExaminationVO resultVO = null;
			try {
				conn = ConnectionManager.getConnnect();
				String sql = " SELECT s.SUBJECT_NO, s.SUBJECT_NAME , t.TEST_NO, t.ANSWER"
						+" FROM jsp.SUBJECT s , jsp.TEST t"
						+" WHERE t.subject_no = S.SUBJECT_NO "
						+" AND t.answer = ? ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, examinationVO.getAnswer());
				rs = pstmt.executeQuery();
				if(rs.next()) {
					resultVO = new ExaminationVO();
					resultVO.setSubject_no(rs.getString(1));
					resultVO.setSubject_name(rs.getString(2));
					resultVO.setTest_no(rs.getString(3));
					
				} else {
					System.out.println("없는 문제");
				}
				
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				ConnectionManager.close(rs, pstmt, conn);
			}
			return resultVO;
		}
}
