package com.model2.mvc.service.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.*;

import jakarta.persistence.*;

@Getter // getter 메소드 생성
@Setter
@ToString
@Builder // 빌더를 사용할 수 있게 함
@AllArgsConstructor
//@RequiredArgsConstructor
@NoArgsConstructor
@Entity(name="product") // 테이블 명을 작성
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int prodNo;

	@Column(name = "prod_name", nullable = false)
	private String prodName;

	@Column(name = "prod_detail", nullable = false)
	private String prodDetail;

	@Column(name = "prod_count", nullable = false)
	private int prodCount;

	@Column(name = "manufacture_day", nullable = false)
	private String manuDate;

	@Column(name = "price", nullable = false)
	private int price;

	@Column(name = "image_file", nullable = false)
	private String fileName;

	@Column(name = "reg_date", nullable = false)
	private Date regDate;

	@Transient
	private String[] fileSplitArray;

	@Transient
	private MultipartFile[] files;

	@Transient
	private String proTranCode;

}