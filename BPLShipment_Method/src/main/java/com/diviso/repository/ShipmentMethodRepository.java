package com.diviso.repository;

import com.diviso.domain.ShipmentMethod;
import org.springframework.data.domain.Pageable;
import org.springframework.data.r2dbc.repository.Query;
import org.springframework.data.repository.reactive.ReactiveCrudRepository;
import org.springframework.stereotype.Repository;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

/**
 * Spring Data R2DBC repository for the ShipmentMethod entity.
 */
@SuppressWarnings("unused")
@Repository
public interface ShipmentMethodRepository extends ReactiveCrudRepository<ShipmentMethod, Long>, ShipmentMethodRepositoryInternal {
    Flux<ShipmentMethod> findAllBy(Pageable pageable);

    @Override
    Mono<ShipmentMethod> findOneWithEagerRelationships(Long id);

    @Override
    Flux<ShipmentMethod> findAllWithEagerRelationships();

    @Override
    Flux<ShipmentMethod> findAllWithEagerRelationships(Pageable page);

    @Query("SELECT * FROM shipment_method entity WHERE entity.parent_type_id = :id")
    Flux<ShipmentMethod> findByParentType(Long id);

    @Query("SELECT * FROM shipment_method entity WHERE entity.parent_type_id IS NULL")
    Flux<ShipmentMethod> findAllWhereParentTypeIsNull();

    @Override
    <S extends ShipmentMethod> Mono<S> save(S entity);

    @Override
    Flux<ShipmentMethod> findAll();

    @Override
    Mono<ShipmentMethod> findById(Long id);

    @Override
    Mono<Void> deleteById(Long id);
}

interface ShipmentMethodRepositoryInternal {
    <S extends ShipmentMethod> Mono<S> save(S entity);

    Flux<ShipmentMethod> findAllBy(Pageable pageable);

    Flux<ShipmentMethod> findAll();

    Mono<ShipmentMethod> findById(Long id);
    // this is not supported at the moment because of https://github.com/jhipster/generator-jhipster/issues/18269
    // Flux<ShipmentMethod> findAllBy(Pageable pageable, Criteria criteria);

    Mono<ShipmentMethod> findOneWithEagerRelationships(Long id);

    Flux<ShipmentMethod> findAllWithEagerRelationships();

    Flux<ShipmentMethod> findAllWithEagerRelationships(Pageable page);

    Mono<Void> deleteById(Long id);
}
