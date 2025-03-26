package com.mycompany.organizationbackend.repository;

import com.mycompany.organizationbackend.domain.ParentOrganization;
import org.springframework.data.jpa.repository.*;
import org.springframework.stereotype.Repository;

/**
 * Spring Data JPA repository for the ParentOrganization entity.
 */
@SuppressWarnings("unused")
@Repository
public interface ParentOrganizationRepository extends JpaRepository<ParentOrganization, Long> {}
