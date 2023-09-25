package com.model2.mvc.test.purchase;

import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.repo.purchase.PurchaseRepository;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.repo.product.ProductRepository;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.user.UserRepository;

import jakarta.transaction.Transactional;

import org.junit.After;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;

import java.util.Date;
import java.util.List;
import java.util.stream.IntStream;

@SpringBootTest
@Transactional
public class PurchaseRepositoryTest {

    @Autowired
    private PurchaseRepository purchaseRepository;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private UserRepository userRepository;

    //@Test
    @Transactional
    @Rollback(true)
    public void createPurchaseTest() {
        // 먼저 Product와 User 정보를 조회
        Product product = productRepository.findByProdName("자전거");
        User user = userRepository.findByUserId("user23");

        if (product != null && user != null) {
            // Product 및 User 정보를 사용하여 Purchase 객체 생성
            Purchase purchase = Purchase.builder()
                    .purchaseProd(product)
                    .buyer(user)
                    .paymentOption("신용카드")
                    .purchaseQuantity(2)
                    .receiverName("beom")
                    .receiverPhone("010-5090-2160")
                    .dlvyAddr("서울")
                    .dlvyRequest("빠른배송")
                    .tranCode("2") // 이 부분도 수정
                    .orderDate(new Date())
                    .dlvyDate(new Date())
                    .build();

            // Purchase 저장 (데이터베이스에 삽입)
            purchaseRepository.save(purchase);

            // 저장된 Purchase를 조회하여 확인
            List<Purchase> savedPurchases = purchaseRepository.findByReceiverName("beom");
            System.out.println(savedPurchases);
            System.out.println("========" + savedPurchases.size());
            assert savedPurchases.size() == 1; // 저장된 Purchase가 1개여야 함
        } else {
            System.out.println("Product 또는 User 정보를 찾을 수 없습니다.");
        }
    }

    @Test
    public void selectPurchaseTest() {
        List<Purchase> findPurchases = purchaseRepository.findByBuyer_UserId("user23");

        assert findPurchases != null;
    }

    @Test
    public void updatePurchaseTest() {
        Purchase purchase = purchaseRepository.findByTranNo(3);

        purchase = Purchase.builder()
                .paymentOption("온라인입금")
                .purchaseQuantity(5)
                .receiverName("chan")
                .receiverPhone("010-1111-2222")
                .dlvyAddr("경기")
                .dlvyRequest("빠른배송")
                .tranCode("2") // 이 부분도 수정
                .build();

        assert "온라인입금".equals(purchase.getPaymentOption());
        assert "chan".equals(purchase.getReceiverName());
        assert "경기".equals(purchase.getDlvyAddr());

    }

    @Test
    @Transactional
    public void deletePurchaseTest() {
        // 저장된 Product 데이터 중에서 특정 조건을 만족하는 데이터만 삭제
        purchaseRepository.deleteByTranNo(3);

        // 삭제 후 데이터가 없는지 확인
        Purchase purchase = purchaseRepository.findByTranNo(3);

        //assertNull(remainingProduct); // JUnit 사용 시
        assert purchase == null; // 다른 assert 라이브러리 사용 시
    }

}


