package com.bpl.service;

import com.bpl.domain.*; // for static metamodels
import com.bpl.domain.Organisation;
import com.bpl.repository.OrganisationRepository;
import com.bpl.service.criteria.OrganisationCriteria;
import com.bpl.service.dto.OrganisationDTO;
import com.bpl.service.mapper.OrganisationMapper;
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
 * Service for executing complex queries for {@link Organisation} entities in the database.
 * The main input is a {@link OrganisationCriteria} which gets converted to {@link Specification},
 * in a way that all the filters must apply.
 * It returns a {@link Page} of {@link OrganisationDTO} which fulfills the criteria.
 */
@Service
@Transactional(readOnly = true)
public class OrganisationQueryService extends QueryService<Organisation> {

    private static final Logger LOG = LoggerFactory.getLogger(OrganisationQueryService.class);

    private final OrganisationRepository organisationRepository;

    private final OrganisationMapper organisationMapper;

    public OrganisationQueryService(OrganisationRepository organisationRepository, OrganisationMapper organisationMapper) {
        this.organisationRepository = organisationRepository;
        this.organisationMapper = organisationMapper;
    }

    /**
     * Return a {@link Page} of {@link OrganisationDTO} which matches the criteria from the database.
     * @param criteria The object which holds all the filters, which the entities should match.
     * @param page The page, which should be returned.
     * @return the matching entities.
     */
    @Transactional(readOnly = true)
    public Page<OrganisationDTO> findByCriteria(OrganisationCriteria criteria, Pageable page) {
        LOG.debug("find by criteria : {}, page: {}", criteria, page);
        final Specification<Organisation> specification = createSpecification(criteria);
        return organisationRepository.findAll(specification, page).map(organisationMapper::toDto);
    }

    /**
     * Return the number of matching entities in the database.
     * @param criteria The object which holds all the filters, which the entities should match.
     * @return the number of matching entities.
     */
    @Transactional(readOnly = true)
    public long countByCriteria(OrganisationCriteria criteria) {
        LOG.debug("count by criteria : {}", criteria);
        final Specification<Organisation> specification = createSpecification(criteria);
        return organisationRepository.count(specification);
    }

    /**
     * Function to convert {@link OrganisationCriteria} to a {@link Specification}
     * @param criteria The object which holds all the filters, which the entities should match.
     * @return the matching {@link Specification} of the entity.
     */
    protected Specification<Organisation> createSpecification(OrganisationCriteria criteria) {
        Specification<Organisation> specification = Specification.where(null);
        if (criteria != null) {
            // This has to be called first, because the distinct method returns null
            if (criteria.getDistinct() != null) {
                specification = specification.and(distinct(criteria.getDistinct()));
            }
            if (criteria.getId() != null) {
                specification = specification.and(buildRangeSpecification(criteria.getId(), Organisation_.id));
            }
            if (criteria.getName() != null) {
                specification = specification.and(buildStringSpecification(criteria.getName(), Organisation_.name));
            }
            if (criteria.getAgentTypeId() != null) {
                specification = specification.and(
                    buildSpecification(criteria.getAgentTypeId(), root ->
                        root.join(Organisation_.agentType, JoinType.LEFT).get(AgentType_.id)
                    )
                );
            }
        }
        return specification;
    }
}
