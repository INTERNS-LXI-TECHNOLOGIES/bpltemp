package com.bpl.service;

import com.bpl.domain.*; // for static metamodels
import com.bpl.domain.AgentType;
import com.bpl.repository.AgentTypeRepository;
import com.bpl.service.criteria.AgentTypeCriteria;
import com.bpl.service.dto.AgentTypeDTO;
import com.bpl.service.mapper.AgentTypeMapper;
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
 * Service for executing complex queries for {@link AgentType} entities in the database.
 * The main input is a {@link AgentTypeCriteria} which gets converted to {@link Specification},
 * in a way that all the filters must apply.
 * It returns a {@link Page} of {@link AgentTypeDTO} which fulfills the criteria.
 */
@Service
@Transactional(readOnly = true)
public class AgentTypeQueryService extends QueryService<AgentType> {

    private static final Logger LOG = LoggerFactory.getLogger(AgentTypeQueryService.class);

    private final AgentTypeRepository agentTypeRepository;

    private final AgentTypeMapper agentTypeMapper;

    public AgentTypeQueryService(AgentTypeRepository agentTypeRepository, AgentTypeMapper agentTypeMapper) {
        this.agentTypeRepository = agentTypeRepository;
        this.agentTypeMapper = agentTypeMapper;
    }

    /**
     * Return a {@link Page} of {@link AgentTypeDTO} which matches the criteria from the database.
     * @param criteria The object which holds all the filters, which the entities should match.
     * @param page The page, which should be returned.
     * @return the matching entities.
     */
    @Transactional(readOnly = true)
    public Page<AgentTypeDTO> findByCriteria(AgentTypeCriteria criteria, Pageable page) {
        LOG.debug("find by criteria : {}, page: {}", criteria, page);
        final Specification<AgentType> specification = createSpecification(criteria);
        return agentTypeRepository.findAll(specification, page).map(agentTypeMapper::toDto);
    }

    /**
     * Return the number of matching entities in the database.
     * @param criteria The object which holds all the filters, which the entities should match.
     * @return the number of matching entities.
     */
    @Transactional(readOnly = true)
    public long countByCriteria(AgentTypeCriteria criteria) {
        LOG.debug("count by criteria : {}", criteria);
        final Specification<AgentType> specification = createSpecification(criteria);
        return agentTypeRepository.count(specification);
    }

    /**
     * Function to convert {@link AgentTypeCriteria} to a {@link Specification}
     * @param criteria The object which holds all the filters, which the entities should match.
     * @return the matching {@link Specification} of the entity.
     */
    protected Specification<AgentType> createSpecification(AgentTypeCriteria criteria) {
        Specification<AgentType> specification = Specification.where(null);
        if (criteria != null) {
            // This has to be called first, because the distinct method returns null
            if (criteria.getDistinct() != null) {
                specification = specification.and(distinct(criteria.getDistinct()));
            }
            if (criteria.getId() != null) {
                specification = specification.and(buildRangeSpecification(criteria.getId(), AgentType_.id));
            }
            if (criteria.getName() != null) {
                specification = specification.and(buildStringSpecification(criteria.getName(), AgentType_.name));
            }
            if (criteria.getDescription() != null) {
                specification = specification.and(buildStringSpecification(criteria.getDescription(), AgentType_.description));
            }
            if (criteria.getOrganisationId() != null) {
                specification = specification.and(
                    buildSpecification(criteria.getOrganisationId(), root ->
                        root.join(AgentType_.organisations, JoinType.LEFT).get(Organisation_.id)
                    )
                );
            }
        }
        return specification;
    }
}
