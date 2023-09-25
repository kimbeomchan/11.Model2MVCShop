package com.model2.mvc.service.user.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.transaction.Transactional;

import com.model2.mvc.service.user.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.user.UserService;
import com.model2.mvc.service.user.UserRepository;


//==> 회원관리 서비스 구현
@Service("userServiceImpl")
public class UserServiceImpl implements UserService{

	///Field
	@Autowired
	private UserRepository userRepository;
//	@Autowired
//	@Qualifier("userDao")
//	private UserDao userDao;
	public void setUserDao(UserRepository userRepository) {
		this.userRepository = userRepository;
	}

	///Constructor
	public UserServiceImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addUser(User user) throws Exception {
		//userRepository.addUser(user);
		userRepository.save(user);
	}

	public User getUser(String userId) throws Exception {
		return userRepository.findByUserId(userId);
	}

	public Map<String , Object > getUserList(Search search) throws Exception {
		Pageable pageable = PageRequest.of(1,10);
		Map<String, Object> map = new HashMap<>();
//		List<User> list= userRepository.getUserList(search);
//		int totalCount = userRepository.getTotalCount(search);
//
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("list", list );
//		map.put("totalCount", new Integer(totalCount));

		return map;
	}

	public void updateUser(User user) throws Exception {
		//userDao.updateUser(user);
		user = User.builder()
				.userId(user.getUserId())
				.userName(user.getUserName())
				.password(user.getPassword())
				.role(user.getRole())
				.ssn(user.getSsn())
				.cellPhone(user.getCellPhone())
				.addr(user.getAddr())
				.email(user.getEmail())
				.build();
		userRepository.save(user);
	}

	public boolean checkDuplication(String userId) throws Exception {
		boolean result=true;
		User user=userRepository.findByUserId(userId);
		if(user != null) {
			result=false;
		}
		return result;
	}
}