package com.lxisoft.organizationbackend.repository;

import com.lxisoft.organizationbackend.domain.Parentorganization;
import org.springframework.data.jpa.repository.*;
import org.springframework.stereotype.Repository;

/**
 * Spring Data JPA repository for the Parentorganization entity.
 */
@SuppressWarnings("unused")
@Repository
public interface ParentorganizationRepository extends JpaRepository<Parentorganization, Long> {}
