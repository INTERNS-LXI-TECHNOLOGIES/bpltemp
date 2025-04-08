package com.lxisofttech.invoice.service;

import com.lxisofttech.invoice.domain.WayBill;
import com.lxisofttech.invoice.repository.WayBillRepository;
import com.lxisofttech.invoice.service.dto.WayBillDTO;
import com.lxisofttech.invoice.service.mapper.WayBillMapper;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Service Implementation for managing {@link com.lxisofttech.invoice.domain.WayBill}.
 */
@Service
@Transactional
public class WayBillService {

    private static final Logger LOG = LoggerFactory.getLogger(WayBillService.class);

    private final WayBillRepository wayBillRepository;

    private final WayBillMapper wayBillMapper;

    public WayBillService(WayBillRepository wayBillRepository, WayBillMapper wayBillMapper) {
        this.wayBillRepository = wayBillRepository;
        this.wayBillMapper = wayBillMapper;
    }

    /**
     * Save a wayBill.
     *
     * @param wayBillDTO the entity to save.
     * @return the persisted entity.
     */
    public WayBillDTO save(WayBillDTO wayBillDTO) {
        LOG.debug("Request to save WayBill : {}", wayBillDTO);
        WayBill wayBill = wayBillMapper.toEntity(wayBillDTO);
        wayBill = wayBillRepository.save(wayBill);
        return wayBillMapper.toDto(wayBill);
    }

    /**
     * Update a wayBill.
     *
     * @param wayBillDTO the entity to save.
     * @return the persisted entity.
     */
    public WayBillDTO update(WayBillDTO wayBillDTO) {
        LOG.debug("Request to update WayBill : {}", wayBillDTO);
        WayBill wayBill = wayBillMapper.toEntity(wayBillDTO);
        wayBill = wayBillRepository.save(wayBill);
        return wayBillMapper.toDto(wayBill);
    }

    /**
     * Partially update a wayBill.
     *
     * @param wayBillDTO the entity to update partially.
     * @return the persisted entity.
     */
    public Optional<WayBillDTO> partialUpdate(WayBillDTO wayBillDTO) {
        LOG.debug("Request to partially update WayBill : {}", wayBillDTO);

        return wayBillRepository
            .findById(wayBillDTO.getId())
            .map(existingWayBill -> {
                wayBillMapper.partialUpdate(existingWayBill, wayBillDTO);

                return existingWayBill;
            })
            .map(wayBillRepository::save)
            .map(wayBillMapper::toDto);
    }

    /**
     * Get one wayBill by id.
     *
     * @param id the id of the entity.
     * @return the entity.
     */
    @Transactional(readOnly = true)
    public Optional<WayBillDTO> findOne(Long id) {
        LOG.debug("Request to get WayBill : {}", id);
        return wayBillRepository.findById(id).map(wayBillMapper::toDto);
    }

    /**
     * Delete the wayBill by id.
     *
     * @param id the id of the entity.
     */
    public void delete(Long id) {
        LOG.debug("Request to delete WayBill : {}", id);
        wayBillRepository.deleteById(id);
    }

    @Transactional(readOnly = true)
    public List<Long> getWayBillIdsByCurrency(String currency) {
        List<WayBill> wayBills = wayBillRepository.findByCurrencyType_Name(currency);
        return wayBills.stream()
                       .map(WayBill::getId)
                       .collect(Collectors.toList());
    }
    
}
