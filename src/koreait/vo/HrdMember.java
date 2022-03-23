package koreait.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
//위의 어노테이션 @은 lombok 라이브러리를 이용해서 자동으로 필요한 코드를 생성한다.
//외부 평가에는 lombok 사용 못함. - 직접 코딩하기.
public class HrdMember {
	private int custNo;
	private String custName;
	private String phone;
	private String adderss;
	private Date joinDate;
	private String grade;
	private String city;

}
