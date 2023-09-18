package com.model2.mvc.service.product.impl;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductDao;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("productDaoImpl")
public class ProductDaoImpl implements ProductDao {

	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	///Constructor
	public ProductDaoImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void insertProduct(Product product) throws Exception{
		sqlSession.insert("ProductMapper.addProduct", product);
	}


	public Product getProduct(int prodNo) throws Exception {
		return sqlSession.selectOne("ProductMapper.getProduct", prodNo);
	}


	public List<Product> getProductList(Search search) throws Exception {
		return sqlSession.selectList("ProductMapper.getProductList", search);
	}

	public List<Product> getAutoProductList(Search search) throws Exception {
		//List<Product> list = sqlSession.selectList("ProductMapper.getAutoProductList", search);
		System.out.println("DAO :: search.getSearchCondition() :: " + search.getSearchCondition());
		System.out.println("DAO :: search.getSearchKeyword() :: " + search.getSearchKeyword());
		System.out.println(sqlSession.selectList("ProductMapper.getAutoProductList", search));

		return sqlSession.selectList("ProductMapper.getAutoProductList", search);
	}


	public void updateProduct(Product product) throws Exception {
		sqlSession.update("ProductMapper.updateProduct", product);
	}


	// 게시판 Page 처리를 위한 전체 Row(totalCount)  return
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("ProductMapper.getTotalCount", search);
	}
}
