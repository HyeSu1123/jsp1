package day1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class CustomDao {
	
	//필드값이 없는 클래스. -> new 연산으로 객체를 생성했을때 서로 다른 필드값을 갖는 것이 없다.
	// - static 키워드로 실행 가능한 메소드이다.static은 메모리의 공유 영역이다.
	// - jdbc에서 dao 클래스는 효율적이지 않기떄문에 static으로 하지 않는다. 
	// ->싱글턴 객체로 사용한다.
	
	private static CustomDao dao = new CustomDao();
	private CustomDao() {}
	public static CustomDao getCustomDao() {
		return dao;
	}
	
	
	
	//select 쿼리 (기본키 컬럼으로 조회하고 결과 반환하기)
		public static Custom selectOne(String custom_id) {
			Connection conn = OracleConnectUtil.connect();
			PreparedStatement pstmt = null;
			String sql="select * from tbl_custom# where custom_id=?";
			//기본키 컬럼 조회결과는 0또는 1개의 행
			ResultSet rs = null;
			Custom vo = null;
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,custom_id);
				rs = pstmt.executeQuery();
				if(rs.next()) {		//조회 결과 1개행 있으면
					vo = new Custom();
					vo.setCustom_id(rs.getString(1));
					vo.setName(rs.getString(2));
					vo.setEmil(rs.getString(3));
					vo.setAge(rs.getInt(4));
					vo.setReg_date(rs.getDate(5));
				}	//없으면 (else) null 반환
				
			}catch(SQLException e) {
				System.out.println("SQL 실행오류:"+ e.getMessage());
			}
			return vo;
		}

	//insert 쿼리 실행
	public void insert(Custom vo) {
		Connection conn = OracleConnectUtil.connect();
		System.out.println("메인메소드 확인용"+conn);
		String sql="INSERT INTO TBL_CUSTOM#" + 
				"(CUSTOM_ID, NAME, EMIL, AGE, REG_DATE)" + 
				"VALUES(?, ?, ?, ?, SYSDATE)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			//? 에 해당하는 값을 전달한다. ?순서를 1부터 시작하는 index로 지정한다.
			pstmt.setString(1, vo.getCustom_id());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getEmil());
			pstmt.setInt(4, vo.getAge());
		
			pstmt.execute();	
			System.out.println("고객 1건이 새로 등록되었습니다.");
			pstmt.close();
		} catch (SQLException e) {
			System.out.println("SQL 실행 오류:"+e.getMessage());
		}
		OracleConnectUtil.close(conn);
	}
	//update 쿼리 실행
//	public void update(String custom_id,String email) {	//방법1)
	public void update(Custom vo) {	//방법2)
		Connection conn = OracleConnectUtil.connect();
		PreparedStatement pstmt = null;
		String sql = "UPDATE TBL_CUSTOM# SET EMIL=?WHERE CUSTOM_ID=?";
//		String custom_id = null;
//		String email = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, email);		//방법 1
//			pstmt.setString(2, custom_id);	//방법1
			
			//방법2)수정할 컬럼이 많을때 매개변수를 모두 나열하는 것은 비효율적이므로 객체로 받아온다.
			pstmt.setString(1, vo.getEmil());		
			pstmt.setString(2, vo.getCustom_id());	//방법2
			
			pstmt.execute();
			pstmt.close();

		}catch(SQLException e) {
			System.out.println("SQL 실행 오류:"+e.getMessage());
		}
		System.out.println("변경되었습니다");
		OracleConnectUtil.close(conn);
	}
	//delete 쿼리 실행
	public void delete(String custom_id) {	
		//custom_id는 이 메소드를 호출할때 값이 전달된다.
		
		Connection conn = OracleConnectUtil.connect();
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM TBL_CUSTOM# WHERE CUSTOM_ID=?";
//		String custom_id = sc.nextLine();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, custom_id);
			pstmt.execute();
			pstmt.close();

		}catch(SQLException e) {
			System.out.println("SQL 실행 오류:"+e.getMessage());
		}
		System.out.println("삭제되었습니다");
		OracleConnectUtil.close(conn);
	}
	
	//selcetOne() 메소드와 쿼리는 동일하지만 리턴형식이 다른 예
		public boolean idCheck(String id) {
			Connection conn = OracleConnectUtil.connect();
			boolean result = false;
			String sql="select * from tbl_custom# where custom_id=?";
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,id);
				rs = pstmt.executeQuery();
				if(!rs.next()) {result = true;} 	//rs.next() == false
				
			} catch (SQLException e) {
				System.out.println("SQL오류:"+e.getMessage());
			}
			return result;// 중복되면 false,중복 없으면 true 중복없으면 true(rs.next()가 false일때)
		}
		
	
	//select 쿼리 조건없다.
	public List<Custom> selectAll() {
		Connection conn = OracleConnectUtil.connect();
		String sql = "select * from tbl_custom#";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Custom> customs = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				customs.add(new Custom(rs.getString(1),	//방법 1) 커스텀 생성자를 만들었을때
						rs.getString(2),
						rs.getString(3),
						rs.getInt(4),
						rs.getDate(5)));
			}
			
			pstmt.close();
			
		}catch (SQLException e) {
			System.out.println("SQL 실행 오류:"+e.getMessage());
		}
		
		OracleConnectUtil.close(conn);
		return customs;
	}
	
}
