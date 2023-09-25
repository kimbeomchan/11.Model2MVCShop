package com.model2.mvc.test.user;

import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.user.UserRepository;
import jakarta.transaction.Transactional;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Date;
import java.util.List;
import java.util.stream.IntStream;

//import static org.junit.jupiter.api.Assertions.assertEquals;
//import org.junit.jupiter.api.Assertions;

@SpringBootTest
@Transactional
public class UserRepositoryTest {

    @Autowired
    private UserRepository userRepository;

    @Test
    @Transactional
    public void createUserTest() {
        // UserEntity 객체 생성
        IntStream.rangeClosed(1, 5).forEach(i -> {
            User user = User.builder()
                    .userId("Beomchan-" + i)
                    .userName("Beomchan-" + i)
                    .password("1234")
                    .role("user")
                    .ssn("1234567890")
                    .cellPhone("123-456-7890")
                    .addr("Seoul")
                    .email("beomchan@gmail.com")
                    .regDate(new Date())
                    .build();

            // User를 저장 (데이터베이스에 삽입)
            userRepository.save(user);

        });

        // 저장된 User를 조회하여 확인
        List<User> savedUsers = userRepository.findByUserIdStartingWith("Beomchan-");
        System.out.println(savedUsers);
        assert savedUsers.size() == 5;
    }

    @Test
    public void selectUserTest() {
        List<User> findUsers = userRepository.findAll();
        assert findUsers.size() >= 23;
    }


    @Test
    @Transactional
    public void updateUserTest() {
        User originUser = User.builder()
                .userId("Beomchan-origin")
                .userName("Beomchan-origin")
                .password("1234")
                .role("user")
                .ssn("1234567890")
                .cellPhone("123-456-7890")
                .addr("Seoul")
                .email("beomchan@gmail.com")
                .regDate(new Date())
                .build();

        userRepository.save(originUser);

        User updateUser = userRepository.findByUserId("Beomchan-origin");

        System.out.println(updateUser);

        // updateUser 객체를 직접 수정
        updateUser.setUserName("Beomchan-update");
        updateUser.setPassword("1111");
        updateUser.setSsn("1111111111");
        updateUser.setCellPhone("000-000-0000");
        updateUser.setAddr("Gangnam");
        updateUser.setEmail("update@gmail.com");
//        updateUser.builder()
//                .userName("Beomchan-update")
//                .password("1111")
//                .role("user")
//                .ssn("1111111111")
//                .cellPhone("000-000-0000")
//                .addr("Gangnam")
//                .email("update@gmail.com")
//                .build();

        userRepository.save(updateUser);

        User updatedUser = userRepository.findByUserName("Beomchan-update");

        //assertEquals("update@gmail.com", updatedUser.getEmail());
        assert "Beomchan-update".equals(updatedUser.getUserName());
        assert "update@gmail.com".equals(updatedUser.getEmail());
    }

    @Test
    @Transactional
    public void deleteUserTest() {
        // 저장된 User 데이터 중에서 특정 조건을 만족하는 데이터만 삭제
        userRepository.deleteByUserIdLike("user%");

        // 삭제 후 데이터가 없는지 확인
        List<User> remainingUsers = userRepository.findAll();
        //assertEquals(23, remainingUsers.size());
        assert remainingUsers.size() < 23;
    }
}


