package com.bpl.service;

import com.bpl.domain.FacilityType;
import com.bpl.repository.FacilityTypeRepository;
import com.bpl.service.dto.FacilityTypeDTO;
import com.bpl.service.mapper.FacilityTypeMapper;
import java.util.LinkedList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Service Implementation for managing {@link com.bpl.domain.FacilityType}.
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
    public FacilityTypeDTO save(FacilityTypeDTO facilityTypeDTO) {
        LOG.debug("Request to save FacilityType : {}", facilityTypeDTO);
        FacilityType facilityType = facilityTypeMapper.toEntity(facilityTypeDTO);
        facilityType = facilityTypeRepository.save(facilityType);
        return facilityTypeMapper.toDto(facilityType);
    }

    /**
     * Update a facilityType.
     *
     * @param facilityTypeDTO the entity to save.
     * @return the persisted entity.
     */
    public FacilityTypeDTO update(FacilityTypeDTO facilityTypeDTO) {
        LOG.debug("Request to update FacilityType : {}", facilityTypeDTO);
        FacilityType facilityType = facilityTypeMapper.toEntity(facilityTypeDTO);
        facilityType = facilityTypeRepository.save(facilityType);
        return facilityTypeMapper.toDto(facilityType);
    }

    /**
     * Partially update a facilityType.
     *
     * @param facilityTypeDTO the entity to update partially.
     * @return the persisted entity.
     */
    public Optional<FacilityTypeDTO> partialUpdate(FacilityTypeDTO facilityTypeDTO) {
        LOG.debug("Request to partially update FacilityType : {}", facilityTypeDTO);

        return facilityTypeRepository
            .findById(facilityTypeDTO.getId())
            .map(existingFacilityType -> {
                facilityTypeMapper.partialUpdate(existingFacilityType, facilityTypeDTO);

                return existingFacilityType;
            })
            .map(facilityTypeRepository::save)
            .map(facilityTypeMapper::toDto);
    }

    /**
     * Get all the facilityTypes.
     *
     * @return the list of entities.
     */
    @Transactional(readOnly = true)
    public List<FacilityTypeDTO> findAll() {
        LOG.debug("Request to get all FacilityTypes");
        return facilityTypeRepository.findAll().stream().map(facilityTypeMapper::toDto).collect(Collectors.toCollection(LinkedList::new));
    }

    /**
     * Get one facilityType by id.
     *
     * @param id the id of the entity.
     * @return the entity.
     */
    @Transactional(readOnly = true)
    public Optional<FacilityTypeDTO> findOne(Long id) {
        LOG.debug("Request to get FacilityType : {}", id);
        return facilityTypeRepository.findById(id).map(facilityTypeMapper::toDto);
    }

    /**
     * Delete the facilityType by id.
     *
     * @param id the id of the entity.
     */
    public void delete(Long id) {
        LOG.debug("Request to delete FacilityType : {}", id);
        facilityTypeRepository.deleteById(id);
    }
}
