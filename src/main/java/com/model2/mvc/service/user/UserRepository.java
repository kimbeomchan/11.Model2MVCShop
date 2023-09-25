package com.model2.mvc.service.user;

import com.model2.mvc.service.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
	void deleteByUserIdLike(String pattern);
	List<User> findByUserIdStartingWith(String pattern);
	User findByUserId(String userId);
	User findByUserName(String userId);

}