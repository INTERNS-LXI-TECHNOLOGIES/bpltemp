package com.diviso.repository;

import com.diviso.domain.FacilityType;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.reactive.ReactiveCrudRepository;
import org.springframework.stereotype.Repository;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

/**
 * Spring Data R2DBC repository for the FacilityType entity.
 */
@SuppressWarnings("unused")
@Repository
public interface FacilityTypeRepository extends ReactiveCrudRepository<FacilityType, Long>, FacilityTypeRepositoryInternal {
    @Override
    <S extends FacilityType> Mono<S> save(S entity);

    @Override
    Flux<FacilityType> findAll();

    @Override
    Mono<FacilityType> findById(Long id);

    @Override
    Mono<Void> deleteById(Long id);
}

interface FacilityTypeRepositoryInternal {
    <S extends FacilityType> Mono<S> save(S entity);

    Flux<FacilityType> findAllBy(Pageable pageable);

    Flux<FacilityType> findAll();

    Mono<FacilityType> findById(Long id);
    // this is not supported at the moment because of https://github.com/jhipster/generator-jhipster/issues/18269
    // Flux<FacilityType> findAllBy(Pageable pageable, Criteria criteria);
}
