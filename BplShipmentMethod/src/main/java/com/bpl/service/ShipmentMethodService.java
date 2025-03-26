package com.bpl.service;

import com.bpl.domain.ShipmentMethod;
import com.bpl.repository.ShipmentMethodRepository;
import com.bpl.service.dto.ShipmentMethodDTO;
import com.bpl.service.mapper.ShipmentMethodMapper;
import java.util.Optional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Service Implementation for managing {@link com.bpl.domain.ShipmentMethod}.
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
    public ShipmentMethodDTO save(ShipmentMethodDTO shipmentMethodDTO) {
        LOG.debug("Request to save ShipmentMethod : {}", shipmentMethodDTO);
        ShipmentMethod shipmentMethod = shipmentMethodMapper.toEntity(shipmentMethodDTO);
        shipmentMethod = shipmentMethodRepository.save(shipmentMethod);
        return shipmentMethodMapper.toDto(shipmentMethod);
    }

    /**
     * Update a shipmentMethod.
     *
     * @param shipmentMethodDTO the entity to save.
     * @return the persisted entity.
     */
    public ShipmentMethodDTO update(ShipmentMethodDTO shipmentMethodDTO) {
        LOG.debug("Request to update ShipmentMethod : {}", shipmentMethodDTO);
        ShipmentMethod shipmentMethod = shipmentMethodMapper.toEntity(shipmentMethodDTO);
        shipmentMethod = shipmentMethodRepository.save(shipmentMethod);
        return shipmentMethodMapper.toDto(shipmentMethod);
    }

    /**
     * Partially update a shipmentMethod.
     *
     * @param shipmentMethodDTO the entity to update partially.
     * @return the persisted entity.
     */
    public Optional<ShipmentMethodDTO> partialUpdate(ShipmentMethodDTO shipmentMethodDTO) {
        LOG.debug("Request to partially update ShipmentMethod : {}", shipmentMethodDTO);

        return shipmentMethodRepository
            .findById(shipmentMethodDTO.getId())
            .map(existingShipmentMethod -> {
                shipmentMethodMapper.partialUpdate(existingShipmentMethod, shipmentMethodDTO);

                return existingShipmentMethod;
            })
            .map(shipmentMethodRepository::save)
            .map(shipmentMethodMapper::toDto);
    }

    /**
     * Get all the shipmentMethods.
     *
     * @param pageable the pagination information.
     * @return the list of entities.
     */
    @Transactional(readOnly = true)
    public Page<ShipmentMethodDTO> findAll(Pageable pageable) {
        LOG.debug("Request to get all ShipmentMethods");
        return shipmentMethodRepository.findAll(pageable).map(shipmentMethodMapper::toDto);
    }

    /**
     * Get all the shipmentMethods with eager load of many-to-many relationships.
     *
     * @return the list of entities.
     */
    public Page<ShipmentMethodDTO> findAllWithEagerRelationships(Pageable pageable) {
        return shipmentMethodRepository.findAllWithEagerRelationships(pageable).map(shipmentMethodMapper::toDto);
    }

    /**
     * Get one shipmentMethod by id.
     *
     * @param id the id of the entity.
     * @return the entity.
     */
    @Transactional(readOnly = true)
    public Optional<ShipmentMethodDTO> findOne(Long id) {
        LOG.debug("Request to get ShipmentMethod : {}", id);
        return shipmentMethodRepository.findOneWithEagerRelationships(id).map(shipmentMethodMapper::toDto);
    }

    /**
     * Delete the shipmentMethod by id.
     *
     * @param id the id of the entity.
     */
    public void delete(Long id) {
        LOG.debug("Request to delete ShipmentMethod : {}", id);
        shipmentMethodRepository.deleteById(id);
    }
}
