package day2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import day1.OracleConnectUtil;
import day2.vo.Member;
import day2.vo.SaleSum;

public class TemplateDao { //dao만들때 참고
	
	private static TemplateDao dao = new TemplateDao(); 
	private TemplateDao() { }
	public static TemplateDao getCustomDao() {
		return dao;
	}
	
	public void insert(Member vo) {
		Connection conn = OracleConnectUtil.connect();
		String sql = ""; 
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
		
			
			pstmt.execute();
			System.out.println("회원 등록이 완료 되었습니다.");
			pstmt.close();
		}catch (SQLException e) {
			System.out.println("SQL 실행 오류 : " +  e.getMessage());
		}
		OracleConnectUtil.close(conn);	
	}
	
	public void update(Member vo) {
		Connection conn = OracleConnectUtil.connect();
		String sql = ""; 
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
		
			
			pstmt.execute();
			System.out.println("회원 수정이 완료 되었습니다.");
			pstmt.close();
		}catch (SQLException e) {
			System.out.println("SQL 실행 오류 : " +  e.getMessage());
		}
		OracleConnectUtil.close(conn);	
	}
	//데이터의 삭제는 대체로 기본키값을 조건으로 삭제.
	//-> 기본키값을 메소드 인자로.
	public void delete(int custNo) {
		Connection conn = OracleConnectUtil.connect();
		String sql="delete from member_tbl_02 where custno=?";
		PreparedStatement pstmt =null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			//?매개변수전달
			pstmt.setInt(1,custNo);
			pstmt.execute();
			System.out.println("삭제되었습니다.");
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		OracleConnectUtil.close(conn);
		
	}
	
	public List<Member> selectMemberAll() {
		Connection conn = OracleConnectUtil.connect();
		String sql="";
		PreparedStatement pstmt = null;
		ResultSet rs= null;		
		List<Member> members = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();	//select 
			
			while(rs.next()) {
			}
			pstmt.close();
			
		}catch (SQLException e) {
			System.out.println("SQL 실행 오류 : " + e.getMessage());
		
		}
		
		OracleConnectUtil.close(conn);
		return members;
	}
	
	public Member selectMember(int cust_no) {
		
		Connection conn = OracleConnectUtil.connect();
		ResultSet rs = null;
		String sql="";
		Member member=null;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				
			}
			
		}catch (SQLException e) {
			System.out.println("SQL 실행 오류 : " + e.getMessage());
		
		}
		return member;
	}
	
	
	public List<SaleSum> selectSale(){
		Connection conn = OracleConnectUtil.connect();
		String sql="";
		PreparedStatement pstmt = null;
		ResultSet rs= null;		
		List<SaleSum> sales = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();	//select 
			
			while(rs.next()) {
			}
			pstmt.close();
			
		}catch (SQLException e) {
			System.out.println("SQL 실행 오류 : " + e.getMessage());
		
		}
		
		OracleConnectUtil.close(conn);
		return sales;
	}
}
