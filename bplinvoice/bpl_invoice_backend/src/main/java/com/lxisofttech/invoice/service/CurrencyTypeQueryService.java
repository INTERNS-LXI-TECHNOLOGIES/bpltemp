package com.lxisofttech.invoice.service;

import com.lxisofttech.invoice.domain.*; // for static metamodels
import com.lxisofttech.invoice.domain.CurrencyType;
import com.lxisofttech.invoice.repository.CurrencyTypeRepository;
import com.lxisofttech.invoice.service.criteria.CurrencyTypeCriteria;
import com.lxisofttech.invoice.service.dto.CurrencyTypeDTO;
import com.lxisofttech.invoice.service.mapper.CurrencyTypeMapper;
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
 * Service for executing complex queries for {@link CurrencyType} entities in the database.
 * The main input is a {@link CurrencyTypeCriteria} which gets converted to {@link Specification},
 * in a way that all the filters must apply.
 * It returns a {@link Page} of {@link CurrencyTypeDTO} which fulfills the criteria.
 */
@Service
@Transactional(readOnly = true)
public class CurrencyTypeQueryService extends QueryService<CurrencyType> {

    private static final Logger LOG = LoggerFactory.getLogger(CurrencyTypeQueryService.class);

    private final CurrencyTypeRepository currencyTypeRepository;

    private final CurrencyTypeMapper currencyTypeMapper;

    public CurrencyTypeQueryService(CurrencyTypeRepository currencyTypeRepository, CurrencyTypeMapper currencyTypeMapper) {
        this.currencyTypeRepository = currencyTypeRepository;
        this.currencyTypeMapper = currencyTypeMapper;
    }

    /**
     * Return a {@link Page} of {@link CurrencyTypeDTO} which matches the criteria from the database.
     * @param criteria The object which holds all the filters, which the entities should match.
     * @param page The page, which should be returned.
     * @return the matching entities.
     */
    @Transactional(readOnly = true)
    public Page<CurrencyTypeDTO> findByCriteria(CurrencyTypeCriteria criteria, Pageable page) {
        LOG.debug("find by criteria : {}, page: {}", criteria, page);
        final Specification<CurrencyType> specification = createSpecification(criteria);
        return currencyTypeRepository.findAll(specification, page).map(currencyTypeMapper::toDto);
    }

    /**
     * Return the number of matching entities in the database.
     * @param criteria The object which holds all the filters, which the entities should match.
     * @return the number of matching entities.
     */
    @Transactional(readOnly = true)
    public long countByCriteria(CurrencyTypeCriteria criteria) {
        LOG.debug("count by criteria : {}", criteria);
        final Specification<CurrencyType> specification = createSpecification(criteria);
        return currencyTypeRepository.count(specification);
    }

    /**
     * Function to convert {@link CurrencyTypeCriteria} to a {@link Specification}
     * @param criteria The object which holds all the filters, which the entities should match.
     * @return the matching {@link Specification} of the entity.
     */
    protected Specification<CurrencyType> createSpecification(CurrencyTypeCriteria criteria) {
        Specification<CurrencyType> specification = Specification.where(null);
        if (criteria != null) {
            // This has to be called first, because the distinct method returns null
            if (criteria.getDistinct() != null) {
                specification = specification.and(distinct(criteria.getDistinct()));
            }
            if (criteria.getId() != null) {
                specification = specification.and(buildRangeSpecification(criteria.getId(), CurrencyType_.id));
            }
            if (criteria.getName() != null) {
                specification = specification.and(buildStringSpecification(criteria.getName(), CurrencyType_.name));
            }
            if (criteria.getCurrencyTypeId() != null) {
                specification = specification.and(
                    buildSpecification(criteria.getCurrencyTypeId(), root ->
                        root.join(CurrencyType_.currencyTypes, JoinType.LEFT).get(WayBill_.id)
                    )
                );
            }
        }
        return specification;
    }
}
