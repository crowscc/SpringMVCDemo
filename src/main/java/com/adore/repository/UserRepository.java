package com.adore.repository;
import com.adore.model.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Crow on 17/5/8.
 */
@Repository
public interface UserRepository extends JpaRepository<UserEntity, Integer> {

//    @Modifying //修改操作
//    @Transactional //事物
//    @Query("update UserEntity us set us.nickname=:qNickname, us.firstName=:qFirstName, us.lastName=:qLastName, us.password=:qPassword where us.id=:qId")
//    public void updateUser(@Param("qNickname") String nickname, @Param("qFirstName") String firstName,
//                           @Param("qLastName") String qLastName, @Param("qPassword") String password, @Param("qId") Integer id);

    @Query(value = "select * from user u where u.nickname=?1", nativeQuery = true)
    public UserEntity findOneByUserNickname(String nickname);

    @Query(value ="select * from user u where u.email = ?1", nativeQuery = true)
    public UserEntity findOneByUserEmail(String email);
}