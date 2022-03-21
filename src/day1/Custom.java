package day1;

import java.sql.Date;

// VO : Value Object, 여러개의 데이터를 저장하는 것이 목적이다.
//		custom# 테이블의 컬럼을 저장할 필드로 구성된 클래스
public class Custom {
	private String custom_id;
	private String name;
	private String emil;
	private int age;
	private Date reg_date;	//registration
	
	//기본생성자 정의
	public Custom() { 
		
	}
	
	//alt+shift +s 단축키 -> 커스텀 생성자, getter/setter, toString을 만들어준다
	public Custom(String custom_id, String name, String emil, int age, Date reg_date) {
		this.custom_id = custom_id;
		this.name = name;
		this.emil = emil;
		this.age=age;
		this.reg_date=reg_date;
		
	}

	public String getCustom_id() {
		return custom_id;
	}

	public void setCustom_id(String custom_id) {
		this.custom_id = custom_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmil() {
		return emil;
	}

	public void setEmil(String emil) {
		this.emil = emil;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return custom_id + ":" + name + "," + emil + "," +age+"("+reg_date+")";
	}
	
}
