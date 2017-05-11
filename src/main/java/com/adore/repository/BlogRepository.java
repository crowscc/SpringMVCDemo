package com.adore.repository;

/**
 * Created by Crow on 17/5/9.
 */

import com.adore.model.BlogEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface BlogRepository extends JpaRepository<BlogEntity, Integer> {

    // 修改博文操作
    @Modifying
    @Transactional
    @Query("update BlogEntity blog set blog.userByUserId.id=:qUserId," +
            " blog.content=:qContent where blog.id=:qId")
    void updateBlog(@Param("qUserId") int userId, @Param("qContent") String content,
                    @Param("qId") int id);

    //根据用户id查询名下日记
    @Query(value = "select * from blog b where b.user_id=?1", nativeQuery = true)
    List<BlogEntity> findByName(String user_id);
}