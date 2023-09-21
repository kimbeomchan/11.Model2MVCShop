package com.model2.mvc.service.domain;

import java.util.Date;

import lombok.*;

import jakarta.persistence.*;


@Getter // getter 메소드 생성
@Setter
@ToString
@Builder // 빌더를 사용할 수 있게 함
@AllArgsConstructor
//@RequiredArgsConstructor
@NoArgsConstructor
@Entity(name="users") // 테이블 명을 작성
public class User {

	@Id
	private String userId;

	@Column(name = "user_name", nullable = false)
	private String userName;

	@Column(name="password", nullable = false)
	private String password;

	@Column(name = "role", columnDefinition = "VARCHAR(5) DEFAULT 'user'")
	private String role;

	@Column(name = "ssn")
	private String ssn;

	@Column(name = "cell_phone")
	private String cellPhone;

	@Column(name = "addr")
	private String addr;

	@Column(name = "email")
	private String email;

	@Column(name = "reg_date")
	@Temporal(TemporalType.DATE)
	private Date regDate;
}
