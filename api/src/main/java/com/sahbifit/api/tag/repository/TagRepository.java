// Pfad: src/main/java/com/sahbifit/api/tag/repository/TagRepository.java
package com.sahbifit.api.tag.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sahbifit.api.tag.model.Tag;

@Repository
public interface TagRepository extends JpaRepository<Tag, Integer> {
    // Spring Data JPA automatically provides the findById(Integer id) method
    // which is used in your AuthService.
}