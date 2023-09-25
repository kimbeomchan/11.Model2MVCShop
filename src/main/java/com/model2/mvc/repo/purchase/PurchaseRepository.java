package com.model2.mvc.repo.purchase;

import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface PurchaseRepository extends JpaRepository<Purchase, Long> {
    //void deleteByPurchaseIdLike(String pattern);
    List<Purchase> findByReceiverName(String pattern);

    List<Purchase> findByBuyer_UserId(String buyerId);

    Purchase findByTranNo(int tranNo);

    void deleteByTranNo(int tranNo);

//    Purchase findByProdName(String prodName);
//    List<Purchase> findByPurchaseIdStartingWith(String pattern);
//    Purchase findByPurchaseId(String PurchaseId);
//    Purchase findByPurchaseName(String PurchaseId);
}