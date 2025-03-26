package com.diviso.service;

import com.diviso.repository.ShipmentMethodRepository;
import com.diviso.service.dto.ShipmentMethodDTO;
import com.diviso.service.mapper.ShipmentMethodMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

/**
 * Service Implementation for managing {@link com.diviso.domain.ShipmentMethod}.
 */
@Service
@Transactional
public class ShipmentMethodService {

    private static final Logger LOG = LoggerFactory.getLogger(ShipmentMethodService.class);

    private final ShipmentMethodRepository shipmentMethodRepository;

    private final ShipmentMethodMapper shipmentMethodMapper;

    public ShipmentMethodService(ShipmentMethodRepository shipmentMethodRepository, ShipmentMethodMapper shipmentMethodMapper) {
        this.shipmentMethodRepository = shipmentMethodRepository;
        this.shipmentMethodMapper = shipmentMethodMapper;
    }

    /**
     * Save a shipmentMethod.
     *
     * @param shipmentMethodDTO the entity to save.
     * @return the persisted entity.
     */
    public Mono<ShipmentMethodDTO> save(ShipmentMethodDTO shipmentMethodDTO) {
        LOG.debug("Request to save ShipmentMethod : {}", shipmentMethodDTO);
        return shipmentMethodRepository.save(shipmentMethodMapper.toEntity(shipmentMethodDTO)).map(shipmentMethodMapper::toDto);
    }

    /**
     * Update a shipmentMethod.
     *
     * @param shipmentMethodDTO the entity to save.
     * @return the persisted entity.
     */
    public Mono<ShipmentMethodDTO> update(ShipmentMethodDTO shipmentMethodDTO) {
        LOG.debug("Request to update ShipmentMethod : {}", shipmentMethodDTO);
        return shipmentMethodRepository.save(shipmentMethodMapper.toEntity(shipmentMethodDTO)).map(shipmentMethodMapper::toDto);
    }

    /**
     * Partially update a shipmentMethod.
     *
     * @param shipmentMethodDTO the entity to update partially.
     * @return the persisted entity.
     */
    public Mono<ShipmentMethodDTO> partialUpdate(ShipmentMethodDTO shipmentMethodDTO) {
        LOG.debug("Request to partially update ShipmentMethod : {}", shipmentMethodDTO);

        return shipmentMethodRepository
            .findById(shipmentMethodDTO.getId())
            .map(existingShipmentMethod -> {
                shipmentMethodMapper.partialUpdate(existingShipmentMethod, shipmentMethodDTO);

                return existingShipmentMethod;
            })
            .flatMap(shipmentMethodRepository::save)
            .map(shipmentMethodMapper::toDto);
    }

    /**
     * Get all the shipmentMethods.
     *
     * @param pageable the pagination information.
     * @return the list of entities.
     */
    @Transactional(readOnly = true)
    public Flux<ShipmentMethodDTO> findAll(Pageable pageable) {
        LOG.debug("Request to get all ShipmentMethods");
        return shipmentMethodRepository.findAllBy(pageable).map(shipmentMethodMapper::toDto);
    }

    /**
     * Get all the shipmentMethods with eager load of many-to-many relationships.
     *
     * @return the list of entities.
     */
    public Flux<ShipmentMethodDTO> findAllWithEagerRelationships(Pageable pageable) {
        return shipmentMethodRepository.findAllWithEagerRelationships(pageable).map(shipmentMethodMapper::toDto);
    }

    /**
     * Returns the number of shipmentMethods available.
     * @return the number of entities in the database.
     *
     */
    public Mono<Long> countAll() {
        return shipmentMethodRepository.count();
    }

    /**
     * Get one shipmentMethod by id.
     *
     * @param id the id of the entity.
     * @return the entity.
     */
    @Transactional(readOnly = true)
    public Mono<ShipmentMethodDTO> findOne(Long id) {
        LOG.debug("Request to get ShipmentMethod : {}", id);
        return shipmentMethodRepository.findOneWithEagerRelationships(id).map(shipmentMethodMapper::toDto);
    }

    /**
     * Delete the shipmentMethod by id.
     *
     * @param id the id of the entity.
     * @return a Mono to signal the deletion
     */
    public Mono<Void> delete(Long id) {
        LOG.debug("Request to delete ShipmentMethod : {}", id);
        return shipmentMethodRepository.deleteById(id);
    }
}
