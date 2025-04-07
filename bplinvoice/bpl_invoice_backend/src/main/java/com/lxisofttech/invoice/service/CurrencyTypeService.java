package com.lxisofttech.invoice.service;

import com.lxisofttech.invoice.domain.CurrencyType;
import com.lxisofttech.invoice.repository.CurrencyTypeRepository;
import com.lxisofttech.invoice.service.dto.CurrencyTypeDTO;
import com.lxisofttech.invoice.service.mapper.CurrencyTypeMapper;
import java.util.Optional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Service Implementation for managing {@link com.lxisofttech.invoice.domain.CurrencyType}.
 */
@Service
@Transactional
public class CurrencyTypeService {

    private static final Logger LOG = LoggerFactory.getLogger(CurrencyTypeService.class);

    private final CurrencyTypeRepository currencyTypeRepository;

    private final CurrencyTypeMapper currencyTypeMapper;

    public CurrencyTypeService(CurrencyTypeRepository currencyTypeRepository, CurrencyTypeMapper currencyTypeMapper) {
        this.currencyTypeRepository = currencyTypeRepository;
        this.currencyTypeMapper = currencyTypeMapper;
    }

    /**
     * Save a currencyType.
     *
     * @param currencyTypeDTO the entity to save.
     * @return the persisted entity.
     */
    public CurrencyTypeDTO save(CurrencyTypeDTO currencyTypeDTO) {
        LOG.debug("Request to save CurrencyType : {}", currencyTypeDTO);
        CurrencyType currencyType = currencyTypeMapper.toEntity(currencyTypeDTO);
        currencyType = currencyTypeRepository.save(currencyType);
        return currencyTypeMapper.toDto(currencyType);
    }

    /**
     * Update a currencyType.
     *
     * @param currencyTypeDTO the entity to save.
     * @return the persisted entity.
     */
    public CurrencyTypeDTO update(CurrencyTypeDTO currencyTypeDTO) {
        LOG.debug("Request to update CurrencyType : {}", currencyTypeDTO);
        CurrencyType currencyType = currencyTypeMapper.toEntity(currencyTypeDTO);
        currencyType = currencyTypeRepository.save(currencyType);
        return currencyTypeMapper.toDto(currencyType);
    }

    /**
     * Partially update a currencyType.
     *
     * @param currencyTypeDTO the entity to update partially.
     * @return the persisted entity.
     */
    public Optional<CurrencyTypeDTO> partialUpdate(CurrencyTypeDTO currencyTypeDTO) {
        LOG.debug("Request to partially update CurrencyType : {}", currencyTypeDTO);

        return currencyTypeRepository
            .findById(currencyTypeDTO.getId())
            .map(existingCurrencyType -> {
                currencyTypeMapper.partialUpdate(existingCurrencyType, currencyTypeDTO);

                return existingCurrencyType;
            })
            .map(currencyTypeRepository::save)
            .map(currencyTypeMapper::toDto);
    }

    /**
     * Get one currencyType by id.
     *
     * @param id the id of the entity.
     * @return the entity.
     */
    @Transactional(readOnly = true)
    public Optional<CurrencyTypeDTO> findOne(Long id) {
        LOG.debug("Request to get CurrencyType : {}", id);
        return currencyTypeRepository.findById(id).map(currencyTypeMapper::toDto);
    }

    /**
     * Delete the currencyType by id.
     *
     * @param id the id of the entity.
     */
    public void delete(Long id) {
        LOG.debug("Request to delete CurrencyType : {}", id);
        currencyTypeRepository.deleteById(id);
    }
}
