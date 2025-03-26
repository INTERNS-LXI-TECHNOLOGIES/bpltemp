package com.bpl.repository;

import com.bpl.domain.ShipmentMethod;
import java.util.List;
import java.util.Optional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.*;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 * Spring Data JPA repository for the ShipmentMethod entity.
 */
@Repository
public interface ShipmentMethodRepository extends JpaRepository<ShipmentMethod, Long> {
    default Optional<ShipmentMethod> findOneWithEagerRelationships(Long id) {
        return this.findOneWithToOneRelationships(id);
    }

    default List<ShipmentMethod> findAllWithEagerRelationships() {
        return this.findAllWithToOneRelationships();
    }

    default Page<ShipmentMethod> findAllWithEagerRelationships(Pageable pageable) {
        return this.findAllWithToOneRelationships(pageable);
    }

    @Query(
        value = "select shipmentMethod from ShipmentMethod shipmentMethod left join fetch shipmentMethod.parentType",
        countQuery = "select count(shipmentMethod) from ShipmentMethod shipmentMethod"
    )
    Page<ShipmentMethod> findAllWithToOneRelationships(Pageable pageable);

    @Query("select shipmentMethod from ShipmentMethod shipmentMethod left join fetch shipmentMethod.parentType")
    List<ShipmentMethod> findAllWithToOneRelationships();

    @Query(
        "select shipmentMethod from ShipmentMethod shipmentMethod left join fetch shipmentMethod.parentType where shipmentMethod.id =:id"
    )
    Optional<ShipmentMethod> findOneWithToOneRelationships(@Param("id") Long id);
}
