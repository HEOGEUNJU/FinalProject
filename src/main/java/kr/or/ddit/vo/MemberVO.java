package kr.or.ddit.vo;

import java.io.IOException;
import java.io.Serializable;
import java.util.Base64;
import java.util.List;

import javax.validation.constraints.Email;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import javax.validation.groups.Default;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import kr.or.ddit.company.vo.CompanyVO;
import kr.or.ddit.expert.vo.ExpertVO;
import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.InsertGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * VO(Value Object), DTO(Data Transfer Object), Java Bean, Model
 * 
 * JavaBean 규약
 * 1. 값을 담을 수 있는 property 정의
 * 2. property 캡슐화
 * 3. 캡슐화된 프로퍼티에 접근할 수 있는 인터페이스 제공 getter/setter
 * 		get[set] + 프로퍼티명의 첫문자를 대문자로 -> camel case
 * 4. 객체의 상태 비교 방법 제공 : equals
 * 		==,  equals
 * 5. 객체의 상태 확인 방법 제공 : toString
 * 6. 객체 직렬화 가능
 * 
 * 회원관리를 위한 Domain Layer
 *  : 한사람의 회원 정보(구매기록 포함)를 담기 위한 객체.
 *    MEMBER(1) : PROD(N) -> HAS MANY
 *    1 : 1 -> HAS A
 *    
 *  ** 데이터매퍼나 ORM 을 이용한 테이블 조인 방법
 *    ex) 회원 정보 상세 조회시 구매 상품 기록을 함께 조회함.
 *  1. 대상 테이블 선택
 *     MEMBER, CART(CART_MEMBER, CART_PROD), PROD   
 *  2. 각테이블로부터 데이터를 바인딩할 vo 설계
 *     MemberVO, ProdVO
 *  3. 각테이블의 relation 을 VO 사이에 has 관계로 반영
 *  	1(main):N -> has many , MemberVO has many ProdVO(collection)
 *  	1(main):1 -> has a    , ProdVO has a BuyerVO
 *  4. resultType 대신 resultMap 으로 바인딩 설정.
 *     has many : collection
 *     has a    : association
 */
//@Getter
//@Setter
//@ToString(exclude= {"memPass", "memRegno1", "memRegno2", "memImage", "memImg"})
@ToString(exclude= {"memPass"})
@EqualsAndHashCode(of="memId")
@Data
@NoArgsConstructor
public class MemberVO extends CommonsAttachVO implements Serializable{
	
	public MemberVO(@NotBlank(groups = { Default.class, DeleteGroup.class }) String memId,
			@NotBlank(groups = { Default.class, DeleteGroup.class }) @Size(min = 4, max = 8, groups = { Default.class,
					DeleteGroup.class }) String memPass) {
		super();
		this.memId = memId;
		this.memPass = memPass;
	}	
	
	private int rnum;
	
	@NotBlank(groups= {Default.class, DeleteGroup.class})
	private String memId;
	@NotBlank(groups= {Default.class, DeleteGroup.class})
	@Size(min=4, max=8, groups= {InsertGroup.class, DeleteGroup.class})
	@JsonIgnore
	private String memPass;
	
	@NotBlank
	private String memName;
	private String memDelete;
	private String memUse;
	private String memAuthCd;
	private String memJoinDate;
	
	private CutVO cutVO;
	private BlackVO blackVO;
	
	//member : incruiter = 1 : 1
	private IncruiterVO incruiterVO;
	private SeekerVO seekerVO;
	private ExpertVO expertVO;
	
	private CompanyVO companyVO;
	
	private AttachVO attach;
	
	
	public String getMemJoinDate() {
		return memJoinDate;
	}

	public void setMemJoinDate(String memJoinDate) {
		this.memJoinDate = memJoinDate.substring(0,10);
	}

	@Override
	public String getTblId() {
		return memId;
	}
	
	
}














