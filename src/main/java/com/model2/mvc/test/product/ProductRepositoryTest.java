package com.model2.mvc.test.product;

import com.model2.mvc.service.domain.Product;
import com.model2.mvc.repo.product.ProductRepository;
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
public class ProductRepositoryTest {

    @Autowired
    private ProductRepository productRepository;

    @Test
    @Transactional
    @Rollback(true)
    public void createProductTest() {
        // Product 객체 생성
        IntStream.rangeClosed(1, 5).forEach(i -> {
            Product product = Product.builder()
                    .prodName("prodName-" + i)
                    .prodDetail("prodDetail-" + i)
                    .prodCount(20)
                    .manuDate("20231225")
                    .price(7777)
                    .fileName("fileName"+i+".jsp")
                    .regDate(new Date())
                    .build();

            // Product를 저장 (데이터베이스에 삽입)
            productRepository.save(product);
        });

        // 저장된 User를 조회하여 확인
        List<Product> savedProducts = productRepository.findByProdNameStartingWith("prodName-");
        System.out.println(savedProducts);
        System.out.println("========"+savedProducts.size());
        assert savedProducts.size() == 5;
    }

    @Test
    public void selectProductTest() {
        List<Product> findProducts = productRepository.findAll();
        assert findProducts.size() >= 8;
    }


    @Test
    @Transactional
    public void updateProductTest() {
        Product originProduct = Product.builder()
                .prodName("prodName-origin")
                .prodDetail("prodDetail-origin")
                .prodCount(20)
                .manuDate("20240101")
                .price(8888)
                .fileName("originFile.jsp")
                .regDate(new Date())
                .build();

        productRepository.save(originProduct);

        Product updateProduct = productRepository.findByProdName("prodName-origin");

        System.out.println(updateProduct);

        // updateUser 객체를 직접 수정
        updateProduct.setProdName("prodName-update");
        updateProduct.setProdDetail("prodDetail-update");
        updateProduct.setProdCount(30);
        updateProduct.setManuDate("20240221");
        updateProduct.setPrice(9999);
        updateProduct.setFileName("updateFile.jsp");

        productRepository.save(updateProduct);

        Product updatedUser = productRepository.findByProdName("prodName-update");

        //assertEquals("update@gmail.com", updatedUser.getEmail());
        assert "prodName-update".equals(updatedUser.getProdName());
        //assert "9999".equals(updatedUser.getPrice());
    }

    @Test
    @Transactional
    public void deleteProductTest() {
        // 저장된 Product 데이터 중에서 특정 조건을 만족하는 데이터만 삭제
        productRepository.deleteByProdName("인라인");

        // 삭제 후 데이터가 없는지 확인
        Product remainingProduct = productRepository.findByProdName("인라인");

        //assertNull(remainingProduct); // JUnit 사용 시
        assert remainingProduct == null; // 다른 assert 라이브러리 사용 시
    }
}


