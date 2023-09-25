package com.model2.mvc.web.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.*;
import jakarta.servlet.http.HttpSession;

import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.user.UserService;


//==> 회원관리 RestController
@RestController
@RequestMapping("/user/*")
public class UserRestController {

	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//setter Method 구현 않음

	public UserRestController(){
		System.out.println(this.getClass());
	}

	@RequestMapping( value="json/getUser", method=RequestMethod.GET )
	public User getUserGET(@RequestParam("userId") String userId ) throws Exception{

		System.out.println("/user/json/getUser : GET");

		//Business Logic
		return userService.getUser(userId);
	}

	@RequestMapping( value="json/getUser/{userId}", method=RequestMethod.POST )
	public User getUserPOST( @PathVariable String userId ) throws Exception{

		System.out.println("/user/json/getUser : GET");

		//Business Logic
		return userService.getUser(userId);
	}

	@RequestMapping( value="json/login", method=RequestMethod.POST )
	public User login(@RequestBody User user,
					  jakarta.servlet.http.HttpSession session) throws Exception{

		System.out.println("/user/json/login : POST");
		//Business Logic
		System.out.println("::"+user);
		User dbUser=userService.getUser(user.getUserId());

		if( user.getPassword().equals(dbUser.getPassword())){
			session.setAttribute("user", dbUser);
		}

		return dbUser;
	}
}