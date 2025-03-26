package com.lxisofttech.invoice.repository;

import com.lxisofttech.invoice.domain.CurrencyType;
import org.springframework.data.jpa.repository.*;
import org.springframework.stereotype.Repository;

/**
 * Spring Data JPA repository for the CurrencyType entity.
 */
@SuppressWarnings("unused")
@Repository
public interface CurrencyTypeRepository extends JpaRepository<CurrencyType, Long> {}
