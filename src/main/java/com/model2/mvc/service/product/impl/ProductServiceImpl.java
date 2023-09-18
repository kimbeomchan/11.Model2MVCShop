package com.model2.mvc.service.product.impl;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductDao;
import com.model2.mvc.service.product.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("productServiceImpl") // @Component
public class ProductServiceImpl implements ProductService{

	///Field
	@Autowired
	@Qualifier("productDaoImpl")
	private ProductDao productDao; // 생성

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

	///Constructor
	public ProductServiceImpl() {
		System.out.println(this.getClass());
	}


	///Method
	public Product addProduct(Product product) throws Exception {
		System.out.println(product);

		product.setManuDate(product.getManuDate().replace("-", ""));
//
//		// File 불러옴
//		MultipartFile[] uploadFile = product.getFiles();
//		
//		System.out.println("uploadFile.length :: " + uploadFile.length);
//		System.out.println("uploadFile :: " + uploadFile);
//		
//		String fileName = "";
//		byte[] bytes;
//		if(uploadFile.length > 0) {
//			
//			for(int i = 0; i < uploadFile.length-1; i++ ) { ////  MultipartFile file : uploadFile
//				
//				if( i >= 0 && i < uploadFile.length-1) {
//					
//					fileName += product.getProdName() + "_" + uploadFile[i].getOriginalFilename();
//						
//				} else if( i == uploadFile.length-1 ) {
//					
//					fileName += "," + product.getProdName() + "_" + uploadFile[i].getOriginalFilename();
//					
//				}
//				
//				
//				System.out.println("\nMulipartFile Name :: " + fileName + "======== "+ i +" ===============================\n");
//				
//				Path path = Paths.get("/images/uploadFiles/" + fileName);
//				Files.copy(uploadFile[i].getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
//			}
//		
//			product.setFileName(fileName);
//		}

		productDao.insertProduct(product);
		return product;
	}



	public Product getProduct(int prodNo) throws Exception {
		return productDao.getProduct(prodNo);
	}

	public Map<String,Object> getProductList(Search search) throws Exception {
		List<Product> list= productDao.getProductList(search);
		int totalCount = productDao.getTotalCount(search);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));

		return map;
	}

	public Product updateProduct(Product product) throws Exception {
		System.out.println("update Product" + product);

		productDao.updateProduct(product);

		return product;
	}

	public List<Product> getAutoProductList(Search search) throws Exception{
		List<Product> list = productDao.getAutoProductList(search);
		System.out.println("list ::: " + list);
		return list;
	}

}
