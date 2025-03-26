package com.lxisofttech.invoice.repository;

import com.lxisofttech.invoice.domain.WayBill;
import org.springframework.data.jpa.repository.*;
import org.springframework.stereotype.Repository;

/**
 * Spring Data JPA repository for the WayBill entity.
 */
@SuppressWarnings("unused")
@Repository
public interface WayBillRepository extends JpaRepository<WayBill, Long> {}
