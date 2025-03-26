package com.bpl.repository;

import com.bpl.domain.AgentType;
import org.springframework.data.jpa.repository.*;
import org.springframework.stereotype.Repository;

/**
 * Spring Data JPA repository for the AgentType entity.
 */
@SuppressWarnings("unused")
@Repository
public interface AgentTypeRepository extends JpaRepository<AgentType, Long>, JpaSpecificationExecutor<AgentType> {}
