package koreait.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import day1.OracleConnectUtil;
import day2.vo.Member;
import koreait.vo.HrdMember;

public class HrdMemberDao {
	private static HrdMemberDao dao = new HrdMemberDao();
	private HrdMemberDao() {}
	public static HrdMemberDao getInstance() {
		return dao;
	}
	
	
	
	public int getNextSeq() {
		Connection conn = OracleConnectUtil.connect();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql="select member_seq.nextval from dual";
		int result =0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			pstmt.close();
		} catch (SQLException e) {
			System.out.println("HrdMemberDao insert 오류"+e.getMessage());
		}
		OracleConnectUtil.close(conn);

		return result;
	}
	//회원 insert		:insert
		public void insert(HrdMember vo) {
			Connection conn = OracleConnectUtil.connect();
//			System.out.println("확인"+conn);
//			String sql = "INSERT INTO MEMBER_TBL_02" + 
//					"(CUSTNO, CUSTNAME, PHONE, ADDRESS, JOINDATE, GRADE, CITY)" + 
//					"VALUES(member_seq.NEXTVAL,?,?,?,SYSDATE,?,?)";
			
			String sql = "INSERT INTO MEMBER_TBL_02" + 
					" (CUSTNO, CUSTNAME, PHONE, ADDRESS, JOINDATE, GRADE, CITY)" + 
					" VALUES(?,?,?,?,SYSDATE,?,?)";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(2,vo.getCustName());
				pstmt.setString(3,vo.getPhone());
				pstmt.setString(4,vo.getAdderss());
				pstmt.setString(5, vo.getGrade());
				pstmt.setString(6,vo.getCity());
				pstmt.setInt(1, vo.getCustNo());
				
				pstmt.execute();
				System.out.println("고객 1건이 등록되었습니다.");
				pstmt.close();
			} catch (SQLException e) {
				System.out.println("HrdMemberDao insert 오류"+e.getMessage());
			}
			OracleConnectUtil.close(conn);
		}
	
	public void update(HrdMember vo) {
		Connection conn = OracleConnectUtil.connect();
		PreparedStatement pstmt = null;
		String sql = "UPDATE MEMBER_TBL_02" + 
				" SET PHONE=?, ADDRESS=?,CITY=?" + 
				" WHERE CUSTNO=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,vo.getPhone());
			pstmt.setString(2,vo.getAdderss());
			pstmt.setString(3, vo.getCity());
			pstmt.setInt(4, vo.getCustNo());
			
			pstmt.execute();
			pstmt.close();
		} catch (SQLException e) {
			System.out.println("HrdMemberDao selectAll 오류"+ e.getMessage());
		}
		OracleConnectUtil.close(conn);

	}
	
	
	public HrdMember selectOne(int custno) {	//기본키값으로 조회
		Connection conn = OracleConnectUtil.connect();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = "select * from member_tbl_02 where custno = ?";
		HrdMember result = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,custno);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = new HrdMember(rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getDate(5),
						rs.getString(6),
						rs.getString(7));
				pstmt.close();
			}
		} catch (SQLException e) {
			System.out.println("HrdMemberDao selectAll 오류"+ e.getMessage());
		}
		OracleConnectUtil.close(conn);

		return result;
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
		OracleConnectUtil.close(conn);

		return list;
	}
}
