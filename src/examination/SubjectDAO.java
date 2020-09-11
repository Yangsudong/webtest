package examination;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import common.ConnectionManager;

public class SubjectDAO {
		
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
}
