package com.model2.mvc.service.domain;

import lombok.*;

import jakarta.persistence.*;

import java.util.Date;

@Getter
@Setter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity(name="transaction")
public class Purchase {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "tran_no")
	private int tranNo;

	@ManyToOne // Purchase와 Product 간의 관계를 매핑
	@JoinColumn(name = "prod_no") // prod_no가 외래 키
	private Product purchaseProd;

	@ManyToOne // Purchase와 User 간의 관계를 매핑
	@JoinColumn(name = "buyer_id") // buyer_id가 외래 키
	private User buyer;

	@Column(name = "dlvy_addr", nullable = false)
	private String dlvyAddr;

	@Column(name = "dlvy_request", nullable = false)
	private String dlvyRequest;

	@Column(name = "payment_option", nullable = false)
	private String paymentOption;

	@Column(name = "purchase_quantity", nullable = false)
	private int purchaseQuantity;

	@Column(name = "receiver_name", nullable = false)
	private String receiverName;

	@Column(name = "receiver_phone", nullable = false)
	private String receiverPhone;

	@Column(name = "tran_status_code", nullable = false)
	private String tranCode;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "order_date", nullable = false)
	private Date orderDate;

	@Column(name = "dlvy_date", nullable = false)
	private Date dlvyDate;
}
