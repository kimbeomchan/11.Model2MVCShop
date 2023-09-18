package com.model2.mvc.service.product;

import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;

/*
 * 상품관리를 추상화 캡슐화한 ProductService Interface
 */

public interface ProductService {

	public Product addProduct(Product product) throws Exception;

	public Product getProduct(int prodNo) throws Exception;

	public Map<String, Object> getProductList(Search search) throws Exception;

	public Product updateProduct(Product product) throws Exception;

	public List<Product> getAutoProductList(Search search) throws Exception;

}
