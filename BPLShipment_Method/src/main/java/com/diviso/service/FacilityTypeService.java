package com.diviso.service;

import com.diviso.repository.FacilityTypeRepository;
import com.diviso.service.dto.FacilityTypeDTO;
import com.diviso.service.mapper.FacilityTypeMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

/**
 * Service Implementation for managing {@link com.diviso.domain.FacilityType}.
 */
@Service
@Transactional
public class FacilityTypeService {

    private static final Logger LOG = LoggerFactory.getLogger(FacilityTypeService.class);

    private final FacilityTypeRepository facilityTypeRepository;

    private final FacilityTypeMapper facilityTypeMapper;

    public FacilityTypeService(FacilityTypeRepository facilityTypeRepository, FacilityTypeMapper facilityTypeMapper) {
        this.facilityTypeRepository = facilityTypeRepository;
        this.facilityTypeMapper = facilityTypeMapper;
    }

    /**
     * Save a facilityType.
     *
     * @param facilityTypeDTO the entity to save.
     * @return the persisted entity.
     */
    public Mono<FacilityTypeDTO> save(FacilityTypeDTO facilityTypeDTO) {
        LOG.debug("Request to save FacilityType : {}", facilityTypeDTO);
        return facilityTypeRepository.save(facilityTypeMapper.toEntity(facilityTypeDTO)).map(facilityTypeMapper::toDto);
    }

    /**
     * Update a facilityType.
     *
     * @param facilityTypeDTO the entity to save.
     * @return the persisted entity.
     */
    public Mono<FacilityTypeDTO> update(FacilityTypeDTO facilityTypeDTO) {
        LOG.debug("Request to update FacilityType : {}", facilityTypeDTO);
        return facilityTypeRepository.save(facilityTypeMapper.toEntity(facilityTypeDTO)).map(facilityTypeMapper::toDto);
    }

    /**
     * Partially update a facilityType.
     *
     * @param facilityTypeDTO the entity to update partially.
     * @return the persisted entity.
     */
    public Mono<FacilityTypeDTO> partialUpdate(FacilityTypeDTO facilityTypeDTO) {
        LOG.debug("Request to partially update FacilityType : {}", facilityTypeDTO);

        return facilityTypeRepository
            .findById(facilityTypeDTO.getId())
            .map(existingFacilityType -> {
                facilityTypeMapper.partialUpdate(existingFacilityType, facilityTypeDTO);

                return existingFacilityType;
            })
            .flatMap(facilityTypeRepository::save)
            .map(facilityTypeMapper::toDto);
    }

    /**
     * Get all the facilityTypes.
     *
     * @return the list of entities.
     */
    @Transactional(readOnly = true)
    public Flux<FacilityTypeDTO> findAll() {
        LOG.debug("Request to get all FacilityTypes");
        return facilityTypeRepository.findAll().map(facilityTypeMapper::toDto);
    }

    /**
     * Returns the number of facilityTypes available.
     * @return the number of entities in the database.
     *
     */
    public Mono<Long> countAll() {
        return facilityTypeRepository.count();
    }

    /**
     * Get one facilityType by id.
     *
     * @param id the id of the entity.
     * @return the entity.
     */
    @Transactional(readOnly = true)
    public Mono<FacilityTypeDTO> findOne(Long id) {
        LOG.debug("Request to get FacilityType : {}", id);
        return facilityTypeRepository.findById(id).map(facilityTypeMapper::toDto);
    }

    /**
     * Delete the facilityType by id.
     *
     * @param id the id of the entity.
     * @return a Mono to signal the deletion
     */
    public Mono<Void> delete(Long id) {
        LOG.debug("Request to delete FacilityType : {}", id);
        return facilityTypeRepository.deleteById(id);
    }
}
