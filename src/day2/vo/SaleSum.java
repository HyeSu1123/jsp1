package day2.vo;

public class SaleSum {		//join 결과 컬럼으로만 저장할 vo클래스
	private int custNo;
	private String custNme;
	private String grade;
	private int sum;
	
	//생성자
	public SaleSum(int custNo, String custNme, String grade, int sum) {
		super();
		this.custNo = custNo;
		this.custNme = custNme;
		this.grade = grade;
		this.sum = sum;
	}


	//getter,setter
	public int getCustNo() {
		return custNo;
	}

	public void setCustNo(int custNo) {
		this.custNo = custNo;
	}

	public String getCustNme() {
		return custNme;
	}

	public void setCustNme(String custNme) {
		this.custNme = custNme;
	}


	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public int getSum() {
		return sum;
	}

	public void setSum(int sum) {
		this.sum = sum;
	}


	@Override
	public String toString() {
		return "SaleSum [custNo=" + custNo + ", custNme=" + custNme + ", grade=" + grade + ", sum=" + sum + "]";
	}
	

}
