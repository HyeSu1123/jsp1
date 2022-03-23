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

public class HrdProblemDao {

	public static HrdProblemDao dao = new HrdProblemDao();
	private HrdProblemDao() {}
	public static HrdProblemDao getHrdProblemDao() {
		return dao;
	}
	//회원 insert		:insert
	public void insert(Member vo) {
		Connection conn = OracleConnectUtil.connect();
		System.out.println("확인"+conn);
		String sql = "INSERT INTO MEMBER_TBL_02" + 
				"(CUSTNO, CUSTNAME, PHONE, ADDRESS, JOINDATE, GRADE, CITY)" + 
				"VALUES(member_seq.NEXTVAL,?,?,?,SYSDATE,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,vo.getCustName());
			pstmt.setString(2,vo.getPhone());
			pstmt.setString(3,vo.getAddress());
			pstmt.setString(4, vo.getGrade());
			pstmt.setString(5,vo.getCity());
			
			pstmt.execute();
			System.out.println("고객 1건이 등록되었습니다.");
			pstmt.close();
		} catch (SQLException e) {
			System.out.println("SQL 실행 오류:"+e.getMessage());
		}
		OracleConnectUtil.close(conn);
	}
	//회원 update		:update 
	public void update(Member vo) {
		Connection conn = OracleConnectUtil.connect();
		System.out.println("확인"+conn);
		String sql ="UPDATE MEMBER_TBL_02" + 
				"SET PHONE=?, ADDRESS=?,CITY=?" + 
				"WHERE CUSTNO=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,vo.getPhone());
			pstmt.setString(2,vo.getAddress());
			pstmt.setString(3,vo.getCity());
			pstmt.setInt(4,vo.getCustNo());
			
			pstmt.execute();
			System.out.println("업데이트 되었습니다.");
			pstmt.close();
		} catch (SQLException e) {
			System.out.println("SQL 실행 오류:"+e.getMessage());
		}
	}
	//회원 전체 select	:selectMemberAll
	public List<Member> selectMemberAll(){
		Connection conn = OracleConnectUtil.connect();
		String sql = "SELECT * FROM MEMBER_TBL_02";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Member> members = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				members.add(new Member(rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getDate(5),
						rs.getString(6),
						rs.getString(7)));
			}
			pstmt.close();
		} catch (SQLException e) {
			System.out.println("SQL 실행 오류:"+e.getMessage());
		}
		
		return members;
	}
	//회원 pk select	:selectMember
	public Member selectMember(int custNo) {
		Connection conn = OracleConnectUtil.connect();
		String sql = "SELECT * FROM MEMBER_TBL_02 mt WHERE CUSTNO =?";
		ResultSet rs = null;
		Member member = null;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, custNo);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pstmt.setInt(1,custNo);
			}
			
		} catch (SQLException e) {
			System.out.println("SQL 실행 오류:"+e.getMessage());

		}
		return member;
	}
	
	//매출 집계 select	:selcetSale
	public List<SaleSum> selectSale(){
		Connection conn = OracleConnectUtil.connect();
		String sql="SELECT mt.CUSTNO , CUSTNAME," + 
				"	decode(grade,'A','VIP','B','일반','C','직원') AS agrade," + 
				"	asum FROM MEMBER_TBL_02 mt ," + 
				"	(SELECT custno, sum(price) AS asum FROM MONEY_TBL_02 mt " + 
				"	GROUP BY CUSTNO" + 
				"	ORDER BY asum desc) sale" + 
				"	WHERE mt.CUSTNO = sale.custno order by custno";
		PreparedStatement pstmt = null;
		ResultSet rs= null;		
		List<SaleSum> sales = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();	//select 
			
			while(rs.next()) {
				SaleSum temp = new SaleSum(rs.getInt(1),
						rs.getString(2), rs.getString(3), rs.getInt(4));
				sales.add(temp);
				
			}
			pstmt.close();
			
		}catch (SQLException e) {
			System.out.println("SQL 실행 오류 : " + e.getMessage());
		
		}
		
		OracleConnectUtil.close(conn);
		return sales;
	}
	
}
