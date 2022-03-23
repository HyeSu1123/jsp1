package koreait.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import day1.OracleConnectUtil;
import koreait.vo.HrdMember;

public class HrdMemberDao {
	private static HrdMemberDao dao = new HrdMemberDao();
	private HrdMemberDao() {}
	public static HrdMemberDao getInstance() {
		return dao;
	}
	
	public List<HrdMember> selectAll(){
		Connection conn = OracleConnectUtil.connect();
		ResultSet rs = null;
		PreparedStatement pstmt =null;
		String sql="select * from member_tbl_02";
		List<HrdMember> list = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			//매개변수 필요없는 sql : set메소드 없음.
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				//테이블 조회된 컬럼을 자바 객체로 생성해서 저장(매핑)
				list.add(new HrdMember(rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getDate(5),
						rs.getString(6),
						rs.getString(7)));
			}
		} catch (SQLException e) {
			System.out.println("HrdMemberDao selectAll 오류"+ e.getMessage());
		}
		
		return list;
	}
}
