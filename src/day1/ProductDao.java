package day1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {
	//singleton
	//변수명 한번에 바꾸기 alt+shift+r
	
	//지금 Dao 역할 클래스는 전역변수(클래스의 프로퍼티)가 없다
	// 객체를 new 로 새로 만들어서 메모리 할당받아도 저장할 데이터가 없다.
	// 그래서 메소드만 실행하도록 싱글톤 패턴으로 객체를 생성하도록 구현했다.
	private static ProductDao dao = new ProductDao();
	
	private ProductDao() {}
	
	public static ProductDao getProductDao() {
		
		return dao;
	}
	//insert 쿼리 실행
	public void insert(Product vo) {
		Connection conn = OracleConnectUtil.connect();
		String sql ="INSERT INTO \"TBL_PRODUCT#" + 
				"(PCODE, CATEGORY, PNAME, PRICE)"+ 
				"VALUES('?', '?', '?', 0)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPcode());
			pstmt.setString(2, vo.getCategory());
			pstmt.setString(3, vo.getPname());
			pstmt.setInt(4, vo.getPrice());
			
			pstmt.execute();
			pstmt.close();
			
		} catch (SQLException e) {
			System.out.println("SQL 실행 오류:"+e.getMessage());
		}
		OracleConnectUtil.close(conn);
	}
	//update 쿼리 실행
	public void update(Product vo) {
		Connection conn = OracleConnectUtil.connect();
		PreparedStatement pstmt = null;
		String sql = "UPDATE TBL_PRODUCT# SET CATEGORY=?,PNAME=?, PRICE=? WHERE PCODE=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getCategory());
			pstmt.setString(2, vo.getPname());
			pstmt.setInt(3, vo.getPrice());
			pstmt.setString(4, vo.getPcode());
			
			pstmt.execute();
			pstmt.close();
			
		} catch (SQLException e) {
			System.out.println("SQL 실행 오류:"+e.getMessage());
		}
		OracleConnectUtil.close(conn);
	}
	//delete 쿼리 실행
	public void delete(Product vo) {
		Connection conn = OracleConnectUtil.connect();
		PreparedStatement pstmt = null;
		String sql="DELETE FROM TBL_PRODUCT# WHERE PCODE=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPcode());
			pstmt.execute();
			pstmt.close();
			
		} catch (SQLException e) {
			System.out.println("SQL 실행 오류:"+e.getMessage());
		}
		OracleConnectUtil.close(conn);
		
	}
	//selcetOne()
	public boolean pcodeCheck(String pcode) {
		Connection conn = OracleConnectUtil.connect();
		boolean result = false;
		String sql = "select * from tbl_product# where pcode=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,pcode);
			rs = pstmt.executeQuery();
			if(!rs.next()) {result = true;}
			
		} catch (SQLException e) {
			System.out.println("SQL오류:"+e.getMessage());
		}
		OracleConnectUtil.close(conn);
		return true;
	}
	
	//selcetAll()
	public void selectAll1() {
		Connection conn = OracleConnectUtil.connect();
		String sql="select * from tbl_product#";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Product vo = new Product();
				vo.setPcode(rs.getString(1));
				vo.setCategory(rs.getString(2));
				vo.setPname(rs.getString(3));
				vo.setPrice(rs.getInt(4));
			}
			pstmt.close();
			
		} catch (SQLException e) {
			System.out.println("SQL 실행 오류:"+e.getMessage());
		}
		OracleConnectUtil.close(conn);
	}
	
	public List<Product> selectAll() {
		Connection conn = OracleConnectUtil.connect();
		String sql ="select * from tbl_product#";
		PreparedStatement pstmt = null;
		ResultSet rs = null;  
		List<Product> products= new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				products.add(new Product(rs.getString(1),
							rs.getString(2), 
							rs.getString(3), 
							rs.getInt(4)));
			}
			pstmt.close();
		} catch (SQLException e) {
			System.out.println("SQL실행 오류  : " +  e.getMessage());
		}
		OracleConnectUtil.close(conn);
		return products;
	}
}