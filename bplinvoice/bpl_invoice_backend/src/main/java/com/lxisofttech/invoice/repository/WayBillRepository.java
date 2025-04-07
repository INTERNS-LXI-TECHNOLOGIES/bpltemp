package com.lxisofttech.invoice.repository;

import com.lxisofttech.invoice.domain.WayBill;

import java.util.List;

import org.springframework.data.jpa.repository.*;
import org.springframework.stereotype.Repository;

/**
 * Spring Data JPA repository for the WayBill entity.
 */
@SuppressWarnings("unused")
@Repository
public interface WayBillRepository extends JpaRepository<WayBill, Long>, JpaSpecificationExecutor<WayBill> {
    List<WayBill> findByCurrencyType_Id(Long currencyTypeId);
    List<WayBill> findByCurrencyType_Name(String currencyName);
    
@Query("SELECT wb FROM WayBill wb JOIN FETCH wb.currencyType")
List<WayBill> findAllWithCurrencyType();

}