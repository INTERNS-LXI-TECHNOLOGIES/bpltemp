package com.lxisofttech.invoice.service;

import com.lxisofttech.invoice.domain.*; // for static metamodels
import com.lxisofttech.invoice.domain.WayBill;
import com.lxisofttech.invoice.repository.WayBillRepository;
import com.lxisofttech.invoice.service.criteria.WayBillCriteria;
import com.lxisofttech.invoice.service.dto.WayBillDTO;
import com.lxisofttech.invoice.service.mapper.WayBillMapper;
import jakarta.persistence.criteria.JoinType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tech.jhipster.service.QueryService;

/**
 * Service for executing complex queries for {@link WayBill} entities in the database.
 * The main input is a {@link WayBillCriteria} which gets converted to {@link Specification},
 * in a way that all the filters must apply.
 * It returns a {@link Page} of {@link WayBillDTO} which fulfills the criteria.
 */
@Service
@Transactional(readOnly = true)
public class WayBillQueryService extends QueryService<WayBill> {

    private static final Logger LOG = LoggerFactory.getLogger(WayBillQueryService.class);

    private final WayBillRepository wayBillRepository;

    private final WayBillMapper wayBillMapper;

    public WayBillQueryService(WayBillRepository wayBillRepository, WayBillMapper wayBillMapper) {
        this.wayBillRepository = wayBillRepository;
        this.wayBillMapper = wayBillMapper;
    }

    /**
     * Return a {@link Page} of {@link WayBillDTO} which matches the criteria from the database.
     * @param criteria The object which holds all the filters, which the entities should match.
     * @param page The page, which should be returned.
     * @return the matching entities.
     */
    @Transactional(readOnly = true)
    public Page<WayBillDTO> findByCriteria(WayBillCriteria criteria, Pageable page) {
        LOG.debug("find by criteria : {}, page: {}", criteria, page);
        final Specification<WayBill> specification = createSpecification(criteria);
        return wayBillRepository.findAll(specification, page).map(wayBillMapper::toDto);
    }

    /**
     * Return the number of matching entities in the database.
     * @param criteria The object which holds all the filters, which the entities should match.
     * @return the number of matching entities.
     */
    @Transactional(readOnly = true)
    public long countByCriteria(WayBillCriteria criteria) {
        LOG.debug("count by criteria : {}", criteria);
        final Specification<WayBill> specification = createSpecification(criteria);
        return wayBillRepository.count(specification);
    }

    /**
     * Function to convert {@link WayBillCriteria} to a {@link Specification}
     * @param criteria The object which holds all the filters, which the entities should match.
     * @return the matching {@link Specification} of the entity.
     */
    protected Specification<WayBill> createSpecification(WayBillCriteria criteria) {
        Specification<WayBill> specification = Specification.where(null);
        if (criteria != null) {
            // This has to be called first, because the distinct method returns null
            if (criteria.getDistinct() != null) {
                specification = specification.and(distinct(criteria.getDistinct()));
            }
            if (criteria.getId() != null) {
                specification = specification.and(buildRangeSpecification(criteria.getId(), WayBill_.id));
            }
            if (criteria.getBoxLimit() != null) {
                specification = specification.and(buildRangeSpecification(criteria.getBoxLimit(), WayBill_.boxLimit));
            }
            if (criteria.getShipmentType() != null) {
                specification = specification.and(buildStringSpecification(criteria.getShipmentType(), WayBill_.shipmentType));
            }
            if (criteria.getOpfac() != null) {
                specification = specification.and(buildStringSpecification(criteria.getOpfac(), WayBill_.opfac));
            }
            if (criteria.getDeliveryAgent() != null) {
                specification = specification.and(buildStringSpecification(criteria.getDeliveryAgent(), WayBill_.deliveryAgent));
            }
            if (criteria.getEstimatedReadyDate() != null) {
                specification = specification.and(buildRangeSpecification(criteria.getEstimatedReadyDate(), WayBill_.estimatedReadyDate));
            }
            if (criteria.getCurrencyUom() != null) {
                specification = specification.and(buildStringSpecification(criteria.getCurrencyUom(), WayBill_.currencyUom));
            }
            if (criteria.getEstimatedShipDate() != null) {
                specification = specification.and(buildRangeSpecification(criteria.getEstimatedShipDate(), WayBill_.estimatedShipDate));
            }
            if (criteria.getStatus() != null) {
                specification = specification.and(buildStringSpecification(criteria.getStatus(), WayBill_.status));
            }
            if (criteria.getReferenceNumber() != null) {
                specification = specification.and(buildStringSpecification(criteria.getReferenceNumber(), WayBill_.referenceNumber));
            }
            if (criteria.getCurrencyTypeId() != null) {
                specification = specification.and(
                    buildSpecification(criteria.getCurrencyTypeId(), root ->
                        root.join(WayBill_.currencyType, JoinType.LEFT).get(CurrencyType_.id)
                    )
                );
            }
        }
        return specification;
    }
}
